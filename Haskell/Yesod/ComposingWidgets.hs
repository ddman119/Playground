{-# LANGUAGE TypeFamilies, QuasiQuotes, TemplateHaskell, OverloadedStrings  #-}

import Yesod

data App = App

mkYesod "App" [parseRoutes|
/ HomeR GET
|]

instance Yesod App

firstWidget = do
  toWidget [hamlet|<h1>Title|]
  toWidget [lucius|h1 { color: red; }|]

secondWidget = do
  setTitle "Page title"

finalWidget = do
  firstWidget
  secondWidget

getHomeR = defaultLayout $ do
  finalWidget

main = warp 3000 App
