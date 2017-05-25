module Main exposing (..)

import Main.Update exposing (Msg(..), update, updateRoute)
import Main.View exposing (view)
import Main.ViewModels exposing (Model, initialModel)
import Navigation


main : Program Never Model Msg
main =
    Navigation.program RouteChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( updateRoute initialModel location
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
