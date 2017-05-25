module Main.View exposing (..)

import Html exposing (Html, div)
import Main.Update exposing (Msg(..))
import Main.ViewModels exposing (Model)
import Menu.View as MenuView


view : Model -> Html Msg
view model =
    div []
        [ MenuView.view model ]
