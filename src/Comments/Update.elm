module Comments.Update exposing (..)

import Comments.Service exposing (fetchComments)
import Comments.Type exposing (ExternalMsg(..), Model, Msg(..))


initialModel : Model
initialModel =
    { comments = []
    }


update : Msg -> Model -> ( Model, Cmd Msg, ExternalMsg )
update msg model =
    case msg of
        Refresh ->
            if List.length model.comments == 0 then
                ( model
                , fetchComments
                , ExtNone
                )
            else
                ( model
                , Cmd.none
                , ExtNone
                )

        SetComments (Ok comments) ->
            ( { model
                | comments = comments
              }
            , Cmd.none
            , ExtNone
            )

        SetComments (Err err) ->
            let
                _ =
                    Debug.log "Error" err
            in
            ( model
            , Cmd.none
            , ExtNone
            )

        ShowAddCommentModal ->
            ( model
            , Cmd.none
            , ExtShowAddCommentModal
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
