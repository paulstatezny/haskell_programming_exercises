import Data.List


i :: Num a => a
-- Doesn't work: i :: a
i = 1

f :: Float
-- Doesn't work: f :: Num a => a
f = 1.0


z :: Float
-- Works: z :: Fractional a => a
z = 1.0


{-g :: Float-}
g :: RealFrac a => a
g = 1.0


{-freud::a->a-}
freud :: Ord a => a -> a
freud x = x

{-freud' :: a -> a-}
freud' :: Int -> Int
freud' x = x


myX = 1 :: Int
sigmund :: Int -> Int
-- Won't work: sigmund :: a -> a
sigmund x = myX


sigmund' :: Int -> Int
-- Won't work:
-- sigmund' :: Num a => a -> a

{-
    • Couldn't match expected type ‘a’ with actual type ‘Int’
      ‘a’ is a rigid type variable bound by
        the type signature for:
          sigmund' :: forall a. Num a => a -> a
-}

-- Looks like compiler knows the returned type is more specific
-- than `Num a` so it won't accept `Num a`
sigmund' x = myX


jung :: Ord a => [a] -> a
-- Works (signature is specifying more specific types than necessary, which is ok): jung :: [Int] -> Int
jung xs = head (sort xs)


young :: [Char] -> Char
-- Of course this works; it's the original signature from `jung` above:
-- young :: Ord a => [a] -> a
young xs = head (sort xs)


mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
-- This won't work because we pass the contents of xs to `mySort`,
-- which won't take any `Ord a => [a]` -- you have to pass a [Char]
-- signifier :: Ord a => [a] -> a
signifier xs = head (mySort xs)
