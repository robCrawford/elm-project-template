module Comments.Types exposing (..)

import Http


type Msg
    = Refresh
    | CatchPageClick
    | SetComments (Result Http.Error (List Comment))


type alias Model =
    { comments : List Comment
    }


type alias Comment =
    { userId : Int
    , id : Int
    , title : String
    , body : String
    }
