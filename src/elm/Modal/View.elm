module Modal.View exposing (getModalDefaults, modalView)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (defaultOptions, onClick, onWithOptions)
import Json.Decode
import Type exposing (..)


getModalDefaults : Model -> ModalConfig Model () Msg
getModalDefaults model =
    { id = GenericModal
    , class = "generic-modal"
    , model = model
    , getContent =
        model.getModalContent
            |> Maybe.withDefault (\_ -> p [] [ text "..." ])
    , contentModel = ()
    , contentTagger = identity
    }


modalView : ModalConfig Model contentModel subMsg -> Html Msg
modalView config =
    modalHtml
        [ class config.class
        , classList [ ( "active", config.model.activeModal == Just config.id ) ]
        ]
        [ Html.map config.contentTagger (config.getContent config.contentModel)
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
