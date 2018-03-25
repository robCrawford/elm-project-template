module Type exposing (..)

import Comments.Type as Comments
import Html exposing (Html)
import Navigation


type Msg
    = NoOp
    | RouteChange Navigation.Location
    | ChangeRoute String
    | CommentsMsg Comments.Msg
    | ShowModal ModalId
    | ShowGenericModal (() -> Html Msg)
    | HideModal


type Route
    = HomePage
    | AboutPage
    | CommentsPage


type ModalId
    = GenericModal
    | AddCommentModal


type alias Model =
    { route : Maybe Route
    , commentsModel : Comments.Model
    , activeModal : Maybe ModalId
    , getModalContent : Maybe (() -> Html Msg)
    }


type alias ModalConfig model contentModel contentMsg =
    { id : ModalId
    , class : String
    , model : model
    , getContent : contentModel -> Html contentMsg
    , contentModel : contentModel
    , contentTagger : contentMsg -> Msg
    }
