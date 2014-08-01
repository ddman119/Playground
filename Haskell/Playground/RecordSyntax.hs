data Person = Person { name :: String, age :: Int } deriving (Show)
data Project = Project { owner :: Person } deriving (Show)

setOwnerName :: String -> Project -> Project
setOwnerName newName project = project { owner = (owner project) { name = newName  }  }

main :: IO ()
main = do
  let person = Person { name = "Sam", age = 23 }
  let project = Project { owner = person }
  print project
  let updatedProject = setOwnerName "Samuel" project
  print updatedProject
