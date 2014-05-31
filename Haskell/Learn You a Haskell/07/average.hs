average :: Fractional a => [a] -> a
average [] = 0
average xs = sum xs / fromIntegral(length xs)
