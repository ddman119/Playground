import Data.Char

encode :: Int -> String -> String
encode offset message = map (\c -> chr $ ord c + offset) message

decode :: Int -> String -> String
decode shift message = encode (negate shift) message
