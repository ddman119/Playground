import Data.List

isInAny :: (Eq a) => [a] -> [[a]] -> Bool
isInAny needle haystack = any inSequence haystack
  where inSequence s = needle `isInfixOf` s

isInAny' :: (Eq a) => [a] -> [[a]] -> Bool
isInAny' needle haystack = any (\s -> needle `isInfixOf` s) haystack
