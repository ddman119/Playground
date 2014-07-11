import Safe (readMay)

main :: IO ()
main = do
  putStrLn "Please enter your birth year: "
  result <- getLine
  case readMay result of
       Nothing -> putStrLn "You entered an invalid year."
       Just year -> putStrLn $ "Your age in 2020 will be: " ++ show (2020 - year)
