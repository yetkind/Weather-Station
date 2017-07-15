
 __    __           _   _                 __ _        _   _             
/ / /\ \ \___  __ _| |_| |__   ___ _ __  / _\ |_ __ _| |_(_) ___  _ __  
\ \/  \/ / _ \/ _` | __| '_ \ / _ \ '__| \ \| __/ _` | __| |/ _ \| '_ \ 
 \  /\  /  __/ (_| | |_| | | |  __/ |    _\ \ || (_| | |_| | (_) | | | |
  \/  \/ \___|\__,_|\__|_| |_|\___|_|    \__/\__\__,_|\__|_|\___/|_| |_|
													by Yetkin Degirmenci
+-----------------------------------------------------------------------+
 
 file: weather.bat
 date: 2017-07-13 23:04
 author: Yetkin Degirmenci - <yetkind@gmail.com> 
 web:
 description: Script to get the current weather data.
 data supplier: http://weather.tuxnet24.de
 licence: MIT Licence
+-----------------------------------------------------------------------+ 
 Special Thanks to http://weather.tuxnet24.de !!
 
 Guys go fork on Github just drop me a credit if you re-use & I'd enjoy
 to learn what you guys do or created more with this. :)
 - Many blessings
			
+-----------------------------------------------------------------------+

 Prerequisites

 - You have to install curl for Windows from https://curl.haxx.se/download.html
 - Knowledge of how to add new programs to Windows path.

+-----------------------------------------------------------------------+

 How to find your city ID

  This program use the data supplied by "weather.tuxnet24.de" web site God bless them!
  they use yahoo services to get data and supply us as XML file 
  you can find your city ID by simply visit yahoo weather and check your city
  and city ID should be end of the URL in adress bar like this below
  yahoo.com/news/weather/turkey/izmir-province/izmir-2344117
  simply in this example our city ID is "2344117"

+-----------------------------------------------------------------------+

 Screen Color

 On line 47 you can change your weather station according to this
 Color attributes are specified by TWO hex digits -- the first
 corresponds to the background; the second the foreground.  Each digit
 can be any of the following values:

    0 = Black       8 = Gray
    1 = Blue        9 = Light Blue
    2 = Green       A = Light Green
    3 = Aqua        B = Light Aqua
    4 = Red         C = Light Red
    5 = Purple      D = Light Purple
    6 = Yellow      E = Light Yellow
    7 = White       F = Bright White

	Here is below my favorite Old school colors yeah! \m/
  0e : XT Hercules Display
  0a : MDA Green

+-----------------------------------------------------------------------+