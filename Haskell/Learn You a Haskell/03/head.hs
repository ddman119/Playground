head' :: [x] -> x
head' [] = error "Can't return the head of an empty list."
head' (x:_) = x
