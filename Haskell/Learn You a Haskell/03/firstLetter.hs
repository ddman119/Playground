firstLetter :: String -> String
firstLetter "" = "Empty string!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is: " ++ [x]
