module Layout.VerticalCenter exposing (verticalCenter)

import Html exposing (Html, div)
import Html.Attributes exposing (class)


verticalCenter : List (Html msg) -> Html msg
verticalCenter content =
    div [ class "vertical-center" ]
        [ div [ class "vertical-center__height" ]
            [ div [ class "vertical-center__content" ]
                content
            ]
        ]
