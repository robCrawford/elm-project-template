module Main.Update exposing (..)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import Main.ViewModels exposing (Model, Route(..))
import Navigation
import UrlParser


type Msg
    = RouteChange Navigation.Location
    | ChangeRoute String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RouteChange location ->
            ( updateRoute model location
            , Cmd.none
            )

        ChangeRoute url ->
            ( model
            , Navigation.newUrl url
            )


updateRoute : Model -> Navigation.Location -> Model
updateRoute model location =
    { model | route = UrlParser.parsePath parseRoute location }


parseRoute : UrlParser.Parser (Route -> a) a
parseRoute =
    UrlParser.oneOf
        [ UrlParser.map HomePage UrlParser.top
        , UrlParser.map HomePage (UrlParser.s "home")
        , UrlParser.map AboutPage (UrlParser.s "about")
        ]
