module DoesItTypecheck where

-- Doesn't typecheck; Person doesn't implement Show
data Person = Person Bool deriving (Show) -- [ADDED] deriving (Show)

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)



-- Doesn't typecheck; Mood doesn't implement Eq
data Mood = Blah
          | Woot deriving (Show, Eq) -- [ADDED] Eq

settleDown x = if x == Woot
                 then Blah
                 else x




type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"




data Rocks = Rocks String deriving (Eq, Show)
data Yeah = Yeah Bool deriving (Eq, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Show)



equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'


comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'

