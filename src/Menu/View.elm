module Menu.View exposing (..)

import Html exposing (Html, li, section, text, ul)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import Type exposing (Model, Msg(..), Route(..))


view : Model -> Html Msg
view model =
    section []
        [ ul [ class "menu" ]
            [ menuLink model "Home" "home" HomePage
            , menuLink model "About" "about" AboutPage
            , menuLink model "Comments" "comments" CommentsPage
            ]
        ]


menuLink : Model -> String -> String -> Route -> Html Msg
menuLink model label url route =
    li
        [ classList [ ( "selected", Just route == model.route ) ]
        , onClick (ChangeRoute url)
        ]
        [ text label ]
