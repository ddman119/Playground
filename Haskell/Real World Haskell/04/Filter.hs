oddList :: [Int] -> [Int]
oddList (x:xs)
  | odd x = x : oddList xs
  | otherwise = oddList xs
oddList _ = []

oddList' :: [Int] -> [Int]
oddList' xs = filter odd xs
