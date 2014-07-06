main :: IO ()
main = do
  putStrLn "Hello! What's your name? "
  inputString <- getLine
  putStrLn $ "Welcome to Haskell, " ++ inputString ++ "!"
