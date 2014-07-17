newtype SomeList a = SomeList { getSomeList :: [a] } deriving (Show)

main :: IO ()
main = do
  let list = SomeList [1..5] :: SomeList Int
  print list
  print (getSomeList list)
