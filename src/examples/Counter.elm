
module Counter exposing(main)

import Browser
import Html exposing (Html, button, text)
import Html.Events exposing (onClick)


-- MODEL


type alias Model = Int

init : Model
init =
    0


-- UPDATE


type Msg = Increase | Decrease | Reset

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increase ->
            model + 1

        Decrease ->
            model - 1

        Reset ->
            0


-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ button [ onClick Increase ] [ text "+" ]
        , button [ onClick Decrease ] [ text "-" ]
        , Html.div []
            [ text (String.fromInt model) ]
        , Html.div [] []
        , button [ onClick Reset ] [ text "Reset" ]
        ]


-- subscriptions


-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }

