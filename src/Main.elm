module Main exposing (..)

import UI.Components as UI
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Layout.Space as Space exposing (Space(..))
import Layout.Grid as Grid exposing (GridItem(..))


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    {}


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


initialModel : Model
initialModel =
    {}


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "app" ]
        [ Grid.grid
            ( 8, SpaceM, SpaceZero )
            [ GridItem 1 <| UI.button "Click me!"
            , GridItem 1 <| text "b"
            , GridItem 1 <| text "c"
            ]
        ]
