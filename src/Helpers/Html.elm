module Helpers.Html exposing (blankHtml, removeBlankHtml, maybeHtml, htmlIf, concatClasses)

import Maybe.Extra as Maybe
import Html exposing (Html, text)
import Html.Attributes exposing (class)


blankHtml : Html msg
blankHtml =
    text ""


isBlankHtml : Html msg -> Bool
isBlankHtml =
    (/=) blankHtml


removeBlankHtml : List (Html msg) -> List (Html msg)
removeBlankHtml =
    List.filter isBlankHtml


maybeHtml : (a -> Html msg) -> Maybe a -> Html msg
maybeHtml =
    Maybe.unwrap blankHtml


htmlIf : Bool -> (() -> Html msg) -> Html msg
htmlIf predicate toHtml =
    if predicate then
        toHtml ()
    else
        blankHtml


concatClasses : List String -> Html.Attribute msg
concatClasses classStrings =
    class <| String.join " " classStrings
