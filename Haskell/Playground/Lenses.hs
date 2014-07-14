import Control.Lens

data Blog = Blog
    { _name :: String
    , _author :: String
    , _articles :: [Article]
    } deriving (Show)

data Article = Article
    { _title :: String
    , _contents :: String
    } deriving (Show)

name :: Lens' Blog String
score = lens _name (\blog v -> blog { _name = v })
