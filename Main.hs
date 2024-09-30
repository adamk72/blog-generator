main :: IO ()
main = putStrLn myhtml

newtype Html = Html String
newtype Structure = Structure String

getStructureString :: Structure -> String
getStructureString (Structure str) = str
{- or:
getStructureString struct =
  case struct of
    Structure str -> str
-}

myhtml :: String
myhtml =
  makeHtml
    "Hello title"
    (h1_ "Hello, world!" <> p_ "Let's learn about Haskell!")

makeHtml :: String -> String -> String
makeHtml title content = html_ (head_ (title_ title) <> body_ content)

render :: Html -> String
render html =
  case html of
    Html str -> str

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) =
  Structure (a <> b)
{- my attempt:
append_ :: Structure -> Structure -> Structure
append_ s1 s2 = Structure (getStructureString s1 <> getStructureString s1)
-}

html_ :: String -> String
html_ = el "html"
{- This works because 'html_' becomes 'el "html"' and so something like 'html_ "foo"' becomes 'el "html" "foo"' which works for 'el' because it takes a String -> String.
-}

body_ :: String -> String
body_ = el "body"

title_ :: String -> String
title_ = el "title"

head_ :: String -> String
head_ = el "head"

p_ :: String -> Structure
p_ = Structure . el "p"
{- previously: 
p_ :: String -> String
p_ = el "p"
-}

h1_ :: String -> String
h1_ = el "h1"

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"