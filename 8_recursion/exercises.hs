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
