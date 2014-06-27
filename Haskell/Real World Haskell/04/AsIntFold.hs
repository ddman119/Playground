import Data.Char (digitToInt)

asInt' :: String -> Int
asInt' xs = foldr step 0 xs
  where step x acc = acc * 10 + digitToInt x
