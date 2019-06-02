module StringExercise3
  () where


thirdLetter :: String -> Char
thirdLetter s =
  s !! 3


letterIndex :: Int -> Char
letterIndex i =
  "Curry is awesome!" !! i


-- Reverse words "Curry is awesome"
rvrs :: String -> String
rvrs s =
  (++) (take 7 $ drop 9 s) $
  (++) " " $
  (++) (take 2 $ drop 6 s) $
  (++) " " $
  (take 5 s)

main :: IO ()
main =
  print $ rvrs "Curry is awesome"
