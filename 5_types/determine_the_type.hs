{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType
  () where

-- Num a => a
a = (* 9) 6

-- (Num a => a, [Char])
b = head [(0,"doge"),(1,"kitteh")]

-- (Int, [Char])
c = head [(0 :: Integer ,"doge"),(1,"kitteh")]

-- Bool
d = if False then True else False

-- Int
e = length [1, 2, 3, 4, 5]

-- Bool
f = (length [1, 2, 3, 4]) > (length "TACOCAT")


-- Does it compile? Section
-- ✅
bigNum = (^) 5 $ 10

-- 💥 -- can't apply a number to anything; it's not a function
-- wahoo = bigNum $ 10

-- ✅ -- x is just an alias for print, no problems here
x = print
y = print "woohoo!"
z = x "hello world"

-- ✅
a' = (+)
b' = 5

-- 💥 Can't apply number to anything, let's add instead
-- c' = b 10
-- d' = c 200
c' = a' b' 10
d' = a' c' 200


-- Section: Type variable or specific type constructor?
-- (A) fully polymorphic type variable
-- (B) constrained polymorphic type variable
-- (C) concrete type constructor

-- f :: Num a => a -> b -> Int -> Int
--              (B)  (A)   (C)    (C)

-- f :: zed -> Zed -> Blah
--      (A)    (C)    (C)

-- f :: Enum b => a -> b -> C
--               (A)  (B)  (C)

-- f :: f -> g -> C
--     (A)  (A)  (C)

-- Interesting thing about function signatures:
-- The more specific a type, the _more_ types the function can accept but the _less_ we can do with it.
-- The more generic a type, the _less_ types the function can accept but the _more_ we can do with it.


-- A function is polymorphic when its type signature has variables that can represent more than one type. That is, its parameters are polymorphic. Parametric polymorphism refers to fully polymor- phic (unconstrained by a type class) parameters. Parametricity is the property we get from having parametric polymorphism. Para- metricity means that the behavior of a function with respect to the types of its (parametrically polymorphic) arguments is uniform. The behavior can not change just because it was applied to an argument of a different type.


-- Write a type signature Section


functionH :: [a] -> a
functionH (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y =
  if (x > y) then True else False


-- Given a type, write the function Section

functionS :: (a, b) -> b
functionS (x, y) = y

i :: a -> a
i = id

c'' :: a -> b -> a
c'' a b = a


c''' :: b -> a -> b
c''' a b = a


c'''' :: a -> b -> b
c'''' a b = b

r :: [a] -> [a]
r = reverse

co :: (b -> c) -> (a -> b) -> a -> c
co f g x = f $ g x

a'' :: (a -> c) -> a -> a
a'' f a = a

a''' :: (a -> b) -> a -> b
a''' f a = f a


