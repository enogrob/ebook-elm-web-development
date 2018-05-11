module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode
import Material
import Material.Button as Button
import Material.Card as Card
import Material.Color as Color
import Material.Elevation as Elevation
import Material.Options as Options
import Material.Scheme
import Material.Textfield as Textfield
import Material.Typography as Typography
import Round exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { temperatureInfo : TemperatureInfo
    , city : String
    , mdl : Material.Model
    }


type alias TemperatureInfo =
    { name : String
    , windSpeed : Float
    , temperature : Float
    , pressure : Float
    , humidity : Float
    }


init : ( Model, Cmd Msg )
init =
    ( Model (TemperatureInfo "Did not load" 0 0 0 0) "" Material.model
    , Cmd.none
    )


type Msg
    = GetTemp
    | CityInput String
    | NewTemp (Result Http.Error String)
    | Mdl (Material.Msg Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg_ ->
            Material.update Mdl msg_ model

        GetTemp ->
            ( model, getTemperature model.city )

        NewTemp (Ok json) ->
            let
                newTemperatureInfo =
                    decodeTemperatureInfo json
            in
            ( { model | temperatureInfo = newTemperatureInfo }, Cmd.none )

        NewTemp (Err _) ->
            ( model, Cmd.none )

        CityInput city ->
            ( { model | city = city }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ Material.Scheme.topWithScheme Color.Orange Color.Red <|
            Textfield.render Mdl
                [ 0 ]
                model.mdl
                [ Textfield.label "City"
                , Textfield.floatingLabel
                , Textfield.text_
                , Textfield.value model.city
                , Options.onInput CityInput
                ]
                []
        , Button.render Mdl
            [ 1 ]
            model.mdl
            [ Button.raised
            , Button.colored
            , Button.ripple
            , Options.onClick GetTemp
            ]
            [ text "Get temperature" ]
        , br [] []
        , Card.view
            [ Options.css "width" "256px"
            , Options.css "margin" "20px"
            , Elevation.e8
            , Elevation.transition 250
            , Color.background (Color.color Color.LightBlue Color.S50)
            ]
            [ Card.title
                [ Options.css "flex-direction" "column" ]
                [ Card.head [] [ text model.city ]
                , Options.div
                    [ Options.css "padding" "2rem 2rem 0 2rem" ]
                    [ Options.span
                        [ Typography.display4
                        , Typography.contrast 0.87
                        , Color.text Color.primary
                        ]
                        [ text (Round.round 0 model.temperatureInfo.temperature ++ "°") ]
                    ]
                ]
            , Card.text []
                [ div [] [ text "Wind: ", text (toString model.temperatureInfo.windSpeed) ]
                , div [] [ text "Pressure: ", text (toString model.temperatureInfo.pressure) ]
                , div [] [ text "Humidity: ", text (toString model.temperatureInfo.humidity) ]
                ]
            ]
        ]
        |> Material.Scheme.top


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


getTemperature : String -> Cmd Msg
getTemperature city =
    let
        url =
            "http://api.openweathermap.org/data/2.5/weather?q=" ++ city ++ "&APPID=b30c7031a64e301cb64ceaa346e24a83"
    in
    Http.send NewTemp (Http.getString url)


decodeTemperatureInfo : String -> TemperatureInfo
decodeTemperatureInfo json =
    let
        name =
            Result.withDefault "Error decoding data!" (Decode.decodeString (Decode.field "name" Decode.string) json)

        windSpeed =
            Result.withDefault 0 (Decode.decodeString (Decode.at [ "wind", "speed" ] Decode.float) json)

        temperature =
            Result.withDefault 0 (Decode.decodeString (Decode.at [ "main", "temp" ] Decode.float) json) - 273.15

        pressure =
            Result.withDefault 0 (Decode.decodeString (Decode.at [ "main", "pressure" ] Decode.float) json)

        humidity =
            Result.withDefault 0 (Decode.decodeString (Decode.at [ "main", "humidity" ] Decode.float) json)
    in
    TemperatureInfo name windSpeed temperature pressure humidity
