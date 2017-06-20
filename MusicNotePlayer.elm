module MusicNotePlayer exposing (play)

import AudioNote exposing (AudioNote)
import Ports exposing (port_playNote)


play : Cmd msg
play =
    Cmd.batch (Debug.log "playCmds" playNotesCmds)


playNotesCmds : List (Cmd msg)
playNotesCmds =
    let
        notes = [ AudioNote 300.0 1.0 2.0
                , AudioNote 310.0 2.0 3.0
                , AudioNote 320.0 3.0 4.0
                ]
    in
        List.map port_playNote notes


