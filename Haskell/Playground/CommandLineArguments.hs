import qualified System.Environment as E
import qualified System.Directory as D

main :: IO ()
main = do
  name <- E.getProgName
  putStrLn (red name)
  args <- E.getArgs
  print (show args)
  currentDir <- D.getCurrentDirectory
  contents <- D.getDirectoryContents currentDir
  print (show contents)

red :: String -> String
red string = "\ESC[31m" ++ string
