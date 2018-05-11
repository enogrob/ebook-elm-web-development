module View.Poem exposing (poem)

import Html exposing (Html, div, h4, p, small, text)
import Html.Attributes exposing (class)


poem : Html Never
poem =
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
