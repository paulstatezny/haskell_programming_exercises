module DataChar where

import Data.Char
import Data.Maybe

capitalize :: String -> String
capitalize "" = ""
capitalize (h:tail) = (toUpper h) : tail

allToUpperRecursive :: String -> String
allToUpperRecursive "" = ""
allToUpperRecursive (h:tail) = (toUpper h) : (allToUpperRecursive tail)


firstToUpper :: String -> Maybe Char
firstToUpper "" = Nothing
firstToUpper s = Just $ toUpper $ head s

firstToUpperPointFree :: String -> Maybe Char
firstToUpperPointFree = (fmap toUpper) . listToMaybe
