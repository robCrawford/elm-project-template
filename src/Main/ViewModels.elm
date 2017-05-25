module Main.ViewModels exposing (..)


type Route
    = HomePage
    | AboutPage


type alias Model =
    { route : Maybe Route
    }


initialModel : Model
initialModel =
    { route = Nothing
    }
