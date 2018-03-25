module View exposing (..)

import About.View as About
import Comments.View as Comments
import Home.View as Home
import Html exposing (Html, div, section, text)
import Html.Attributes exposing (class)
import Menu.View as Menu
import Modal.View exposing (getModalDefaults, modalView)
import Type exposing (..)


view : Model -> Html Msg
view model =
    let
        modalDefaults =
            getModalDefaults model
    in
    div [ class "content" ]
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

        -- Generic modal
        , modalView modalDefaults

        -- Component modal
        , modalView
            { modalDefaults
                | id = AddCommentModal
                , class = "add-comment"
                , getContent = Comments.addCommentModalHtml
                , contentModel = model.commentsModel
                , contentTagger = CommentsMsg
            }
        ]
