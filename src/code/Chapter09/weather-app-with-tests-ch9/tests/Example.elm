module Example exposing (..)

-- import Fuzz exposing (Fuzzer, int, list, string)

import Expect exposing (Expectation)
import Test exposing (..)


suite : Test
suite =
    describe "A Test Suite"
        [ describe "Testing addition"
            [ test "Addition" <|
                \_ ->
                    Expect.equal 10 (3 + 7)
            ]
        , describe "Using let-in expression in a test suite"
            [ test "Multiplication" <|
                \_ ->
                    let
                        x =
                            2

                        y =
                            4

                        xy =
                            x * y
                    in
                    xy
                        |> (\_ -> Expect.equal 8 (2 * 4))
            ]
        ]
