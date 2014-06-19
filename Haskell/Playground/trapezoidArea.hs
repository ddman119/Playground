type TopBase = Float
type BottomBase = Float
type Height = Float

data Trapezoid = Trapezoid {
    topBase :: TopBase
  , bottomBase :: BottomBase
  , height :: Height
  } deriving (Show)

trapezoidArea :: Trapezoid -> Float
trapezoidArea (Trapezoid top bottom height) = height * ((top + bottom) / 2.0)
