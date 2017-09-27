module Util.Core exposing (..)

import Task


toCmd : a -> Cmd a
toCmd =
    Task.succeed >> Task.perform identity
