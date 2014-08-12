import Text.ParserCombinators.Parsec
import Control.Applicative hiding ((<|>))

type Selector = String
data Rule = Rule String String deriving Show
data Ruleset = Ruleset Selector [Rule] deriving Show

paddedChar c = char c <* spaces

rule :: Parser Rule
rule = do
  key <- many1 letter <* char ':' <* spaces
  value <- many1 (noneOf ";") <* char ';' <* spaces

  return $ Rule key value

ruleset :: Parser Ruleset
ruleset = do
  s <- many1 (noneOf "{")
  r <- paddedChar '{' *> many1 rule <* paddedChar '}'

  return $ Ruleset s r
