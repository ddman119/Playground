-- Original:

myLength :: [a] -> Int
myLength xs = foldr (\a b -> b + 1) 0 xs
