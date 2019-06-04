module Cipher where


import Data.Char


data Case = Upper | Lower deriving (Show, Eq)


case' :: Char -> Maybe Case
case' c
  | isUpper c = Just Upper
  | isLower c = Just Lower
  | otherwise = Nothing


-- Only shifts letters; leaves other characters alone
caesar :: String -> Int -> String
caesar s shift =
  (caesarOne shift) <$> s


unCaesar :: String -> Int -> String
unCaesar s shift =
  (caesarOne $ negate shift) <$> s


caesarOne :: Int -> Char -> Char
caesarOne i c =
  maybe c (rShift c i) (case' c)


rShift :: Char -> Int -> Case -> Char
rShift c i case'' =
  getLetter case''
  $ (+) i
  $ ord c


getLetter :: Case -> Int -> Char
getLetter case'' i
  | i > (caseTop case'')    = getLetter case'' $ i - lettersInAlphabet
  | i < (caseBottom case'') = getLetter case'' $ i + lettersInAlphabet
  | otherwise               = chr i


caseTop :: Case -> Int
caseTop Upper = ord 'Z'
caseTop Lower = ord 'z'


caseBottom :: Case -> Int
caseBottom Upper = ord 'A'
caseBottom Lower = ord 'a'


lettersInAlphabet :: Int
lettersInAlphabet = 26
