module Main exposing (..)

import Html exposing (beginnerProgram, button, div, h1, input, label, span, text)
import Html.Attributes exposing (class, for, id, placeholder, type_, value)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { unit1 : String
    , unit2 : String
    , ratio : Float
    , convertedValue : Float
    }


initModel : Model
initModel =
    { unit1 = "Kilometers"
    , unit2 = "Miles"
    , ratio = 1.608
    , convertedValue = 0.0
    }


main =
    beginnerProgram { model = initModel, view = view, update = update }


view model =
    div []
        [ div [ class "col-lg-offset-3 col-lg-6 mt5 pt5" ]
            [ h1 []
                [ text "Unit Converter App" ]
            , div [ class "input-group" ]
                [ span [ class "input-group-btn" ]
                    [ button [ class "btn btn-secondary", type_ "button" ]
                        [ text model.unit1 ]
                    ]
                , input [ onInput Convert, class "form-control", placeholder "Type a number to convert", type_ "text" ] []
                , span [ class "input-group-btn" ]
                    [ button [ onClick Swap, class "btn btn-primary", type_ "button" ] [ text "Switch" ]
                    ]
                ]
            , div [ class "mt5 pt5" ] [ text model.unit2 ]
            , div [ id "unit2Value" ] [ text (toString model.convertedValue) ]
            ]
        ]


type Msg
    = Swap
    | Convert String


update msg model =
    case msg of
        Swap ->
            { model | unit1 = model.unit2, unit2 = model.unit1, ratio = 1 / model.ratio }

        Convert newValue ->
            let
                floatValue =
                    Result.withDefault 0 (String.toFloat newValue)
            in
            { model | convertedValue = floatValue * model.ratio }
