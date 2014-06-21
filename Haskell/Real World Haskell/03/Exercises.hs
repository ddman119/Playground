import Data.List (sortBy)

-- Exercise 1 & 2:

myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Exercise 3:

myMean [] = 0
myMean xs = fromIntegral(sum(xs)) / fromIntegral(length(xs))

-- Exercise 4:

makePalindrome :: [a] -> [a]
makePalindrome [] = []
makePalindrome xs = xs ++ reverse xs

-- Exercise 5:

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs

-- Exercise 6:

orderByLength :: [a] -> [b] -> Ordering
orderByLength x y = compare (length x) (length y) 

sortByLength :: [[a]] -> [[a]]
sortByLength xs = sortBy (orderByLength) xs

-- Exercise 7 & 8:

intersperse :: a -> [[a]] -> [a]
intersperse _ [] = []
intersperse _ (x:[]) = x
intersperse separator (x:xs) = x ++ separator:(intersperse separator xs)
