module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode


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
    ( Model (TemperatureInfo "Did not load" 0 0 0 0) ""
    , Cmd.none
    )


type Msg
    = GetTemp
    | CityInput String
    | NewTemp (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
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
        [ input [ placeholder "City", onInput CityInput ] []
        , br [] []
        , button [ onClick GetTemp ] [ text "Get temperature" ]
        , br [] []
        , div [] [ text "Name: ", text model.temperatureInfo.name ]
        , div [] [ text "Temp: ", text (toString model.temperatureInfo.temperature) ]
        , div [] [ text "Wind: ", text (toString model.temperatureInfo.windSpeed) ]
        , div [] [ text "Pressure: ", text (toString model.temperatureInfo.pressure) ]
        , div [] [ text "Humidity: ", text (toString model.temperatureInfo.humidity) ]
        ]


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
            Result.withDefault 0 (Decode.decodeString (Decode.at [ "main", "temp" ] Decode.float) json)

        pressure =
            Result.withDefault 0 (Decode.decodeString (Decode.at [ "main", "pressure" ] Decode.float) json)

        humidity =
            Result.withDefault 0 (Decode.decodeString (Decode.at [ "main", "humidity" ] Decode.float) json)
    in
    TemperatureInfo name windSpeed temperature pressure humidity
