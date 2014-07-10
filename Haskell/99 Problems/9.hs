import Data.List

-- Lame solution:

pack :: (Eq a) => [a] -> [[a]]
pack = group
