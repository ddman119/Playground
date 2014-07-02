data Color = Red
           | Blue
           | Green

class BasicEq a where
  isEqual :: a -> a -> Bool
  isEqual x y = not (isNotEqual x y)

  isNotEqual :: a -> a -> Bool
  isNotEqual x y = not (isEqual x y)

instance BasicEq Bool where
  isEqual True True = True
  isEqual False False = True
  isEqual _ _ = False

instance BasicEq Color where
  isEqual Red Red = True
  isEqual Blue Blue = True
  isEqual Green Green = True
  isEqual _ _ = False

instance Show Color where
  show Red = "Red Color"
  show Blue = "Blue Color"
  show Green = "Green Color"

instance Read Color where
  -- readsPrec is a function defined by Haskell for parsing a value.
  readsPrec _ value =
    -- tryParse is given a list of tuples, each with a value and corresponding value.
    -- For each tuple, we take the attempt and see if it matches the beginning of the value.
    -- If not, we try again with the next value.
    -- If nothing pans out, we return an empty list.
    tryParse [("Red", Red), ("Green", Green), ("Blue", Blue)]
    where tryParse [] = []
          tryParse ((attempt, result):xs) =
            if take (length attempt) value == attempt
              then [(result, drop (length attempt) value)]
              else tryParse xs
