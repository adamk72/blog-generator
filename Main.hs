main = putStrLn (makeHtml "My page title" "My page content")

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

head_ content = "<head>" <> content <> "</head>"

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

