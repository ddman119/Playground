import Text.ParserCombinators.Parsec

cellParser :: Parser String
cellParser = do
  str <- many1 (char 'a')
  end <- char 'b' <|> char 'c'
  return str `mappend` end
-- cellParser = manyTill (char 'a') endParser

endParser :: Parser Char
endParser = char 'b' <|> char 'c'

parseResult :: Show a => Parser a -> String -> String
parseResult parser str =
  case (parse parser "" str) of
       Left parseError -> show parseError
       Right result -> show result

main :: IO ()
main = do
  putStrLn (parseResult (many1 cellParser) "aaaaabaaaac")
