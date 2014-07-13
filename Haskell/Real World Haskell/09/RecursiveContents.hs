module RecursiveContents (getRecursiveContents) where

import Control.Monad (forM)
import System.Directory (doesDirectoryExist, getDirectoryContents)
import System.FilePath ((</>))

getRecursiveContents :: FilePath -> IO [FilePath]
getRecursiveContents topDirectory = do
  names <- getDirectoryContents topDirectory
  let properNames = filter (`notElem` [".", ".."]) names
  paths <- forM properNames $ \name -> do
    let path = topDirectory </> name
    isDirectory <- doesDirectoryExist path
    if isDirectory
       then getRecursiveContents path
       else return [path]
  return (concat paths)
