badExample (x:xs) = x + badExample xs

goodExample (x:xs) = x + badExample xs
goodExample _ = 0
