-- Here, a is the focus and s is the object.
-- For setting a name on a user, String is the focus and User is the object.
--
-- `view` takes a User and return a String, where `set` takes a User, a String, and returns a User.
-- `over` takes a function which takes a String and returns a String, a User, and returns a User.
data NaiveLens s a = NaiveLens {
  view :: s -> a,
  set :: a -> s -> s,
  over :: (a -> a) -> s -> s
}

data User = User { name :: String, age :: Int } deriving Show
data Project = Project { owner :: User } deriving Show

-- `over` here is very similar to the function for `set`, except it calls its f parameter on the new value
-- before setting it.
nameLens :: NaiveLens User String
nameLens = NaiveLens name (\a s -> s { name = a }) (\f s -> s { name = f (name s) })

ageLens :: NaiveLens User Int
ageLens = NaiveLens age (\a s -> s { age = a }) (\f s -> s { age = f (age s) })
