-- Declare an entirely new type, composed of existing types.
data SomeDataType = Single Int
                  | Double Int Int
                  | NoValue
                    deriving (Show)

printDataTypeInt :: SomeDataType -> Int
printDataTypeInt (Single a) = a
printDataTypeInt (Double a _) = a
printDataTypeInt NoValue = 0

-- Declare a type synonym:

type UniqueID = Int

authenticate :: UniqueID -> Bool
authenticate 42 = True
authenticate _ = False

-- Declare a new type:

newtype OtherUniqueID = OtherUniqueID Int
