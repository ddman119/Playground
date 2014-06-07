import Control.Monad
import Data.Char

main = forever $ do
  putStr "Gimme some input: "
  line <- getLine
  putStrLn $ map toUpper line
