module Comments.View exposing (..)

import Comments.Types exposing (Comment, Model, Msg(..))
import Html exposing (Html, div, h4, p, section, text)
import Html.Attributes exposing (class)


view : Model -> Html Msg
view model =
    section [] <|
        List.map commentHtml model.comments


commentHtml : Comment -> Html Msg
commentHtml comment =
    div [ class "comment" ]
        [ h4 [] [ text comment.title ]
        , p [] [ text comment.body ]
        ]
