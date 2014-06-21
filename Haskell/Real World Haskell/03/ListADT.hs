data List a = Cons a (List a)
            | Nil
              deriving (Show)

fromArray :: [a] -> List a
fromArray (x:xs) = Cons x (fromArray xs)
fromArray [] = Nil

fromList :: List a -> [a]
fromList (Cons x xs) = x:(fromList xs)
fromList Nil = []
