module CalendarStyles exposing (..)
import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)


--Styles
container : Attribute msg
container =
  style
    [ ("width", "90%")
    , ("margin-left", "auto")
    , ("margin-right", "auto")
    , ("textAlign", "center")
    ]

weekStyle : Attribute msg
weekStyle =
  style
    [ ("width", "100%")
    , ("height", "450px")
    , ("background", "darkblue")
    ]

pullLeft : Attribute msg
pullLeft =
  style
    [ ("float", "left") ]

pullRight : Attribute msg
pullRight =
  style
    [ ("float", "right") ]

clearFloat : Attribute msg
clearFloat =
  style
    [ ("clear", "both") ]

bold: Attribute msg
bold =
  style
    [ ("font-weight", "bold") ]


dayStyle : Attribute msg
dayStyle =
  style
    [ ("width", "13.5%")
    , ("background", "lightblue")
    , ("height", "99%")
    , ("display", "inline-block")
    , ("margin", "2px")
    ]

currentDayStyle : Attribute msg
currentDayStyle =
  style
    [ ("width", "13.5%")
    , ("background", "green")
    , ("height", "99%")
    , ("display", "inline-block")
    , ("margin", "2px")
    ]

underline: Attribute msg
underline = 
  style
    [("text-decoration", "underline")]
