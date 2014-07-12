half :: Int -> Maybe Int
half x = if even x
            then Just (x `div` 2)
            else Nothing

main :: IO ()
main = putStrLn result
    where result = show (Just 100 >>= half >>= half)
