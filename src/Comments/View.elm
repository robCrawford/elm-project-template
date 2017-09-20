module Comments.View exposing (..)

import Comments.Type exposing (Comment, Model, Msg(..))
import Html exposing (Html, button, div, h4, p, section, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


view : Model -> Html Msg
view model =
    section [] <|
        button [ onClick ShowAddCommentModal ] [ text "Add comment..." ]
            :: List.map commentHtml model.comments


commentHtml : Comment -> Html Msg
commentHtml comment =
    div [ class "comment" ]
        [ h4 [] [ text comment.title ]
        , p [] [ text comment.body ]
        ]
