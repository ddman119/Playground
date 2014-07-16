import Data.Char (digitToInt)

-- Exercise 1:

toDigits :: Integer -> [Integer]
toDigits int = map (fromIntegral . digitToInt) (show int)

toDigitsRev :: Integer -> [Integer]
toDigitsRev int = reverse $ toDigits int

-- Exercise 2:

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther (x:y:xs) = x : y * 2 : doubleEveryOther xs
doubleEveryOther xs = xs

-- Exercise 3:

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits xs = sum $ map (sum . toDigits) xs

-- Exercise 4:

validate :: Integer -> Bool
validate number = processedNumber `mod` 10 == 0
  where processedNumber = sumDigits . doubleEveryOther . toDigitsRev $ number
