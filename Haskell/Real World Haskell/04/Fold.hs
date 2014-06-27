foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' step acc (x:xs) = foldl' step (step acc x) xs
foldl' _ acc [] = acc

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' step acc (x:xs) = step x (foldr step acc xs)
foldr' _ acc [] = acc

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p xs = foldr step [] xs
  where step x ys | p x = x : ys
                  | otherwise = ys
