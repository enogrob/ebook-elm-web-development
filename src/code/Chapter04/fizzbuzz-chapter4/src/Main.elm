module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { inputValue : String
    , outputValue : String
    }


initModel : Model
initModel =
    { inputValue = ""
    , outputValue = ""
    }



-- Update


type Msg
    = DisplayInput String


update msg model =
    case msg of
        DisplayInput newValue ->
            let
                condition =
                    if (Result.withDefault 1 (String.toInt newValue) % 15) == 0 then
                        "fizzBuzz"
                    else if (Result.withDefault 1 (String.toInt newValue) % 5) == 0 then
                        "buzz"
                    else if (Result.withDefault 1 (String.toInt newValue) % 3) == 0 then
                        "fizz"
                    else if Result.withDefault 0 (String.toInt newValue) /= 0 then
                        newValue
                    else
                        "Type a number, please!"
            in
            { model | outputValue = condition }



-- View


view model =
    div []
        [ div [ class "col-lg-6" ]
            [ div [ class "pt-5 pb-5 display-4" ] [ text "Fizz Buzz App, v4" ]
            , div [ class "input-group" ]
                [ input
                    [ onInput DisplayInput, class "form-control", placeholder "Enter sth", type_ "text" ]
                    []
                , span [ class "input-group-btn" ]
                    [ button [ class "btn btn-secondary", type_ "button" ]
                        [ text "FizzBuzz It!" ]
                    ]
                ]
            , div [ class "display-4" ] [ text (toString model.outputValue) ]
            ]
        ]



-- Main


main =
    beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
