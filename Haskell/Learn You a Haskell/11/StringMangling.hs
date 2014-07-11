import Data.Char

main :: IO ()
main = do line <- fmap (reverse . map toUpper) getLine
          putStrLn line
