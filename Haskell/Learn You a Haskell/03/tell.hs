tell :: (Show a) => [a] -> String
tell [] = "The list is empty."
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[])= "The list has two elements: " ++ show x ++ ", and " ++ show y
tell (x:y:_) = "The list has lots of elements."
