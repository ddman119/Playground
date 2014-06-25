import Data.Char (toUpper)

myMap :: (a -> b) -> [a] -> [b]
myMap f (x:xs) =  f x : myMap f xs
myMap _ _ = []

-- Original:

square :: [Double] -> [Double]
square (x:xs) = (x * x):(square xs)
square [] = []

uppercase :: String -> String
uppercase (x:xs) = (toUpper x):(uppercase xs)
uppercase [] = []

-- Improved with map:

square' :: [Double] -> [Double]
square' xs = map squareNum xs
    where squareNum x = x * x

uppercase' :: String -> String
uppercase' xs = map toUpper xs
