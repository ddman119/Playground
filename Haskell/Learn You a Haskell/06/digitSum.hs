import Data.Char
import Data.List

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo :: Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]
