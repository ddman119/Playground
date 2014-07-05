-- A contrived example, not from chapter 6.

data Perhaps a = Only a
               | Nada
                 deriving (Show)

class Func f where
  myFmap :: (a -> b) -> f a -> f b

instance Func Perhaps where
  myFmap func (Only a) = Only (func a)
  myFmap _ Nada = Nada

instance Functor Perhaps where
  fmap func (Only a) = Only (func a)
  fmap _ Nada = Nada
