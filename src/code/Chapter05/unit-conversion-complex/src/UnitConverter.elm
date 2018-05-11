module UnitConverter exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { unit1 : String
    , unit2 : String
    , ratio : Float
    , convertedValue : Float
    }


init : String -> String -> Float -> Model
init unit1 unit2 ratio =
    Model unit1 unit2 ratio ratio


view : { b | convertedValue : a, unit1 : String, unit2 : String } -> Html.Html Msg
view model =
    div [ class "site-wrapper" ]
        [ div [ class "inner cover" ]
            [ div [ class "col-lg-12 mb-5" ]
                [ div [ class "input-group mb-3" ]
                    [ div [ class "input-group-prepend" ]
                        [ button [ class "btn btn-warning", type_ "button" ] [ text model.unit1 ]
                        ]
                    , input
                        [ attribute "aria-describedby" "basic-addon1"
                        , attribute "aria-label" ""
                        , class "form-control"
                        , placeholder "Enter a numerical value"
                        , type_ "text"
                        , onInput Convert
                        ]
                        []
                    , div [ class "input-group-append" ]
                        [ button [ onClick Swap, class "btn btn-warning", type_ "button" ] [ text model.unit2 ]
                        , button [ id "unit2Value", class "btn btn-warning", type_ "button" ] [ text (toString model.convertedValue) ]
                        ]
                    ]
                ]
            ]
        ]


type Msg
    = Swap
    | Convert String


update :
    Msg
    -> { b | convertedValue : Float, unit1 : a, unit2 : a, ratio : Float }
    -> { b | convertedValue : Float, unit1 : a, unit2 : a, ratio : Float }
update msg model =
    case msg of
        Swap ->
            { model | unit1 = model.unit2, unit2 = model.unit1, ratio = 1 / model.ratio }

        Convert newValue ->
            let
                floatValue =
                    Result.withDefault 1 (String.toFloat newValue)
            in
            { model | convertedValue = floatValue * model.ratio }
