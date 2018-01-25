module Layout.Divider exposing (Divider(..), divider)

import Helpers.Html exposing (concatClasses)
import Html exposing (Html, div, span)
import Html.Attributes exposing (class)


type Divider a
    = ThreePartDivider a a a
    | LeftAndRightDivider a a
    | TopNavAndMain a a


divider : Divider (Html msg) -> Html msg
divider d =
    let
        segmentView s =
            div [ class "divider__segment" ]
                [ s ]

        ( className, segments ) =
            case d of
                ThreePartDivider html1 html2 html3 ->
                    ( "3-part", [ html1, html2, html3 ] )

                LeftAndRightDivider html1 html2 ->
                    ( "left-and-right", [ html1, html2 ] )

                TopNavAndMain html1 html2 ->
                    ( "top-nav-and-main", [ html1, html2 ] )
    in
        div [ concatClasses <| [ "divider", "divider--" ++ className ] ]
            (List.map segmentView segments)
