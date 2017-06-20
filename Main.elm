module Main exposing (..)

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)


import MusicNotePlayer exposing (play)
------------------------------------------------

type alias Model = {}

type Msg = Play


view : Model -> Html Msg
view model =
    div [][ button [ onClick Play ] [ text "Play" ]]


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Play ->
            ( model
            , play
            )


subscriptions : Model -> Sub Msg
subscriptions
    model = Sub.none


main =
  Html.program
    { init = ({}, Cmd.none)
    , view = view
    , update = update
    , subscriptions = subscriptions
    }