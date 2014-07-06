nameToReply :: String -> String
nameToReply name =
  "Pleased to meet you, " ++ name ++ "!\n" ++
  "Your name contains " ++ charcount ++ " characters."
  where charcount = show (length name)

main :: IO ()
main = do
  putStrLn "What is your name?"
  name <- getLine
  putStrLn (nameToReply name)
