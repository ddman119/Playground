import System.IO
import System.Directory(getTemporaryDirectory, removeFile)
import System.IO.Error(catch)
import Control.Exception(finally)

main :: IO ()
main = withTempFile "mytemp.txt" myAction

{- The main code in the program.
   Works with the path and handle of a temporary file. -}
myAction :: FilePath -> Handle -> IO ()
myAction tempName tempHandle = do
  putStrLn "Welcome to tempfile.hs"
  putStrLn $ "I have a temporary file at " ++ tempName

  position <- hTell tempHandle
  putStrLn $ "My initial position is " ++ show position

  let temporaryData = show [1..10]
  putStrLn $ "Writing one line containing " ++
             show (length temporaryData) ++ " bytes: " ++
             temporaryData
  hPutStrLn tempHandle temporaryData
  
  position <- hTell tempHandle
  putStrLn $ "After writing, my position is: " ++ show position

  putStrLn "The entire contents are: "
  hSeek tempHandle AbsoluteSeek 0

  contents <- hGetContents tempHandle
  putStrLn contents

  putStrLn "Which can also be expressed as this Haskell literal:"
  print contents

withTempFile :: String -> (FilePath -> Handle -> IO a) -> IO a
withTempFile pattern func = do
  temporaryDirectory <- catch (getTemporaryDirectory) (\_ -> return ".")
  (temporaryFile, temporaryHandle) <- openTempFile temporaryDirectory pattern

  finally (func temporaryFile temporaryHandle)
          (do hClose temporaryHandle
              removeFile temporaryFile)
