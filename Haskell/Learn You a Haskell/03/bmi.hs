bmi :: Double -> Double -> String
bmi weight height
  | bmi <= skinny = "Underweight!"
  | bmi <= normal = "Normal!"
  | bmi <= overweight = "Overweight!"
  | otherwise = "Really overweight!"
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        overweight = 30.0
