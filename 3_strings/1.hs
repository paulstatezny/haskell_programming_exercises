module StringExercise1
    (
    ) where

-- Given "Curry is awesome"
-- Return "Curry is awesome!"
exclaim :: String -> String
exclaim s =
  (++) s "!"


-- Given "Curry is awesome!"
-- Return "y"
takeChar5 :: String -> String
takeChar5 =
  take 1 . drop 4

-- Given "Curry is awesome!"
-- Return "awesome!"
drop9 =
  drop 9

