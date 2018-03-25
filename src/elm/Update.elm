module Update exposing (..)

import Comments.Type as Comments
import Comments.Update as Comments
import Navigation
import Type exposing (..)
import UrlParser
import Util.Core exposing (toCmd)


initialModel : Model
initialModel =
    { route = Nothing
    , commentsModel = Comments.initialModel
    , activeModal = Nothing
    , getModalContent = Nothing
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        RouteChange location ->
            updateRoute model location

        ChangeRoute url ->
            ( model
            , Navigation.newUrl url
            )

        CommentsMsg subMsg ->
            let
                ( subModel, subCmd, externalMsg ) =
                    Comments.update subMsg model.commentsModel
            in
            ( { model | commentsModel = subModel }
            , Cmd.batch
                [ Cmd.map CommentsMsg subCmd
                , commentsExternalCmd externalMsg
                ]
            )

        ShowModal modalId ->
            ( { model | activeModal = Just modalId }
            , Cmd.none
            )

        ShowGenericModal getHtml ->
            ( { model | getModalContent = Just getHtml }
            , toCmd (ShowModal GenericModal)
            )

        HideModal ->
            ( { model
                | activeModal = Nothing
                , getModalContent = Nothing
              }
            , Cmd.none
            )


commentsExternalCmd : Comments.ExternalMsg -> Cmd Msg
commentsExternalCmd externalMsg =
    case externalMsg of
        Comments.ExtNone ->
            Cmd.none

        Comments.ExtShowAddCommentModal ->
            toCmd (ShowModal AddCommentModal)

        Comments.ExtHideModal ->
            toCmd HideModal


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
    case route of
        CommentsPage ->
            toCmd (CommentsMsg Comments.Refresh)

        _ ->
            Cmd.none


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map CommentsMsg (Comments.subscriptions model.commentsModel)
        ]
