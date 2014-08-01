data Person = Person { name :: String, age :: Int } deriving (Show)
data Project = Project { owner :: Person } deriving (Show)

data NaiveLens s a = NaiveLens { view :: s -> a, set :: a -> s -> s }

nameLens :: NaiveLens Person String
nameLens = NaiveLens name (\a s -> s { name = a })
