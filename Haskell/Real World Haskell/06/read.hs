main :: IO ()
main = do
  putStrLn "Please enter a number: "
  inputString <- getLine
  let inputDouble = (read inputString)::Double
  putStrLn ("Twice " ++ show inputDouble ++ " is: " ++ show (inputDouble * 2))
