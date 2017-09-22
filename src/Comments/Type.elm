module Comments.Type exposing (..)

import Http


type Msg
    = Refresh
    | SetComments (Result Http.Error (List String))
    | ShowAddCommentModal
    | AddComment String
    | SetAddCommentInput String


type ExternalMsg
    = ExtNone
    | ExtShowAddCommentModal
    | ExtHideModal


type alias Model =
    { comments : List String
    , addCommentInput : String
    }
