module Convert where

import qualified Markup
import qualified Html
import qualified Html.Internal as HI

concatStructure :: Markup.Document -> [Html.Structure]
concatStructure list =
  case list of 
    [] -> empty_
    x:xs -> x <> concatStructure xs

convertStructure :: Markup.Structure -> Html.Structure
convertStructure structure =
  case structure of
    Markup.Heading n txt ->
      Html.h_ n txt

    Markup.Paragraph p ->
      Html.p_ p

    Markup.UnorderedList list ->
      Html.ul_ $ map Html.p_ list

    Markup.OrderedList list ->
      Html.ol_ $ map Html.p_ list

    Markup.CodeBlock list ->
      Html.code_ (unlines list)
