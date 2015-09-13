module MouseSignals where

import Graphics.Element exposing (down, flow, leftAligned, show, Element)
import List exposing (map)
import Mouse
import Signal exposing ((<~), (~), sampleOn)
import Text exposing (fromString)

combine : a -> b -> Element
combine a b = show (a,b)

showsignals a b c d e f g =
    flow down <|
        map (fromString >> leftAligned) [
            "Mouse.position: " ++ toString a,
            "Mouse.x " ++ toString b,
            "Mouse.y " ++ toString c,
            "Mouse.clicks: " ++ toString d,
            "Mouse.isDown: " ++ toString e,
            "sampleOn Mouse.clicks mouse.position: " ++ toString f,
            "sampleOn Mouse.isDown mouse.position; " ++ toString g
        ]

main =
    showsignals
        <~ Mouse.position
        ~ Mouse.x
        ~ Mouse.y
        ~ Mouse.clicks
        ~ Mouse.isDown
        ~ sampleOn Mouse.clicks Mouse.position
        ~ sampleOn Mouse.isDown Mouse.position
