module Comments.View exposing (..)

import Comments.Type exposing (Model, Msg(..))
import Html exposing (Html, button, div, form, section, text, textarea)
import Html.Attributes exposing (class, placeholder, type_, value)
import Html.Events exposing (onClick, onInput, onSubmit)


view : Model -> Html Msg
view model =
    section [] <|
        button [ onClick ShowAddCommentModal ] [ text "Add comment..." ]
            :: List.map commentHtml model.comments


commentHtml : String -> Html Msg
commentHtml comment =
    div [ class "comment" ] [ text comment ]


addCommentModalHtml : Model -> Html Msg
addCommentModalHtml model =
    div []
        [ div [ class "header" ]
            [ text "Your comment" ]
        , form
            [ class "content"
            , onSubmit (AddComment model.addCommentInput)
            ]
            [ textarea
                [ placeholder "..."
                , onInput SetAddCommentInput
                , value model.addCommentInput
                ]
                []
            , button [ type_ "submit" ] [ text "Submit" ]
            ]
        ]
