module View exposing (..)

import About.View as About
import Comments.View as Comments
import Home.View as Home
import Html exposing (Html, div, text, section)
import Menu.View as Menu
import Types exposing (Model, Msg(..), Route(..))


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
        ]
