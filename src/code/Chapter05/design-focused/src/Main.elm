module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


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


coverTemplateCss =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "//rawgit.com/twbs/bootstrap/v4-dev/docs/4.0/examples/cover/cover.css"
            ]

        children =
            []
    in
    node tag attrs children



-- Model


initModel =
    {}



-- Update


type Msg
    = Nothing


update msg model =
    model



-- View


view model =
    div
        [ style
            [ ( "background", "#0575e6" )
            , ( "background", "-webkit-linear-gradient(to right, #0575e6, #021b79)" )
            , ( "background", "linear-gradient(to right, #0575e6, #021b79)" )
            ]
        , class "site-wrapper"
        ]
        [ bootstrapCss
        , coverTemplateCss
        , div [ style [ ( "height", "100vh" ), ( "width", "100vw" ) ], class "site-wrapper-inner" ]
            [ div [ class "cover-container" ]
                [ header [ class "masthead clearfix" ]
                    [ div [ class "inner" ]
                        [ h3 [ class "masthead-brand" ]
                            [ text "Unit Converter" ]
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
                , div [ class "inner cover" ]
                    [ h1 [ class "cover-heading" ]
                        [ text "Distance converter" ]
                    , div [ class "col-lg-12 mb-5" ]
                        [ div [ class "input-group mb-3" ]
                            [ div [ class "input-group-prepend" ]
                                [ button [ class "btn btn-secondary", type_ "button" ]
                                    [ text "Kilometers:" ]
                                ]
                            , input [ attribute "aria-describedby" "basic-addon1", attribute "aria-label" "", class "form-control", placeholder "", type_ "text" ]
                                []
                            , div [ class "input-group-append" ]
                                [ button [ class "btn btn-secondary", type_ "button" ]
                                    [ text "Miles:" ]
                                , button [ class "btn btn-secondary", type_ "button" ]
                                    [ text "0.0" ]
                                ]
                            ]
                        ]
                    ]
                , div [ class "inner cover" ]
                    [ h1 [ class "cover-heading" ]
                        [ text "Weight converter" ]
                    , div [ class "col-lg-offset-12" ]
                        [ div [ class "input-group mb-3" ]
                            [ div [ class "input-group-prepend" ]
                                [ button [ class "btn btn-secondary", type_ "button" ]
                                    [ text "Kilograms:" ]
                                ]
                            , input [ attribute "aria-describedby" "basic-addon1", attribute "aria-label" "", class "form-control", placeholder "", type_ "text" ]
                                []
                            , div [ class "input-group-append" ]
                                [ button [ class "btn btn-secondary", type_ "button" ]
                                    [ text "Pounds:" ]
                                , button [ class "btn btn-secondary", type_ "button" ]
                                    [ text "0.0" ]
                                ]
                            ]
                        ]
                    ]
                , footer [ class "mastfoot" ]
                    [ div [ class "inner text-secondary" ]
                        [ p []
                            [ text "Cover template for "
                            , a [ href "https://getbootstrap.com/" ]
                                [ text "Bootstrap" ]
                            , text ", by "
                            , a [ href "https://twitter.com/mdo" ]
                                [ text "@mdo" ]
                            , text "."
                            ]
                        ]
                    ]
                ]
            ]
        ]



-- Main


main =
    beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
