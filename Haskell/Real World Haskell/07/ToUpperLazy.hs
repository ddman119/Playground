import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
  inputHandle <- openFile "input.txt" ReadMode
  outputHandle <- openFile "output.txt" WriteMode
  inputString <- hGetContents inputHandle

  let result = processData inputString
  hPutStr outputHandle result

  hClose inputHandle
  hClose outputHandle

processData :: String -> String
processData = map toUpper
