module View.Contact exposing (contact)

import Html exposing (..)
import Html.Attributes exposing (class, href)


contact : Html Never
contact =
    div [ class "card" ]
        [ div [ class "card-header" ]
            [ text "Summer poetry collection " ]
        , div [ class "card-block" ]
            [ h4 [ class "card-title" ]
                [ text "Title of Poem" ]
            , p [ class "card-text" ]
                [ text "Lorem ipsum." ]
            , p [ class "card-text" ]
                [ text "Dolor." ]
            , p [ class "card-text" ]
                [ text "Sit amet." ]
            , p [ class "card-text" ]
                [ text "Consectetur." ]
            , p [ class "card-text" ]
                [ text "Adipiscing elit." ]
            , p [ class "card-text" ]
                [ text "Adipiscing elit." ]
            , p [ class "card-text" ]
                [ small [ class "text-muted" ]
                    [ text "Last updated 3 mins ago" ]
                ]
            ]
        ]
