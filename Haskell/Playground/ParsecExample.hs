import Text.ParserCombinators.Parsec

simple :: Parser Char
simple = letter

openClose :: Parser Char
openClose = do
  char '('
  char ')'

bracketedVariable :: Parser Char
bracketedVariable = do
  char '('
  letter
  char ')'

specificVariables :: Parser Char
specificVariables = do
  char '('
  char 'a' <|> char 'b'
  char ')'

tryParse = try (string "(a)") <|> string "(b)"

parentheses :: Parser ()
parentheses = do
              char '('
              parentheses
              char ')'
              parentheses
            <|> return ()

nesting :: Parser Int
nesting = do
          char '('
          n <- nesting
          char ')'
          m <- nesting
          return (max (n + 1) m)
        <|> return 0

word :: Parser String
word = many1 (letter <?> "") <?> "word"

sentence :: Parser [String]
sentence = do
  parsedWords <- sepBy1 word space
  char '.' <?> "end of sentence"
  return parsedWords

data LogType = Info
             | Error
             | Unknown
               deriving (Eq, Show)

logTypeFromString :: Char -> LogType
logTypeFromString char
  | char == 'I' = Info
  | char == 'E' = Error
  | otherwise = Unknown

logType :: Parser LogType
logType = do
  l <- letter
  char ':'
  return (logTypeFromString l)

run :: Show a => Parser a -> String -> IO ()
run parser input =
  case (parse parser "" input) of
    Left parseError -> putStrLn (show parseError)
    Right result -> print result

main :: IO ()
main = do
  run logType "I:"
  run logType "E:"
  run logType "S:"
