module StandardFunctions where


import Data.List


myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs


myAny :: (a -> Bool) -> [a] -> Bool
myAny f [] = False
myAny f (x:xs) = (f x) || (myAny f xs)


myElem :: Eq a => a -> [a] -> Bool
myElem e [] = False
myElem e (x:xs) = e == x || (myElem e xs)


myElemAny :: Eq a => a -> [a] -> Bool
myElemAny e = any ((==) e)


myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []


squish :: [[a]] -> [a]
squish (x:[]) = x
squish (x:xs) = x ++ (squish xs)


squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f (x:[]) = f x
squishMap f (x:xs) = (f x) ++ (squishMap f xs)


squishAgain :: [[a]] -> [a]
squishAgain = squishMap id


myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f xs =
  foldr
    (\x largest ->
      if (f largest x) == GT then
        largest
      else
        x
    )
    (head xs)
    xs

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f xs =
  foldr
    (\x largest ->
      if (f largest x) == LT then
        largest
      else
        x
    )
    (head xs)
    xs

myMaximum :: (Ord a) => [a] -> a
myMaximum =
  myMaximumBy compare


myMinimum :: (Ord a) => [a] -> a
myMinimum =
  myMinimumBy compare
