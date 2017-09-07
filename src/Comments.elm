module Comments exposing (..)

import Comments.Types exposing (Comment, Model, Msg(..))
import Mouse


initialModel : Model
initialModel =
    { comments = []
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Mouse.clicks (\_ -> CatchPageClick)
