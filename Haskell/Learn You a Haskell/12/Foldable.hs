import qualified Data.Foldable as F
import Data.Monoid

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

instance F.Foldable Tree where
  foldMap _ EmptyTree = mempty
  foldMap f (Node x l r) = F.foldMap f l `mappend`
                           f x `mappend`
                           F.foldMap f r
