module StandardFunctions where


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
