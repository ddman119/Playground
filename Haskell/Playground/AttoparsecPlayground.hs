import Text.ParserCombinators.Parsec
import Control.Applicative hiding ((<|>))

data LogType = Log | Info deriving (Show, Eq)

data LogMessage = LogMessage {
  logType :: LogType,
  className :: String,
  lineNumber :: String,
  message :: String
} deriving (Show)

-- Just return Log for now
logTypeParser :: Parser LogType
logTypeParser = char 'L' >> char ':' >> return Log

classNameParser :: Parser String
classNameParser = do
  name <- many1 letter
  _ <- char '.'
  _ <- char 'm'
  return name

lineNumberParser :: Parser String
lineNumberParser = char '(' *> many1 digit <* char ')'

main :: IO ()
main = do
  contents <- readFile "log.txt"
  putStrLn contents
