module Calendar exposing(..)
import Array exposing (..)
import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String
import Date
import Task
import Time
import CalendarStyles exposing (..)
import CalendarHelpers exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = (always Sub.none)
    }


--MODEL

type alias Event =
  { id: Int
  , date: Date.Date
  , firstname: String
  , lastname: String
  , phoneNumber: String
  }

type alias Model =
  { events: List Event
  , today: Date.Date
  , weekOf: Date.Date
  }



--INIT

init : (Model, Cmd Msg)
init =
  let model = 
    { events = []
    , today = 0 |> Date.fromTime
    , weekOf = 0 |> Date.fromTime
    }
  in
    (model, getCurrentDate)




--UPDATE

type Msg
  = Open Int
  | NoOp String
  | FetchDate Date.Date
  | ForwardAWeek
  | BackAWeek

update : Msg -> Model -> (Model, Cmd Msg)
update action model = 
  case action of
    Open id -> (model, Cmd.none)
    NoOp error -> (model, Cmd.none)
    FetchDate date -> (Model model.events date date, Cmd.none)
    ForwardAWeek -> (Model model.events model.today (forwardOneWeek model.weekOf), Cmd.none)
    BackAWeek -> (Model model.events model.today (backwardOneWeek model.weekOf), Cmd.none)


--VIEW

view: Model -> Html Msg
view model =
  let
    currentDay = toString (Date.month model.today) ++ " " ++ toString (Date.day model.today) ++ ", " ++ toString (Date.year model.today)
  in
  div [container] 
    [ a [pullLeft, href "#", onClick BackAWeek] [text "Previous Week"]
    , a [pullRight, href "#", onClick ForwardAWeek] [text "Next Week"]
    , span [bold] [text ("Today is: " ++ currentDay)]
    , week model
    ]


week: Model -> Html Msg
week model =
  div [weekStyle] 
    [ day Date.Sun model
    , day Date.Mon model
    , day Date.Tue model
    , day Date.Wed model
    , day Date.Thu model
    , day Date.Fri model
    , day Date.Sat model
    ]


day: Date.Day -> Model -> Html Msg
day day model =
  let
    title = toString day
    date = calculateDate day model.weekOf
    formattedDate = formatDate date
    style = if Date.month date == Date.month model.today && Date.day date == Date.day model.today && Date.year date == Date.year model.today then currentDayStyle else dayStyle
  in
    div [style] 
      [ div [underline] [text title]
      , div [underline] [text formattedDate]
      ]



getCurrentDate: Cmd Msg
getCurrentDate =
  Task.perform NoOp FetchDate Date.now


formatDate: Date.Date -> String
formatDate date =
  toString (Date.month date) ++ " " ++ toString (Date.day date)


calculateDate: Date.Day -> Date.Date -> Date.Date
calculateDate day weekOf =
  let
    differenceBetweenWeekdayAndToday = (weekdayToInt day) - weekdayToInt (Date.dayOfWeek weekOf)
    in
       if differenceBetweenWeekdayAndToday < 0 then calculateBackwards differenceBetweenWeekdayAndToday weekOf
       else calculateForwards differenceBetweenWeekdayAndToday weekOf

calculateBackwards: Int -> Date.Date -> Date.Date
calculateBackwards differenceBetweenWeekdayAndToday weekOf =
  let
    month = Date.month weekOf
    year = Date.year weekOf
    selectedDate = Date.day weekOf
    previousMonth = (monthToInt month) - 1 |> intToMonth
    yearOfDay = if previousMonth == Date.Dec then year - 1 else year
  in
    if differenceBetweenWeekdayAndToday <= selectedDate && differenceBetweenWeekdayAndToday + selectedDate > 0 then convertToDate month (differenceBetweenWeekdayAndToday + selectedDate) year 
    else  convertToDate previousMonth ((daysInMonth previousMonth yearOfDay) + (differenceBetweenWeekdayAndToday + selectedDate)) yearOfDay 

calculateForwards: Int -> Date.Date -> Date.Date
calculateForwards differenceBetweenWeekdayAndToday weekOf =
  let
    month = Date.month weekOf
    year = Date.year weekOf
    selectedDate = Date.day weekOf
    nextMonth = (monthToInt month) + 1 |> intToMonth
    daysTillEndOfMonth = (daysInMonth month year) - selectedDate
    yearOfDay = if nextMonth == Date.Jan then year + 1 else year
  in
    if differenceBetweenWeekdayAndToday <= daysTillEndOfMonth then convertToDate month (differenceBetweenWeekdayAndToday + selectedDate) year 
    else convertToDate nextMonth ((differenceBetweenWeekdayAndToday - daysTillEndOfMonth)) yearOfDay 

convertToDate: Date.Month -> Int -> Int -> Date.Date
convertToDate month day year =
  case Date.fromString ((toString (monthToInt month)) ++ "/" ++ (toString day) ++ "/" ++ (toString year)) of
    Ok value -> value
    Err msg -> Debug.crash("convertToDate: invalid date")


forwardOneWeek: Date.Date -> Date.Date
forwardOneWeek date =
  calculateForwards 7 date

backwardOneWeek: Date.Date -> Date.Date
backwardOneWeek date =
  Debug.log "back a week" (calculateBackwards -7 date)
