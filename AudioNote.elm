module AudioNote exposing (AudioNote)


type alias AudioNote =
    { freq : Float
    , startOffset: Float -- sec
    , stopOffset: Float -- sec
    }
