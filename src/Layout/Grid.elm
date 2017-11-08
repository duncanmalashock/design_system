module Layout.Grid exposing (GridItem(..), grid)

import Layout.Space as Space exposing (Space(..))
import Helpers.Html exposing (concatClasses)
import Html exposing (Html, div)


type GridItem msg
    = GridItem Int (Html msg)


grid : ( Int, Space, Space ) -> List (GridItem msg) -> Html msg
grid ( columns, gutterSpace, stackSpace ) gridItems =
    let
        gridModifierClasses =
            [ "grid--columns-" ++ (toString columns)
            , "grid--gutter-" ++ (Space.classSuffix gutterSpace)
            , "grid--stack-" ++ (Space.classSuffix stackSpace)
            ]

        gridItemView (GridItem columnsWide itemHtml) =
            let
                itemModifierClasses =
                    [ "grid__item--" ++ (toString columnsWide) ++ "-columns-wide"
                    ]
            in
                div [ concatClasses <| "grid__item" :: itemModifierClasses ]
                    [ itemHtml ]
    in
        div [ concatClasses <| "grid" :: gridModifierClasses ]
            (List.map gridItemView gridItems)
