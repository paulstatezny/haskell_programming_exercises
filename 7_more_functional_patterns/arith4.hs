module Arith4 where

roundTrip :: (Show a, Read a) => a -> a
-- Original:
-- roundTrip a = read (show a)
-- Pointfree:
roundTrip = read . show

main :: IO ()
main = do
  print (roundTrip 4)
  print ((roundTrip2 4)::Int)

roundTrip2 :: (Show a, Read b) => a -> b
roundTrip2 =
  read . show
