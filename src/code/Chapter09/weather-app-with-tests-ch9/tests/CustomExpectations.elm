module CustomExpectations exposing (..)

import Expect exposing (Expectation)
import Json.Decode exposing (decodeString, field, int, list, map2, string)
import Test exposing (..)


type alias Player =
    { name : String
    , language : String
    }


playerDecoder =
    map2 Player
        (field "name" string)
        (field "language" string)


suite : Test
suite =
    describe "A Test Suite"
        [ describe "A custom expectation with a custom decoder"
            [ test "Decoding JSON strings" <|
                \_ ->
                    let
                        json =
                            """
                            {
                            "name" : "John Doe",
                            "language" : "English"
                            }
                            """
                    in
                    case decodeString playerDecoder json of
                        Ok json ->
                            Expect.pass

                        Err err ->
                            Expect.fail err
            ]
        ]
