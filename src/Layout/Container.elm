module Layout.Container exposing (container, Container(..), TextAlignment(..))

import Layout.Space as Space exposing (Space(..))
import Helpers.Html exposing (removeBlankHtml, concatClasses)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


type TextAlignment
    = FlushLeft
    | FlushRight
    | Center


type Container
    = InsetContainer Space
    | StackContainer Space
    | InlineContainer Space Space TextAlignment


classSuffix : TextAlignment -> String
classSuffix textAlignment =
    case textAlignment of
        FlushLeft ->
            "flush-left"

        FlushRight ->
            "flush-right"

        Center ->
            "center"


container : Container -> List (Html msg) -> Html msg
container c containerItems =
    let
        modifierClasses =
            case c of
                InsetContainer insetSpace ->
                    [ "container--inset-" ++ (Space.classSuffix insetSpace)
                    ]

                StackContainer stackSpace ->
                    [ "container--stack-" ++ (Space.classSuffix stackSpace)
                    ]

                InlineContainer stackSpace inlineSpace textAlignment ->
                    [ "container--inline-" ++ (Space.classSuffix inlineSpace)
                    , "container--inline-stack-" ++ (Space.classSuffix stackSpace)
                    , "container--" ++ (classSuffix textAlignment)
                    ]

        containerItemView containerItem =
            div [ class "container__item" ]
                [ containerItem ]
    in
        div [ concatClasses <| "container" :: modifierClasses ]
            (List.map containerItemView <| removeBlankHtml containerItems)
