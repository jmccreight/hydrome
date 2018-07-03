module View exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, placeholder, style, id, property, attribute, type_)
import Model exposing (Model, model)
import Update exposing (..)
import Select exposing (selectArea)
import Stage exposing (stageArea)
import Run exposing (runArea)
import Feedback exposing (feedbackArea)
import Controller exposing (controller)


view : Model -> Html Msg
view model =
    div [ class "container-fluid h-100 main" ]
        [ areaSelector model.area ]


areaSelector : String -> Html Msg
areaSelector area =
    case area of
        "Landing" ->
            landingArea

        "Select" ->
            selectArea

        "Stage" ->
            stageArea

        "Run" ->
            runArea

        "Feedback" ->
            feedbackArea

        _ ->
            div [] [ text "Outer space" ]


landingArea : Html Msg
landingArea =
    div [ class "row h-100 justify-content-center align-items-center" ]
        [ controller "landing" ]
