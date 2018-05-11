module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


type alias Model =
    String


model : Model
model =
    ""


type Msg
    = FirstButtonMessage
    | SecondButtonMessage
    | ThirdButtonMessage
    | FourthButtonMessage


update : Msg -> Model -> String
update msg model =
    case msg of
        FirstButtonMessage ->
            """
             You've clicked the "About Me" button!


             I'm a successful writer.

             """

        SecondButtonMessage ->
            """
             You've clicked the "My Poems" button!

             I've written over 50 poems in the last 10 years.

             """

        ThirdButtonMessage ->
            """
             You've clicked the "My Stories" button!

             I've written a short story in the sci-fi genre
             and it won the Nebula award.

             """

        FourthButtonMessage ->
            """
             You've clicked the "Contact Me" button!

             To get in touch, send me an email.
             My email address is: me@example.com

             """


view : Model -> Html Msg
view model =
    div []
        [ h1 [ class "display-4 mt-5" ] [ text "My Portfolio" ]
        , div [ class "container" ]
            [ h2 [ class "strong" ] [ text "Just Another Writer's Portfolio" ]
            , hr [] []
            , div [ class "mt-5" ]
                [ button
                    [ class "btn btn-primary mr-1", onClick FirstButtonMessage ]
                    [ text "About Me" ]
                , button
                    [ class "btn btn-primary mr-1", onClick SecondButtonMessage ]
                    [ text "My Poems" ]
                , button
                    [ class "btn btn-primary mr-1", onClick ThirdButtonMessage ]
                    [ text "My Stories" ]
                , button
                    [ class "btn btn-primary mr-1"
                    , style [ ( "cursor", "pointer" ) ]
                    , onClick FourthButtonMessage
                    ]
                    [ text "Contact Me" ]
                , p [ class "mt-5 lead" ] [ text model ]
                ]
            ]
        ]


main : Program Never String Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
