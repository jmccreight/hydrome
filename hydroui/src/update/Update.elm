module Update exposing (..)

import Array
import Draggable
import Model exposing (Model, Position)


type Msg
    = ChangeArea String
    | ModelSelect Int
    | DomainSelect Int
    | OnDragBy Draggable.Delta
    | DragMsg (Draggable.Msg String)


dragConfig : Draggable.Config String Msg
dragConfig =
    Draggable.basicConfig OnDragBy


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeArea area ->
            ( { model | area = area }, Cmd.none )

        ModelSelect index ->
            ( { model | stageModel = Array.get index model.hydroModels }, Cmd.none )

        DomainSelect index ->
            ( { model | stageDomain = Array.get index model.hydroDomains }, Cmd.none )

        OnDragBy ( dx, dy ) ->
            let
                xy =
                    model.controllerXY
            in
                ( { model | controllerXY = Position (xy.x + dx) (xy.y + dy) }
                , Cmd.none
                )

        DragMsg dragMsg ->
            Draggable.update dragConfig dragMsg model
