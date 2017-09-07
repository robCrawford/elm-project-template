module Types exposing (..)

import Comments.Types as Comments
import Navigation


type Msg
    = RouteChange Navigation.Location
    | ChangeRoute String
    | CommentsMsg Comments.Msg


type Route
    = HomePage
    | AboutPage
    | CommentsPage


type alias Model =
    { route : Maybe Route
    , commentsModel : Comments.Model
    }
