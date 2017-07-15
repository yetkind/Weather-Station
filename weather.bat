:: ********************************************************
:: file: weather.bat
:: date: 2017-07-13 23:04
:: author: Yetkin Degirmenci - <yetkind@gmail.com>
:: description: Script to get the current weather data.
:: data supplier: http://weather.tuxnet24.de
:: ********************************************************
::
:: Prerequisites
::
:: - You have to install curl for Windows from https://curl.haxx.se/download.html
:: - Knowledge of how to add new programs to Windows path.
::
:: ********************************************************
:: How to find your city ID
::
::  This program use the data supplied by "weather.tuxnet24.de" web site God bless them!
::  they use yahoo services to get data and supply us as XML file 
::  you can find your city ID by simply visit yahoo weather and check your city
::  and city ID should be end of the URL in adress bar like this below
::  yahoo.com/news/weather/turkey/izmir-province/izmir-2344117
::  simply in this example our city ID is "2344117"
::
:: ********************************************************
:: Screen Color
::
:: On line 47 you can change your weather station according to this
:: Color attributes are specified by TWO hex digits -- the first
:: corresponds to the background; the second the foreground.  Each digit
:: can be any of the following values:
::
::    0 = Black       8 = Gray
::    1 = Blue        9 = Light Blue
::    2 = Green       A = Light Green
::    3 = Aqua        B = Light Aqua
::    4 = Red         C = Light Red
::    5 = Purple      D = Light Purple
::    6 = Yellow      E = Light Yellow
::    7 = White       F = Bright White
::
::	Here is below my favorite Old school colors yeah! \m/
::  0e : XT Hercules Display
::  0a : MDA Green
::
:: ********************************************************
@echo off
setlocal EnableDelayedExpansion
:: pretend I did something cool here :)
title Weather Station... By Yetkin Degirmenci  / contact: yetkind@gmail.com
:: set terminal color
color 0e
:: set code page here
chcp 1250 >nul
:: set default City as Izmir, Turkey (hometown lol)
set id=2344117
:: set default Unit as "c" for Celsius °C - "f" for Fahrenheit 
set unit=c
:: ask user input which temperature scale they want to check or else default is Celsius.
cls
echo.
echo Enter "f" for Fahrenheit °F - "c" - Celsius °C
set /p unit=Chose your temperature Scale:
echo.
echo.
:: ask user input which city they want to check or else default is Izmir.
set /p id=Enter City name or ID: 
:: check delete xml file before start
DEL weather.xml >nul 2>&1
:: get the weather informations
curl --silent "http://weather.tuxnet24.de/?unit=%unit%&mode=xml&q=%id%" > weather.xml
:: replace for degree sign HTML to ASCII code in XML file
powershell -Command "(gc weather.xml) -replace '&#176;', '°' | Out-File -encoding UTF8 weather.xml"
endlocal
cls
:: set some variables for further use in printing...
for /F "tokens=3 delims=<>" %%i in ('findstr "<current_date>" weather.xml') do ( SET date=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<current_temp_low>" weather.xml') do ( SET templow=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<current_temp_high>" weather.xml') do ( SET temphigh=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<country>" weather.xml') do ( SET country=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<region>" weather.xml') do ( SET region=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<city>" weather.xml') do ( SET city=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<current_temp>" weather.xml') do ( SET currenttemp=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<current_text>" weather.xml') do ( SET currenttext=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<speed>" weather.xml') do ( SET speed=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<direction>" weather.xml') do ( SET direction=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<chill>" weather.xml') do ( SET chill=%%i )
:: set some variables for tomorrow forecast
for /F "tokens=3 delims=<>" %%i in ('findstr "<tomorrow_day>" weather.xml') do ( SET tday=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<tomorrow_text>" weather.xml') do ( SET ttext=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<tomorrow_temp_low>" weather.xml') do ( SET tlow=%%i )
for /F "tokens=3 delims=<>" %%i in ('findstr "<tomorrow_temp_high>" weather.xml') do ( SET thigh=%%i )
:: start printing data to screen 
echo. 
echo +------------------ Weather Forecast ------------------+
echo +----------- %date%-----------+
echo +------------------------------------------------------+
echo  Location: %country%/%region%/%city% 
echo +------------------------------------------------------+
echo  Today:  %currenttext%		Current Temp: %currenttemp%
echo +------------------------------------------------------+
echo  Highest Today: %temphigh%	Lowest Today: %templow%	
echo +------------------------------------------------------+
for /F "tokens=3 delims=<>" %%i in ('findstr "<sunset>" weather.xml') do echo  Today Sunset at: %%i
for /F "tokens=3 delims=<>" %%i in ('findstr "<sunrise>" weather.xml') do echo  Today Sunrise at: %%i
for /F "tokens=3 delims=<>" %%i in ('findstr "<visibility>" weather.xml') do echo  Visibility: %%i
for /F "tokens=3 delims=<>" %%i in ('findstr "<humidity>" weather.xml') do echo  Humidity: %%i
for /F "tokens=3 delims=<>" %%i in ('findstr "<pressure>" weather.xml') do echo  Atmospheric pressure: %%i
echo  Wind speed: %speed% - Direction: %direction% - Chill: %chill%
echo.
echo.
echo +----------------- Tomorrow Forecast -------------------+
echo Tomorrow %tday%, %ttext%  Highest: %thigh%  Lowest: %tlow%
echo.
