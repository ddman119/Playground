main :: IO ()
main = do
  putStrLn "Please enter your birth year: "
  result <- getLine
  putStrLn $ "Your age in 2020 will be: " ++ show (2020 - read result)
