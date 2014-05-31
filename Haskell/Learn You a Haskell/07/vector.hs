data Vector a = Vector a a a deriving (Show)

vAdd :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vAdd` (Vector l m n) = Vector (i + l) (j + m) (k + n)

dotProduct :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `dotProduct` (Vector l m n) = i*l + j*m + k*n

vMultiply :: (Num a) => Vector a -> a -> Vector a
(Vector i j k) `vMultiply` m = Vector (i * m) (j * m) (k * m)
