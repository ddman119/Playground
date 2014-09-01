{-# LANGUAGE RankNTypes #-}

data Person = Person { name :: String, age :: Int } deriving (Show)
data Project = Project { owner :: Person } deriving (Show)

data NaiveLens obj prop = NaiveLens { view :: obj -> prop, update :: (prop -> prop) -> obj -> obj }

set' :: NaiveLens obj prop -> prop -> obj -> obj
set' ln newValue obj = update ln (\_ -> newValue) obj

nameLens :: NaiveLens Person String
nameLens = NaiveLens name (\fn obj -> obj { name = fn (name obj) })
