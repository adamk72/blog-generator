main = putStrLn myhtml

myhtml :: String
myhtml =
  makeHtml
    "Hello title"
    (h1_ "Hello, world!" <> p_ "Let's learn about Haskell!")

makeHtml :: String -> String -> String
makeHtml title content = html_ (head_ (title_ title) <> body_ content)

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
p_ :: String -> String
p_ = el "p" 

h1_ :: String -> String
h1_ = el "h1" 


el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

