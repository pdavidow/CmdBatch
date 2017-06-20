module Main exposing (..)

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)


import MusicNotePlayer exposing (playFreqs)
------------------------------------------------

type alias Model = { freqs: List Float}


initialModel: Model
initialModel =
    { freqs = [260, 280, 300]}


init : (Model, Cmd Msg)
init =
    (initialModel, Cmd.none)


type Msg =
    Play


view : Model -> Html Msg
view model =
    div [][ button [ onClick Play ] [ text "Play" ]]


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Play ->
            ( model
            , playFreqs model.freqs
            )


subscriptions : Model -> Sub Msg
subscriptions
    model = Sub.none


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }