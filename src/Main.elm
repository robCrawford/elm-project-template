module Main exposing (..)

import Comments exposing (initialModel, subscriptions)
import Navigation
import Types exposing (Model, Msg(..))
import Update exposing (update, updateRoute)
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


initialModel : Model
initialModel =
    { route = Nothing
    , commentsModel = Comments.initialModel
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map CommentsMsg (Comments.subscriptions model.commentsModel)
        ]
