module Comments.Type exposing (..)

import Http


type Msg
    = Refresh
    | SetComments (Result Http.Error (List Comment))
    | ShowAddCommentModal


type ExternalMsg
    = ExtNone
    | ExtShowAddCommentModal


type alias Model =
    { comments : List Comment
    }


type alias Comment =
    { userId : Int
    , id : Int
    , title : String
    , body : String
    }
