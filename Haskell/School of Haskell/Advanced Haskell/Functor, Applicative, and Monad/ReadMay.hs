import Safe (readMay)

main ::IO ()
main = do
  print (readMay "1980" :: Maybe Integer)
  print (readMay "hello" :: Maybe Integer)
  print (readMay "2000" :: Maybe Integer)
  print (readMay "two-thousand" :: Maybe Integer)
