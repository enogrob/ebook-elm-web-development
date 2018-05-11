module View.About exposing (about)

import Html exposing (..)
import Html.Attributes exposing (class, href)


about : Html Never
about =
    div [ class "" ]
        [ h1 [ class "display-2 mt-5" ]
            [ text "John Doe" ]
        , h3 [ class "display-5" ]
            [ text "A man of words" ]
        , p [ class "" ]
            [ text "Etiam in libero gravida, viverra ex eu, vehicula leo. Vestibulum eget elementum velit. Fusce viverra erat quis felis auctor, id consequat augue sollicitudin. Vivamus accumsan mi metus, vitae lacinia metus aliquet ornare. Curabitur interdum scelerisque varius. Nullam consequat imperdiet massa eget eleifend." ]
        ]
