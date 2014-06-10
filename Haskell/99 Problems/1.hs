-- Original

myLast :: [a] -> a
myLast [x] = x
myLast (_:xs) = myLast xs

-- Improved

myLast' :: [a] -> a
myLast' xs = head . reverse
