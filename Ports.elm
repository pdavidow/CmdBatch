port module Ports exposing (..)

import AudioNote exposing (AudioNote)


port port_playNote : AudioNote -> Cmd msg


