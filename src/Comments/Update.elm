module Comments.Update exposing (..)

import Comments.Services exposing (fetchComments)
import Comments.Types exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Refresh ->
            ( model
            , if List.length model.comments == 0 then
                fetchComments
              else
                Cmd.none
            )

        CatchPageClick ->
            let
                _ =
                    Debug.log "" "Page click"
            in
            ( model, Cmd.none )

        SetComments (Ok comments) ->
            ( { model
                | comments = comments
              }
            , Cmd.none
            )

        SetComments (Err err) ->
            let
                _ =
                    Debug.log "Error" err
            in
            ( model, Cmd.none )
