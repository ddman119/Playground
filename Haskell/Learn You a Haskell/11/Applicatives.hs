import Control.Applicative

sumTriple :: (Num a) => a -> a -> a -> a
sumTriple a b c = a + b + c

main :: IO ()
main = do
  let result = Just (sumTriple) <*> Just 1 <*> Just 2 <*> Just 3
  putStrLn (show result)
