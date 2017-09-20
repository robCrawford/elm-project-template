module Util.Core exposing (..)

import Task


toCmd =
    Task.succeed >> Task.perform identity
