-- Original

myButLast :: [a] -> a
myButLast [a, _] = a
myButLast (_, xs) = myButLast xs
