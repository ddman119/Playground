-- Original:

elementAt :: [a] -> Int -> a
elementAt (x:_) 1 = x
elementAt (_:xs) index = elementAt xs (index - 1)
