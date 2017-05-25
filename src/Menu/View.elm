module Menu.View exposing (..)

import Html exposing (Html, a, li, text, ul)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import Main.Update exposing (Msg(..))
import Main.ViewModels exposing (Model, Route(..))


view : Model -> Html Msg
view model =
    ul [ class "menu" ]
        [ menuLink model "Home" "home" HomePage
        , menuLink model "About" "about" AboutPage
        ]


menuLink : Model -> String -> String -> Route -> Html Msg
menuLink model label url route =
    li
        [ classList [ ( "selected", Just route == model.route ) ]
        , onClick (ChangeRoute url)
        ]
        [ text label ]
