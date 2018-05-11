module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import UnitConverter exposing (..)


bootstrapCss : Html.Html msg
bootstrapCss =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
            ]

        children =
            []
    in
    node tag attrs children


coverTemplateCss : Html.Html msg
coverTemplateCss =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "//gitcdn.xyz/repo/twbs/bootstrap/v4-dev/docs/4.0/examples/cover/cover.css"
            ]

        children =
            []
    in
    node tag attrs children



-- Model


type alias Model =
    { lengthConverter : UnitConverter.Model
    , weightConverter : UnitConverter.Model
    }


initModel : Model
initModel =
    { lengthConverter = UnitConverter.init "Miles" "Kilometers" 1.608
    , weightConverter = UnitConverter.init "Kilograms" "Pounds" 2.2046
    }



-- Update


type Msg
    = LengthConverterMsg UnitConverter.Msg
    | WeightConverterMsg UnitConverter.Msg


update :
    Msg
    ->
        { c
            | lengthConverter :
                { b1
                    | convertedValue : Float
                    , ratio : Float
                    , unit1 : a1
                    , unit2 : a1
                }
            , weightConverter :
                { b
                    | convertedValue : Float
                    , ratio : Float
                    , unit1 : a
                    , unit2 : a
                }
        }
    ->
        { c
            | lengthConverter :
                { b1
                    | convertedValue : Float
                    , ratio : Float
                    , unit1 : a1
                    , unit2 : a1
                }
            , weightConverter :
                { b
                    | convertedValue : Float
                    , ratio : Float
                    , unit1 : a
                    , unit2 : a
                }
        }
update msg model =
    case msg of
        LengthConverterMsg msg_ ->
            let
                newLengthConverter =
                    UnitConverter.update msg_ model.lengthConverter
            in
            { model | lengthConverter = newLengthConverter }

        WeightConverterMsg msg_ ->
            let
                newWeightConverter =
                    UnitConverter.update msg_ model.weightConverter
            in
            { model | weightConverter = newWeightConverter }



-- View


view :
    { c
        | lengthConverter :
            { b | convertedValue : a, unit1 : String, unit2 : String }
        , weightConverter :
            { b1 | convertedValue : a1, unit1 : String, unit2 : String }
    }
    -> Html Msg
view model =
    div
        [ style
            [ ( "background", "#0575e6" )
            , ( "background", "-webkit-linear-gradient(to right, #0575e6, #021b79)" )
            , ( "background", "linear-gradient(to right, #0575e6, #021b79)" )
            , ( "width", "100vw" )
            , ( "height", "100vh" )
            ]
        ]
        [ bootstrapCss
        , coverTemplateCss
        , div [ class "site-wrapper-inner" ]
            [ div [ class "cover-container" ]
                [ header [ class "masthead clearfix" ]
                    [ div [ class "inner" ]
                        [ h3 [ class "masthead-brand" ]
                            [ text "Unit Converter Site" ]
                        , nav [ class "nav nav-masthead" ]
                            [ a [ class "nav-link text-secondary", href "#" ]
                                [ text "Home" ]
                            , a [ class "nav-link text-secondary", href "#" ]
                                [ text "Features" ]
                            , a [ class "nav-link text-secondary", href "#" ]
                                [ text "Contact" ]
                            ]
                        ]
                    ]
                , h1 [ class "cover-heading" ]
                    [ text "Distance and Weight converter" ]
                , UnitConverter.view model.lengthConverter |> Html.map LengthConverterMsg
                , UnitConverter.view model.weightConverter |> Html.map WeightConverterMsg
                ]
            ]
        ]



-- Main


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
