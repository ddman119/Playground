import Control.Applicative

-- Exercise 1:

fmap' func value = return func <$> value

-- Exercise 2:

instance Monad Maybe where
  return = Just
