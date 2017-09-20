module View exposing (..)

import About.View as About
import Comments.View as Comments
import Home.View as Home
import Html exposing (Html, button, div, form, label, section, text, textarea)
import Html.Attributes exposing (class, classList, placeholder)
import Html.Events exposing (onClick, onWithOptions)
import Json.Decode
import Menu.View as Menu
import Type exposing (ActiveModal(..), Model, Msg(..), Route(..))


view : Model -> Html Msg
view model =
    div []
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

        -- Modals
        , addCommentModal model
        ]


addCommentModal : Model -> Html Msg
addCommentModal model =
    modalView
        [ class "add-comment"
        , classList [ ( "active", model.activeModal == Just AddCommentModal ) ]
        ]
        [ div [ class "header" ]
            [ text "Your comment" ]
        , form [ class "content" ]
            [ textarea [ placeholder "..." ] []
            , button [ onClick HideModal ] [ text "Send" ]
            ]
        ]


modalView : List (Html.Attribute Msg) -> List (Html Msg) -> Html Msg
modalView attr childNodes =
    div
        ([ class "modal-overlay"
         , onClick HideModal
         ]
            ++ attr
        )
        [ div
            [ class "modal-body"
            , onWithOptions "click"
                { stopPropagation = True, preventDefault = True }
                (Json.Decode.succeed NoOp)
            ]
            childNodes
        ]
