-- Here, a is the focus and s is the object.
-- For setting a name on a user, String is the focus and User is the object.
--
-- `view` takes a User and return a String, where `set` takes a User, a String, and returns a User.
-- `over` takes a function which takes a String and returns a String, a User, and returns a User.
data NaiveLens s a = NaiveLens {
  view :: s -> a,
  over :: (a -> a) -> s -> s
}

-- In our case, this takes a NaiveLens, a String, a User, and returns a User.
set :: NaiveLens s a -> a -> s -> s
set ln a s = over ln (const a) s

data User = User { name :: String, age :: Int } deriving Show
data Project = Project { owner :: User } deriving Show

nameLens :: NaiveLens User String
nameLens = NaiveLens name (\f s -> s { name = f (name s) })

ageLens :: NaiveLens User Int
ageLens = NaiveLens age (\f s -> s { age = f (age s) })
