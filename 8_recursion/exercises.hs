module Exercises where

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types
flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"


triangularNumber :: (Eq a, Num a) => a -> a
triangularNumber n
  | n == 0    = 0
  | otherwise = n + (triangularNumber $ n - 1)


recursiveMultiply :: (Integral a) => a -> a -> a
recursiveMultiply a b
  | b == 0    = 0
  | otherwise = a + (recursiveMultiply a $ b - 1)



data DividedResult =
    Result Integer
    | DividedByZero
    deriving (Show)


dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
         | n < d = (count, n)
         | otherwise =
             go (n - d) d (count + 1)


-- Using DividedResult


dividedBy' :: Integral a => a -> a -> DividedResult
dividedBy' num denom = go num denom 0
  where go n d count
         | d == 0 = DividedByZero
         | n < d = Result count
         | otherwise =
             go (n - d) d (count + 1)

mc91 :: Integral a => a -> a
mc91 a
  | a > 100   = a - 10
  | otherwise = mc91 $ mc91 $ a + 11
