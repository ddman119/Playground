fromMaybe def wrapped =
  case wrapped of
    Nothing -> def
    Just value -> value
