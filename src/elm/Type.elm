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
    | HideModal


type Route
    = HomePage
    | AboutPage
    | CommentsPage


type ModalId
    = AddCommentModal


type alias Model =
    { route : Maybe Route
    , commentsModel : Comments.Model
    , activeModal : Maybe ModalId
    }


type alias ModalConfig subModel subMsg =
    { id : ModalId
    , class : String
    , view : subModel -> Html subMsg
    , model : subModel
    , tagger : subMsg -> Msg
    }
