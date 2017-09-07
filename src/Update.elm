module Update exposing (..)

import Comments.Types as Comments
import Comments.Update as Comments
import Navigation
import Task
import Types exposing (Model, Msg(..), Route(..))
import UrlParser


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RouteChange location ->
            updateRoute model location

        ChangeRoute url ->
            ( model
            , Navigation.newUrl url
            )

        CommentsMsg subMsg ->
            let
                ( subModel, subCmd ) =
                    Comments.update subMsg model.commentsModel
            in
            ( { model | commentsModel = subModel }
            , Cmd.map CommentsMsg subCmd
            )


updateRoute : Model -> Navigation.Location -> ( Model, Cmd Msg )
updateRoute model location =
    let
        route =
            UrlParser.parsePath
                (UrlParser.oneOf
                    [ UrlParser.map HomePage UrlParser.top
                    , UrlParser.map HomePage <| UrlParser.s "home"
                    , UrlParser.map AboutPage <| UrlParser.s "about"
                    , UrlParser.map CommentsPage <| UrlParser.s "comments"
                    ]
                )
                location
    in
    ( { model | route = route }
    , Maybe.withDefault Cmd.none <|
        Maybe.map (updateRouteCmd model) route
    )


updateRouteCmd : Model -> Route -> Cmd Msg
updateRouteCmd model route =
    let
        toCmd =
            Task.succeed >> Task.perform identity
    in
    case route of
        CommentsPage ->
            toCmd (CommentsMsg Comments.Refresh)

        _ ->
            Cmd.none
