module DecoderTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Decoder test"
        [ test "Test decoding valid string" <|
            \_ ->
                let
                    jsonInput =
                        "{\"main\":{\"temp\":303.15,\"pressure\":30,\"humidity\":20},\"wind\":{\"speed\":15.3},\"name\":\"Rome\"}"

                    expectedResult =
                        TemperatureInfo "Rome" 15.3 30.0 30.0 20.0
                in
                Expect.equal expectedResult (decodeTemperatureInfo jsonInput)

        {--
        , test "Test decoding invalid string" <|
            \_ ->
                let
                    jsonInput =
                        "Scrabbled json message"

                    expectedResult =
                        TemperatureInfo "Error decoding data!" 0 0 0 0
                in
                Expect.equal expectedResult (decodeTemperatureInfo jsonInput)
        , fuzz string "Fuzz test decoding invalid string" <|
            \randomlyGeneratedString ->
                let
                    expectedResult =
                        TemperatureInfo "Error decoding data!" 0 0 0 0
                in
                Expect.equal expectedResult (decodeTemperatureInfo randomlyGeneratedString)
-}
        ]
