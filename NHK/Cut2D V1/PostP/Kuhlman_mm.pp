
+-----------------------------------------------------------
|														|	
| Kuhlman configuration file 
|
|-----------------------------------------------------------
|
| Who     When       What
| ======  ========== =======================================
| Tony M  22/06/2005 Written
+-----------------------------------------------------------

POST_NAME = "Kuhlman (mm) (*.prg)"

FILE_EXTENSION = "prg"

UNITS = "MM"

+------------------------------------------------
|    line terminating characters
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
|    Block Numbering
+------------------------------------------------

LINE_NUMBER_START     = 0
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM   = 999999

+================================================
+
+    default formating for variables
+
+================================================

+------------------------------------------------
+ Line numbering
+------------------------------------------------

var LINE_NUMBER   = [N|@|N|1.0]

+------------------------------------------------
+ Spindle Speed
+------------------------------------------------

var SPINDLE_SPEED = [S|@|S|1.0]

+------------------------------------------------
+ Feed Rate
+------------------------------------------------

var FEED_RATE = [F|C|F|1.0]

+------------------------------------------------
+ Tool position in x,y and z
+------------------------------------------------

var X_POSITION = [X|@|X|1.4]
var Y_POSITION = [Y|@|Y|1.4]
var Z_POSITION = [Z|@|Z|1.4]

+------------------------------------------------
+ Home tool positions 
+------------------------------------------------

var X_HOME_POSITION = [XH|@|X|1.4]
var Y_HOME_POSITION = [YH|@|Y|1.4]
var Z_HOME_POSITION = [ZH|@|Z|1.4]


+================================================
+
+    Block definitions for toolpath output
+
+================================================


+---------------------------------------------
+                Start of file
+---------------------------------------------

begin HEADER

"G90G0G59G40G17G191"
"T1M66"
"[S]M3"
"M8"
"G0 [XH] [YH] [ZH] F2000"

+--------------------------------------------
+               Program moves
+--------------------------------------------

begin RAPID_MOVE

"G0 [X] [Y] [Z] F2000"


+---------------------------------------------

begin FIRST_FEED_MOVE

"G1 [X] [Y] [Z] [F]"


+---------------------------------------------

begin FEED_MOVE


"[X] [Y] [Z] [F]"


+---------------------------------------------
+                 End of file
+---------------------------------------------

begin FOOTER

"G0 [ZH] F2000"
"G0 [XH] [YH] F2000"
"G40 M9"
"M30"

