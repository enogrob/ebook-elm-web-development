module Main exposing (main)

import Html exposing (Html, text)

ourList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

fizzBuzzCheck fizz buzz fizzBuzz num =
    if num % 15 == 0 then
         toString fizzBuzz ++ ", "
     else if num % 5 == 0 then
         toString buzz ++ ", "
     else if num % 3 == 0 then
         toString fizz ++ ", " 
     else 
         (toString num) ++ ", "

main =
 List.map (fizzBuzzCheck "fizz" "buzz" "fizz buzz") ourList
 |> String.concat
 |> text
