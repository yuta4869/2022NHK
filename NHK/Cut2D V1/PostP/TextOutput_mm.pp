
+-----------------------------------------------------------
|												
| Text Output - Code configuration file 
|
|-----------------------------------------------------------
|
| Who    When       What
| ====== ========== ========================================
| BrianM 07/06/2005 Written
| BrianM 15/07/2005 Feedrates are in mm/min now not mm/s
|
+-----------------------------------------------------------

POST_NAME = "Text Output (mm) (*.txt)"

FILE_EXTENSION = "txt"

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

var LINE_NUMBER   = [N|A|N|1.0]

+------------------------------------------------
+ Spindle Speed
+------------------------------------------------

var SPINDLE_SPEED = [S|A||1.0]

+------------------------------------------------
+ Feed Rate
+------------------------------------------------

var FEED_RATE = [F|C|F|1.1]

+------------------------------------------------
+ Tool position in x,y and z
+------------------------------------------------

var X_POSITION = [X|C| X:|1.5]
var Y_POSITION = [Y|C| Y:|1.5]
var Z_POSITION = [Z|C| Z:|1.5]

+------------------------------------------------
+ Home tool positions 
+------------------------------------------------

var X_HOME_POSITION = [XH|A||1.5]
var Y_HOME_POSITION = [YH|A||1.5]
var Z_HOME_POSITION = [ZH|A||1.5]


+================================================
+
+    Block definitions for toolpath output
+
+================================================


+---------------------------------------------
+                Start of file
+---------------------------------------------

begin HEADER
""
"+-------------------------------------------------------------+"
"|                                                             |"
"|                          HEADER                             |"
"|                                                             |"
"+-------------------------------------------------------------+"
""
" Plain Text Ouptut Of Toolpath "
""
" All values are in mm, feedrates in mm/s"
""
" Material Info"
""
"   X Min = [XMIN]   Y Min = [YMIN]  Z Min = [ZMIN]"
"   X Max = [XMAX]   Y Max = [YMAX]  Z Max = [ZMAX]"
""
"   X Length = [XLENGTH]"
"   Y Length = [YLENGTH]"
"   Z Length = [ZLENGTH]"
""
" Home Position"
""
"   X = [XH] Y = [YH] Z = [ZH]" 
""
"   Safe Z = [SAFEZ]"
""
" First Tool"
""
"   Tool Number = [T]"
"   Tool Name   = '[TOOLNAME]'"
""
" Cutting Speeds"
""
"   Cut Feed Rate = [FC] mm/min"
"   Plunge Rate   = [FP] mm/min"
"   Spindle Speed = [S] r.p.m"
""
""
" File Information"
""
"   Toolpath Name           = '[TOOLPATH_NAME]'"
"   Toolpath Pathname       = '[PATHNAME]'"
"   Toolpath File Name      = '[TP_FILENAME]'"
"   Toolpath File Directory = '[TP_DIR]'"
"   Toolpath Extension      = '[TP_EXT]'"
"" 
"-------------------------------------------------------------"
""  


+--------------------------------------------
+               Toolchange
+--------------------------------------------

begin TOOLCHANGE
""
"+-------------------------------------------------------------+"
"|                                                             |"
"|                        TOOLCHANGE                           |"
"|                                                             |"
"+-------------------------------------------------------------+"
" Tool"
"   Tool Number = [T]"
"   Tool Name   = [TOOLNAME]"
"   Previous Tool Number = [TP]"
""
" Cutting Speeds"
"   Cut Feed Rate = [FC] mm/min"
"   Plunge Rate   = [FP] mm/min"
"   Spindle Speed = [S] r.p.m"
""
"   Toolpath Name = [TOOLPATH_NAME]"
""

+--------------------------------------------
+               Program moves
+--------------------------------------------

+---------------------------------------------
begin FEED_RATE_CHANGE

""
" Feed Rate Change - [F] mm/min"
""

+---------------------------------------------

begin FIRST_RAPID_MOVE

""
" Rapid Move "
""
"  [X][Y][Z]"

+--------------------------------------------
begin RAPID_MOVE

"  [X][Y][Z]"

+---------------------------------------------

begin PLUNGE_MOVE

""
" Plunge Move "
""
"  [X][Y][Z]"

+---------------------------------------------

begin RETRACT_MOVE

""
" Retract Move "
""
"  [X][Y][Z]"


+---------------------------------------------

begin FIRST_FEED_MOVE

""
" Feed Move "
""
"  [X][Y][Z]"

+---------------------------------------------

begin FEED_MOVE

"  [X][Y][Z]"

+---------------------------------------------
+                 End of file
+---------------------------------------------

begin FOOTER

""
"+-------------------------------------------------------------+"
"|                                                             |"
"|                         FOOTER                              |"
"|                                                             |"
"+-------------------------------------------------------------+"
""
" Home Position"
""
"   X = [XH] Y = [YH] Z = [ZH]" 
