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
    , ("background", "#5a6378")
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
    , ("background", "#60b5cc")
    , ("height", "99%")
    , ("display", "inline-block")
    , ("margin", "2px")
    ]

currentDayStyle : Attribute msg
currentDayStyle =
  style
    [ ("width", "13.5%")
    , ("background", "#7fd13b")
    , ("height", "99%")
    , ("display", "inline-block")
    , ("margin", "2px")
    ]

underline: Attribute msg
underline = 
  style
    [("text-decoration", "underline")]
