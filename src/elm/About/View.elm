module About.View exposing (..)

import Html exposing (Html, button, div, form, input, p, section, text)
import Html.Attributes exposing (class, placeholder, type_)
import Html.Events exposing (onClick)
import Type exposing (ModalId(..), Model, Msg(..))


view : Model -> Html Msg
view model =
    section []
        [ p [] [ text "Sed ultricies dui nec arcu feugiat, in faucibus turpis commodo. Quisque euismod dui vel purus tempus, nec feugiat arcu tristique. Ut nisl magna, tincidunt sit amet hendrerit eu, tempus quis urna. Morbi lorem ex, luctus non congue id, fermentum sed tellus. Suspendisse nec sollicitudin eros, a vestibulum ex. Phasellus semper rutrum lectus, et malesuada enim elementum in. Morbi malesuada enim a ipsum volutpat pulvinar sed at nunc. Cras tincidunt est vel felis tempor." ]
        , button
            [ type_ "button", onClick (ShowGenericModal (\_ -> p [] [ text "Thanks!" ])) ]
            [ text "Like us!" ]
        , button
            [ type_ "button", onClick (ShowGenericModal getSignUpModalHtml) ]
            [ text "Sign up to our newsletter!" ]
        ]


getSignUpModalHtml : () -> Html Msg
getSignUpModalHtml _ =
    div []
        [ div [ class "header" ]
            [ text "Please enter your email address" ]
        , form [ class "content" ]
            [ input
                [ type_ "email"
                , placeholder "..."
                ]
                []
            , button [ type_ "submit" ] [ text "Submit" ]
            ]
        ]
