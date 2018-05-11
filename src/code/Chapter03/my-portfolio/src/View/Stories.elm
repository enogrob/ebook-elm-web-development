module View.Stories exposing (stories)

import Html exposing (..)
import Html.Attributes exposing (class, href)


stories : Html Never
stories =
    div [ class "" ]
        [ h1 [ class "display-2 mt-5" ]
            [ text "Stories" ]
        , h3 [ class "display-5" ]
            [ text "A List of My stories" ]
        , p [ class "" ]
            [ text "Etiam in libero gravida, viverra ex eu, vehicula leo. Vestibulum eget elementum velit. Fusce viverra erat quis felis auctor, id consequat augue sollicitudin. Vivamus accumsan mi metus, vitae lacinia metus aliquet ornare. Curabitur interdum scelerisque varius. Nullam consequat imperdiet massa eget eleifend." ]
        ]
