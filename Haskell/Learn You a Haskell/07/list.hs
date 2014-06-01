data MyList a = Empty | Cons a (MyList a) deriving (Show, Read, Eq, Ord)
