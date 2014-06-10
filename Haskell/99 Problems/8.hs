-- Original:

import Data.List

compress :: (Eq a) => [a] -> [a]
compress = map head . group
