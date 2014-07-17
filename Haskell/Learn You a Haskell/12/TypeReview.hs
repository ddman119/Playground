--
-- A review of the various ways to define types in Haskell:
--

-- `type` is for defining type synonyms.
-- They are effectively nicknames for existing types, and do not add anything extra on top.
-- We might use them to help clarify some of our type signatures.
--

type AuthenticationKey = String

-- `newtype` defines an entirely new type, based on an existing type.
-- These new types can NOT be used interchangeably with the type they are based on.
-- They can only derive type classes if their type conforms to it.

newtype NewAuthenticationKey = NewAuthenticationKey { getString :: String } deriving (Show)

-- `data` is for making entirely new types, composed of existing ones.

data AuthenticationKeyData = AuthenticationKeyData String
                           | InvalidKey
                           deriving (Show)
