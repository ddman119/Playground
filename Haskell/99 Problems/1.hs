-- Original

myLast :: [a] -> a
myLast [] = error "No list provided"
myLast [x] = x
myLast (_:xs) = myLast xs

-- Improved

myLast' :: [a] -> a
myLast' = head . reverse

-- Output

main :: IO ()
main = do
  putStrLn stringValue
    where lastNumber = myLast [1..10]
          stringValue = "The last number is: " ++ (show lastNumber)
