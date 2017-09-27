module Main exposing (..)

import Navigation
import Type exposing (Model, Msg(..))
import Update exposing (initialModel, subscriptions, update, updateRoute)
import View exposing (view)


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
    updateRoute initialModel location
