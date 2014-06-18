-- Here, we define a series of data types.
--
-- Data types are a way to represent some piece(s) of information in a way that is
-- type safe, and easier to read. Alternatively, we could use tuples to achieve the
-- same goal, but we would miss out on a lot of the benefits that data types give us.

-- BookInfo, MagazineInfo, and BookReview are type constructors.

data BookInfo = Book Int String [String]
                deriving (Show)

-- MagazineInfo is structurally identical to BookInfo, but because it has been defined
-- to a different type, the compiler will not let us use the two interchangeably.
data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

-- We create a new value of type BookInfo by using its data constructor, Book. Its
-- arguments are those we defined in the type constructor: Int String [String].
myInfo = Book 9780135072455 "Algebra of Programming" ["Richard Bird", "Oege de Moor"]

-- Here, we define a few type synonyms. A type synonym is a new name for an existing type.
-- They use the same value constructors as the existing type.
type CustomerID = Int
type ReviewBody = String

-- BookReview is a type with a value constructor of the same name – perfectly legal.
data BookReview = BookReview BookInfo CustomerID String

-- BetterReview is similar to BookReview, but uses a type synonym to increase clarity.
data BetterReview = BetterReview BookInfo CustomerID ReviewBody

type BookRecord = (BookInfo, BookReview)
