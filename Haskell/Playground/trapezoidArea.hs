type TopBase = Int
type BottomBase = Int
type Height = Int

data Trapezoid = Trapezoid {
    topBase :: TopBase
  , bottomBase :: BottomBase
  , height :: Height
  } deriving (Show)

trapezoidArea :: Trapezoid -> Int
trapezoidArea (Trapezoid top bottom height) = height * ((top + bottom) / 2)
trapezoidArea _ = 0
