module CalendarHelpers exposing (..)
import Date

{--
dateToOrdinalNumber: Date.Date -> Int
dateToOrdinalNumber date =
  let
    month = Date.month date
    year = Date.year date
    dayNum = Date.day date
  in
    (ordinalNumbersByMonth month year) + dayNum


ordinalNumberToDate: Int -> Int -> Date.Date
ordinalNumberToDate num year =
  if num > 0 && num <= 31 then convertToDate (Date.Jan num year)
  else if isLeapYear year then
    if num > 31 && num <= 60 then convertToDate (Date.Feb (num - 31) year)
    else if num > 60 && num <= 91 then convertToDate (Date.Mar (num - 60) year)
    else if num > 91 && num <= 121 then convertToDate (Date.Apr (num -91) year)
    else if num > 121 && num <= 152 then convertToDate (Date.May (num - 121) year)
    else if num > 152 && num <= 182 then convertToDate (Date.Jun (num - 152) year)
    else if num > 182 && num <= 213 then convertToDate (Date.Jul (num - 182) year)
    else if num > 213 && num <= 244 then convertToDate (Date.Aug (num - 213) year)
    else if num > 244 && num <= 274 then convertToDate (Date.Sep (num - 244) year)
    else if num > 274 && num <= 305 then convertToDate (Date.Oct (num - 274) year)
    else if num > 305 && num <= 335 then convertToDate (Date.Nov (num - 305) year)
    else if num > 335 && num <= 366 then convertToDate (Date.Dev (num - 335) year)
    else if num > 366 then Debug.crash("ordinalNumberToDate: invalid number")
  else
    if not isLeapYear year then


convertToDate: Date.Month -> Int -> Int -> Date.Date
convertToDate month day year =
  case Date.fromString (toString month ++ "/" ++ toString day ++ "/" ++ toString year) of
    Ok value -> value
    Err msg -> Debug.crash("getDate: invalid date")

ordinalNumbersByMonth: Date.Month -> Int -> Int
ordinalNumbersByMonth month year =
  case month of
    Date.Jan -> 0
    Date.Feb -> 31
    Date.Mar -> if isLeapYear year then 60 else 59
    Date.Apr -> if isLeapYear year then 91 else 90
    Date.May -> if isLeapYear year then 121 else 120
    Date.Jun -> if isLeapYear year then 152 else 151
    Date.Jul -> if isLeapYear year then 182 else 181
    Date.Aug -> if isLeapYear year then 213 else 212
    Date.Sep -> if isLeapYear year then 244 else 243
    Date.Oct -> if isLeapYear year then 274 else 273
    Date.Nov -> if isLeapYear year then 305 else 304
    Date.Dec -> if isLeapYear year then 335 else 334
--}

weekdayToInt: Date.Day -> Int
weekdayToInt day =
  case day of
    Date.Sun -> 1
    Date.Mon -> 2
    Date.Tue -> 3
    Date.Wed -> 4
    Date.Thu -> 5
    Date.Fri -> 6
    Date.Sat -> 7


intToMonth: Int -> Date.Month
intToMonth num =
  case num of
    1 -> Date.Jan
    2 -> Date.Feb
    3 -> Date.Mar
    4 -> Date.Apr
    5 -> Date.May
    6 -> Date.Jun
    7 -> Date.Jul
    8 -> Date.Aug
    9 -> Date.Sep
    10 -> Date.Oct
    11 -> Date.Nov
    12 -> Date.Dec
    num -> if num > 12 then intToMonth (num - 12) else if num == 0 then intToMonth 12 else intToMonth (12 + num)


monthToInt: Date.Month -> Int
monthToInt month =
  case month of
    Date.Jan -> 1
    Date.Feb -> 2
    Date.Mar -> 3
    Date.Apr -> 4
    Date.May -> 5
    Date.Jun -> 6
    Date.Jul -> 7
    Date.Aug -> 8
    Date.Sep -> 9
    Date.Oct -> 10
    Date.Nov -> 11
    Date.Dec -> 12


daysInMonth: Date.Month -> Int -> Int
daysInMonth month year =
  case month of
    Date.Jan -> 31
    Date.Feb -> if isLeapYear year then 29 else 28
    Date.Mar -> 31
    Date.Apr -> 30
    Date.May -> 31
    Date.Jun -> 30
    Date.Jul -> 31
    Date.Aug -> 31
    Date.Sep -> 30
    Date.Oct -> 31
    Date.Nov -> 30
    Date.Dec -> 31

isLeapYear: Int -> Bool
isLeapYear year =
  if year `rem` 100 == 0 then
        year `rem` 400 == 0
    else
        year `rem` 4 == 0
