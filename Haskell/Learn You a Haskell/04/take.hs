take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0 = [] -- If we take nothing from a list, we get an empty list.
take' _ [] = [] -- If we take values from an empty list, we get an empty list.
take' n (x:xs) = x : take' (n - 1) xs
