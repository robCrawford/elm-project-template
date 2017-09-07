module About.View exposing (..)

import Html exposing (Html, section, text)
import Types exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    section []
        [ text "Sed ultricies dui nec arcu feugiat, in faucibus turpis commodo. Quisque euismod dui vel purus tempus, nec feugiat arcu tristique. Ut nisl magna, tincidunt sit amet hendrerit eu, tempus quis urna. Morbi lorem ex, luctus non congue id, fermentum sed tellus. Suspendisse nec sollicitudin eros, a vestibulum ex. Phasellus semper rutrum lectus, et malesuada enim elementum in. Morbi malesuada enim a ipsum volutpat pulvinar sed at nunc. Cras tincidunt est vel felis tempor." ]
