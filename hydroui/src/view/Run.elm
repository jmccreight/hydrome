module Run exposing (runArea)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, placeholder, style, id, property, attribute, type_)
import Model exposing (Model, model)
import Update exposing (..)


runArea : Html Msg
runArea =
    div [ class "row h-100 justify-content-center align-items-center" ]
        [ div []
            [ text "Run Area" ]
        ]
