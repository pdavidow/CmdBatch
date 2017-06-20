module MusicNotePlayer exposing (playFreqs)

import AudioNote exposing (AudioNote)
import Ports exposing (port_playNote)


noteDuration = 1.0
gapDuration = 0.5
interval = noteDuration + gapDuration


playFreqs : List Float -> Cmd msg
playFreqs freqs =
    let
        totalInterval = interval * toFloat (List.length freqs)
        playCmds = playFreqsCmds freqs
    in
        Cmd.batch (Debug.log "playCmds" playCmds)


playFreqsCmds : List Float -> List (Cmd msg)
playFreqsCmds freqs =
    let
        notes = audioNotesFor freqs
    in
        List.map port_playNote notes


audioNotesFor : List Float -> List AudioNote
audioNotesFor freqs =
    let
        func: Int -> Float -> AudioNote
        func index freq =
            let
                startOffset =  (toFloat index) * interval
                stopOffset =  startOffset + noteDuration
            in
                AudioNote freq (startOffset) (stopOffset)
    in
        List.indexedMap func freqs