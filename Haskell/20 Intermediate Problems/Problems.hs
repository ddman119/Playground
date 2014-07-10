class Fluffy f where
  furry :: (a -> b) -> f a -> f b

instance Fluffy [] where
  furry _ [] = []
  furry func (x:xs) = func x : furry func xs

instance Fluffy Maybe where
  furry _ Nothing = Nothing
  furry func (Just a) = Just (func a)
