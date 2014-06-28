suffixes :: [a] -> [[a]]
suffixes xs@(_:xs') = xs : suffixes xs'
suffixes _ = []

compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)
