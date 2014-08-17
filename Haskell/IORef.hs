import Data.IORef

alter :: IORef (Maybe Int) -> IO ()
alter ref = do
  value <- readIORef ref
  case value of
       Just _ -> return ()
       Nothing -> writeIORef ref (Just 42)

squareInt :: IORef Int -> IO ()
squareInt ref = do
  value <- readIORef ref
  writeIORef ref (value ^ 2)

main :: IO ()
main = do
  ref <- newIORef 10
  squareInt ref

  readIORef ref >>= print
