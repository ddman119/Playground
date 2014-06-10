-- Original:

myLength :: [a] -> Int
myLength = foldr (\a b -> b + 1) 0
