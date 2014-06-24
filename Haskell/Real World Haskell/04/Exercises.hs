-- Exercise 1:

safeList :: ([t] -> a) -> [t] -> Maybe a
safeList _ [] = Nothing
safeList func xs = Just (func xs)

safeHead :: [a] -> Maybe a
safeHead = safeList head

safeTail :: [a] -> Maybe [a]
safeTail = safeList tail

safeLast :: [a] -> Maybe a
safeLast = safeList last

safeInit :: [a] -> Maybe [a]
safeInit = safeList init

-- Exercise 2:

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith func [] = []
