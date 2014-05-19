maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Maximum of empty list!"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
