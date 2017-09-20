module Type exposing (..)

import Comments.Type as Comments
import Navigation


type Msg
    = NoOp
    | RouteChange Navigation.Location
    | ChangeRoute String
    | CommentsMsg Comments.Msg
    | ShowModal ActiveModal
    | HideModal


type Route
    = HomePage
    | AboutPage
    | CommentsPage


type ActiveModal
    = AddCommentModal


type alias Model =
    { route : Maybe Route
    , commentsModel : Comments.Model
    , activeModal : Maybe ActiveModal
    }
