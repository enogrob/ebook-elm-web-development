module View.Navigation exposing (navigation)

import Html exposing (Html, a, li, text, ul)
import Html.Attributes exposing (class, href)


navigation : Html Never
navigation =
    ul [ class "nav justify-content-center" ]
        [ li [ class "nav-item" ]
            [ a [ class "nav-link active", href "#" ]
                [ text "Active" ]
            ]
        , li [ class "nav-item" ]
            [ a [ class "nav-link", href "#" ]
                [ text "Link" ]
            ]
        , li [ class "nav-item" ]
            [ a [ class "nav-link", href "#" ]
                [ text "Link" ]
            ]
        , li [ class "nav-item" ]
            [ a [ class "nav-link disabled", href "#" ]
                [ text "Disabled" ]
            ]
        ]
