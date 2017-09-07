module Home.View exposing (..)

import Html exposing (Html, section, text)
import Types exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    section []
        [ text "Welcome!" ]
