{-# LANGUAGE RankNTypes #-}

data Person = Person { name :: String, age :: Int } deriving (Show)
data Project = Project { owner :: Person } deriving (Show)

data Const a b = Const { getConst :: a}
data Identity a = Identity { runIdentity :: a }

instance Functor (Const a) where
  fmap _ (Const a) = Const a

instance Functor Identity where
  fmap fn (Identity a) = Identity (fn a)

type Lens obj prop = Functor f => (prop -> f prop) -> obj -> f obj

view :: Lens obj prop -> obj -> prop
view ln obj = getConst $ ln Const obj

update :: Lens obj prop -> (prop -> prop) -> obj -> obj
update ln fn obj = runIdentity $ ln (Identity . fn) obj

set :: Lens obj prop -> prop -> obj -> obj
set ln newValue = update ln (const newValue)

nameLens :: Lens Person String
nameLens fn person = fmap (\newName -> person { name = newName }) (fn $ name person)
