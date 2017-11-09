module UI.Components exposing (..)

import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class)


button : String -> Html msg
button buttonText =
    Html.button [ class "button" ]
        [ text buttonText ]
