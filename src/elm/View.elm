module View exposing (..)

import About.View as About
import Comments.View as Comments
import Home.View as Home
import Html exposing (Html, div, section, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (defaultOptions, onClick, onInput, onWithOptions)
import Json.Decode
import Menu.View as Menu
import Type exposing (..)


view : Model -> Html Msg
view model =
    div [ class "content"]
        [ Menu.view model
        , case model.route of
            Just HomePage ->
                Home.view model

            Just AboutPage ->
                About.view model

            Just CommentsPage ->
                Html.map CommentsMsg (Comments.view model.commentsModel)

            Nothing ->
                section [] [ text "Unknown page." ]

        , modalView model
            { id = AddCommentModal
            , class = "add-comment"
            , view = Comments.addCommentModalHtml
            , model = model.commentsModel
            , tagger = CommentsMsg
            }
        ]


modalView : Model -> ModalConfig subModel subMsg -> Html Msg
modalView model config =
    modalHtml
        [ class config.class
        , classList [ ( "active", model.activeModal == Just config.id ) ]
        ]
        [ Html.map config.tagger (config.view config.model)
        ]


modalHtml : List (Html.Attribute Msg) -> List (Html Msg) -> Html Msg
modalHtml attr children =
    div
        ([ class "modal-overlay"
         , onClick HideModal
         ]
            ++ attr
        )
        [ div
            [ class "modal-body"
            , onWithOptions "click"
                { defaultOptions | stopPropagation = True }
                (Json.Decode.succeed NoOp)
            ]
            children
        ]
