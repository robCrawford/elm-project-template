module Comments.Service exposing (..)

import Comments.Type exposing (Msg(..))
import Http
import Json.Decode as Decode


fetchComments : Cmd Msg
fetchComments =
    Http.send SetComments <|
        Http.get "http://jsonplaceholder.typicode.com/posts" commentsResponseDecoder


commentsResponseDecoder : Decode.Decoder (List String)
commentsResponseDecoder =
    Decode.list commentDecoder


commentDecoder : Decode.Decoder String
commentDecoder =
    Decode.field "body" Decode.string
