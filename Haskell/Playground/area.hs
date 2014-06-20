-- Trapezoids:

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

-- Circles:

type Diameter = Float
type Area = Float

circleArea :: Diameter -> Area
circleArea 0 = 0
circleArea x = pi * (x * x)
