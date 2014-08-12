import Text.ParserCombinators.Parsec

type Selector = String
data Rule = Rule String String deriving Show
data Ruleset = Ruleset Selector [Rule] deriving Show

rule :: Parser Rule
rule = do
  key <- many1 letter
  char ':'
  spaces
  
  value <- many1 (noneOf ";")
  char ';'
  spaces

  return $ Rule key value

ruleset :: Parser Ruleset
ruleset = do
  name <- many1 (noneOf "{")
  char '{'
  spaces

  r <- many1 rule
  char '}'
  spaces

  return $ Ruleset name r
