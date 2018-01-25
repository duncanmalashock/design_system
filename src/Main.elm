module Main exposing (..)

-- import UI.Components as UI

import Html exposing (Html, div, text, a, button)
import Html.Attributes exposing (class, src, href)
import Svg exposing (svg, path)
import Svg.Attributes exposing (d, viewBox)
import Layout.Divider as Divider
import Layout.Container exposing (Container(..), TextAlignment(..), container)
import Layout.VerticalCenter exposing (verticalCenter)
import Layout.Space exposing (Space(..))
import Helpers.Html exposing (concatClasses)


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


type SectionLink
    = Active
    | Inactive


sectionLink : SectionLink -> String -> Maybe String -> Html msg
sectionLink activeState sectionTitle count =
    let
        className =
            case activeState of
                Active ->
                    "active"

                Inactive ->
                    "inactive"
    in
        a
            [ concatClasses <| [ "section-link", "section-link--" ++ className ]
            , href "#"
            ]
            [ Divider.divider <|
                Divider.LeftAndRightDivider
                    (verticalCenter
                        [ div [ class "section-link__title" ]
                            [ text sectionTitle ]
                        ]
                    )
                    (verticalCenter
                        [ div [ class "section-link__count" ]
                            [ text (Maybe.withDefault "" count) ]
                        ]
                    )
            ]


topNavView : Html Msg
topNavView =
    div [ class "top-nav" ]
        [ Divider.divider <|
            Divider.LeftAndRightDivider
                (verticalCenter
                    [ container (InlineContainer SpaceZero SpaceL FlushLeft)
                        [ logo
                        ]
                    ]
                )
                (verticalCenter
                    [ container (InlineContainer SpaceZero SpaceL FlushRight)
                        [ menuLink "Help"
                        , menuLink "Account"
                        ]
                    ]
                )
        ]


logo : Html Msg
logo =
    a [ href "#" ]
        [ div [ class "logo" ]
            [ container (InlineContainer SpaceZero SpaceS FlushLeft)
                [ div [ class "logo__logo" ] []
                ]
            ]
        ]


submission : String -> String -> Html msg
submission submissionText submitterName =
    button [ class "submission" ]
        [ div [ class "submission-content" ]
            [ div [ class "submission__actions" ]
                [ container (StackContainer SpaceZero)
                    [ starButton
                    ]
                ]
            , div [ class "submission__main-data" ]
                [ container (StackContainer SpaceM)
                    [ div [ class "submission-text" ]
                        [ div [ class "text" ]
                            [ text <| "“" ++ submissionText ++ "”" ]
                        ]
                    , div [ class "submitter-name" ]
                        [ container (InlineContainer SpaceZero SpaceS FlushLeft)
                            [ avatar submitterName
                            , container (InlineContainer SpaceZero SpaceXS FlushLeft)
                                [ submitBadge "3"
                                , voteBadge "17"
                                ]
                            ]
                        ]
                    ]
                ]
            , div [ class "submission__date-data" ]
                [ text "Feb. 1" ]
            ]
        ]


avatar : String -> Html msg
avatar name =
    div [ class "avatar" ]
        [ container (InlineContainer SpaceZero SpaceS FlushLeft)
            [ avatarIcon
            , text name
            ]
        ]


voteBadge : String -> Html msg
voteBadge voteCount =
    div [ class "vote-badge" ]
        [ container (InlineContainer SpaceZero SpaceXS FlushLeft)
            [ voteIcon
            , text voteCount
            ]
        ]


submitBadge : String -> Html msg
submitBadge submitCount =
    div [ class "submit-badge" ]
        [ container (InlineContainer SpaceZero SpaceXS FlushLeft)
            [ submitIcon
            , text submitCount
            ]
        ]


starButton : Html msg
starButton =
    button
        [ class "icon-button" ]
        [ svg
            [ viewBox "0 0 100 100"
            , Svg.Attributes.class "star-icon"
            ]
            [ path
                [ Svg.Attributes.class "star-icon__star"
                , d "M44.7,8.4c2.1-4.2,9-4,10.8,0.4c3.7,7.5,7.1,15.1,10.8,22.7c8.4,1.1,16.8,2,25.1,3.2c4.6,0.4,7,6.8,3.7,10.1 c-6,6.1-12.5,11.7-18.7,17.7c1.5,8.2,3.2,16.4,4.7,24.7c1.2,4.7-4.5,9.1-8.8,6.6c-7.6-3.8-14.9-8.2-22.3-12.1 c-7.2,3.9-14.3,7.9-21.5,11.8c-3,2.1-7.6,0.9-9.1-2.5c-1.1-2.2-0.3-4.6,0-6.9c1.4-7.2,2.8-14.4,4.2-21.6 c-6.1-5.7-12.3-11.3-18.3-17.1c-2.5-2.2-2.7-6.3-0.4-8.7c1.8-2.1,4.7-2,7.2-2.4c7.2-0.9,14.4-1.8,21.6-2.7 C37.4,23.8,40.8,16,44.7,8.4L44.7,8.4z"
                ]
                []
            ]
        ]


voteIcon : Html msg
voteIcon =
    div
        [ class "icon" ]
        [ svg
            [ viewBox "0 0 100 100"
            , Svg.Attributes.class "vote-icon"
            ]
            [ path
                [ Svg.Attributes.class "vote-icon__vote"
                , d "M37.4,88.6l-37-37l14.2-14.2l22.8,22.8l48.4-48.4L100,26L37.4,88.6z"
                ]
                []
            ]
        ]


submitIcon : Html msg
submitIcon =
    div
        [ class "icon" ]
        [ svg
            [ viewBox "0 0 100 100"
            , Svg.Attributes.class "submit-icon"
            ]
            [ Svg.polygon
                [ Svg.Attributes.class "submit-icon__submit"
                , Svg.Attributes.points "91.7,40.2 59.6,40.2 59.6,8.1 39.8,8.1 39.8,40.2 7.7,40.2 7.7,60 39.8,60 39.8,92.1 59.6,92.1 59.6,60 91.7,60"
                ]
                []
            ]
        ]


avatarIcon : Html msg
avatarIcon =
    div
        [ class "icon" ]
        [ svg
            [ viewBox "0 0 100 100"
            , Svg.Attributes.class "avatar-icon"
            ]
            [ Svg.g
                [ Svg.Attributes.transform "translate(0,-952.36218)" ]
                [ path
                    [ Svg.Attributes.class "avatar-icon__avatar"
                    , d "M50,955.7c-10.2,0-18.4,8.2-18.4,18.4s8.2,18.4,18.4,18.4s18.4-8.2,18.4-18.4S60.2,955.7,50,955.7z M50,1002.4 c-20.4,0-42.8,11.3-42.8,24.6v22.1h85.7V1027C92.8,1013.6,70.4,1002.4,50,1002.4L50,1002.4z"
                    ]
                    []
                ]
            ]
        ]


menuLink : String -> Html Msg
menuLink linkText =
    verticalCenter
        [ a [ class "menu-link", href "#" ]
            [ text linkText
            , div [ class "menu" ] []
            ]
        ]


topNavShim : Html msg
topNavShim =
    div [ class "top-nav-shim" ] []


topNavAndMainView : Html Msg
topNavAndMainView =
    div [ class "full-height" ] <|
        [ Divider.divider
            (Divider.TopNavAndMain
                (text "")
                (mainPageView)
            )
        ]


mainPageView : Html Msg
mainPageView =
    div [ class "main" ]
        [ Divider.divider <|
            Divider.ThreePartDivider
                (container (StackContainer SpaceL)
                    [ container (StackContainer SpaceM)
                        [ header3 "Submissions"
                        , container (StackContainer SpaceZero)
                            [ sectionLink Active "Your New" (Just "12")
                            , sectionLink Inactive "All New" (Just "59")
                            , sectionLink Inactive "Starred" (Just "18")
                            , sectionLink Inactive "Voting" (Just "6")
                            , sectionLink Inactive "Archived" (Just "914")
                            ]
                        ]
                    , container (StackContainer SpaceM)
                        [ header3 "Participants"
                        , container (StackContainer SpaceZero)
                            [ sectionLink Inactive "All Participants" (Just "172")
                            , sectionLink Inactive "Submitters" (Just "83")
                            , sectionLink Inactive "Voters" (Just "207")
                            ]
                        ]
                    , container (StackContainer SpaceM)
                        [ header3 "Tools"
                        , container (StackContainer SpaceZero)
                            [ sectionLink Inactive "Analytics" Nothing
                            , sectionLink Inactive "Lists" (Just "38")
                            , sectionLink Inactive "Embeds" (Just "2")
                            ]
                        ]
                    , container (StackContainer SpaceM)
                        [ header3 "Team"
                        , container (StackContainer SpaceZero)
                            [ sectionLink Inactive "Users" (Just "5")
                            , sectionLink Inactive "Settings" Nothing
                            ]
                        ]
                    ]
                )
                (div []
                    [ submission "Where did the beer chaser served with a Bloody Mary originate? I've only seen this in Milwaukee." "Jessie F."
                    , submission "What can the city do to prevent potential fires under more highways?" "Derek"
                    , submission "Why don’t we ever hear about what happened to the old street signs near the bay? Where did they end up?" "Stacy"
                    , submission "Why is Austin's African-American population declining when the city population is booming?" "Tom James"
                    , submission "What's that religious building across the street from Obama's house in Hyde Park?" "Jane Doe"
                    , submission "Could McKinney surpass Frisco as the fastest-growing city in the U.S.?" "Rodney"
                    , submission "Where did the beer chaser served with a Bloody Mary originate? I've only seen this in Milwaukee." "Jessie F."
                    , submission "What can the city do to prevent potential fires under more highways?" "Derek"
                    , submission "Why don’t we ever hear about what happened to the old street signs near the bay? Where did they end up?" "Stacy"
                    , submission "Why is Austin's African-American population declining when the city population is booming?" "Tom James"
                    , submission "What's that religious building across the street from Obama's house in Hyde Park?" "Jane Doe"
                    , submission "Could McKinney surpass Frisco as the fastest-growing city in the U.S.?" "Rodney"
                    ]
                )
                (text "")
        ]


header3 : String -> Html msg
header3 string =
    div [ class "header3" ]
        [ text string ]


view : Model -> Html Msg
view model =
    div [ class "full-page" ]
        [ topNavView
        , topNavAndMainView
        ]
