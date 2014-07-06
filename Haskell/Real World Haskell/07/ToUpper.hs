import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
  inputFile <- openFile "input.txt" ReadMode
  outputFile <- openFile "output.txt" WriteMode
  mainLoop inputFile outputFile
  hClose inputFile
  hClose outputFile

mainLoop :: Handle -> Handle -> IO ()
mainLoop input output =
  do isEndOfFile <- hIsEOF input
     if isEndOfFile
        then return ()
        else do inputString <- hGetLine input
                hPutStrLn output (map toUpper inputString)
                mainLoop input output
