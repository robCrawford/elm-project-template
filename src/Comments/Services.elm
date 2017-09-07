module Comments.Services exposing (..)

import Comments.Types exposing (Comment, Msg(..))
import Http
import Json.Decode as Decode


fetchComments : Cmd Msg
fetchComments =
    Http.send SetComments <|
        Http.get "http://jsonplaceholder.typicode.com/posts/" commentsResponseDecoder


commentsResponseDecoder : Decode.Decoder (List Comment)
commentsResponseDecoder =
    Decode.list commentDecoder


commentDecoder : Decode.Decoder Comment
commentDecoder =
    Decode.map4 Comment
        (Decode.field "userId" Decode.int)
        (Decode.field "id" Decode.int)
        (Decode.field "title" Decode.string)
        (Decode.field "body" Decode.string)
