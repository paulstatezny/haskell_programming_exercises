module ChSevenExercises where

tensDigit :: Integral a => a -> a
-- tensDigit x = d
--   where xLast = x `div` 10
--         d = xLast `mod` 10

tensDigit x =
  snd
  $ (flip divMod) 10
  $ div x 10


hunsD x =
  snd
  $ (flip divMod) 10
  $ div x 100


foldBool :: a -> a -> Bool -> a
foldBool a b pickFirst =
  case pickFirst of
    True ->
      a

    False ->
      b


foldBoolGuard :: a -> a -> Bool -> a
foldBoolGuard a b pickFirst
  | pickFirst = a
  | otherwise = b


g :: (a -> b) -> (a, c) -> (b, c)
g f a =
  ( f $ fst a
  , snd a
  )
