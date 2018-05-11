module View.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import View.About exposing (..)
import View.Contact exposing (..)
import View.Navigation exposing (..)
import View.Poem exposing (..)
import View.Stories exposing (..)


view : Html Never
view =
    div [ class "container-fluid" ]
        [ div [ class "container" ]
            [ h1 [] [ text "My Portfolio" ]
            , p [] [ text "Just Another Writer's Portfolio" ]
            , navigation
            , about
            , div [ class "row" ]
                [ div [ class "col-md-4 mb-5" ]
                    [ poem ]
                , div [ class "col-md-4 mb-5" ]
                    [ poem ]
                , div [ class "col-md-4 mb-5" ]
                    [ poem ]
                ]
            , stories
            , contact
            ]
        ]
