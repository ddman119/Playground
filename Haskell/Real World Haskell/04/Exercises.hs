-- Exercise 1:

safeList func [] = Nothing
safeList func xs = Just (func xs)

safeHead :: [a] -> Maybe a
safeHead = safeList head

safeTail :: [a] -> Maybe [a]
safeTail = safeList tail

safeLast :: [a] -> Maybe a
safeLast = safeList last

safeInit :: [a] -> Maybe [a]
safeInit = safeList init
