
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
| BrianM 13/07/2006 Added support for circular arc output
|
+-----------------------------------------------------------

POST_NAME = "Text Output Arcs (mm) (*.txt)"

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
+ Tool position in x,y and z  - output always
+------------------------------------------------

var X_POSITION = [X|A| X:|9.5]
var Y_POSITION = [Y|A| Y:|9.5]
var Z_POSITION = [Z|A| Z:|9.5]

+------------------------------------------------
+ Home tool positions  - output always
+------------------------------------------------

var X_HOME_POSITION = [XH|A||1.5]
var Y_HOME_POSITION = [YH|A||1.5]
var Z_HOME_POSITION = [ZH|A||1.5]


+------------------------------------------------
+ Arc Output Variables
+------------------------------------------------

var ARC_START_X_POSITION      = [ArcStartX|A| X:|9.5]
var ARC_START_Y_POSITION      = [ArcStartY|A| Y:|9.5]
var ARC_CENTRE_I_INC_POSITION = [I|A| I:|9.5]
var ARC_CENTRE_J_INC_POSITION = [J|A| J:|9.5]
var ARC_CENTRE_I_ABS_POSITION = [IA|A| I:|9.5]
var ARC_CENTRE_J_ABS_POSITION = [JA|A| J:|9.5]
var ARC_MID_X_POSITION        = [ArcMidX|A| X:|9.5]
var ARC_MID_Y_POSITION        = [ArcMidY|A| Y:|9.5]
var ARC_MID_X_INC_POSITION    = [ArcMidXI|A| X:|9.5]
var ARC_MID_Y_INC_POSITION    = [ArcMidYI|A| Y:|9.5]
var ARC_RADIUS                = [Radius|A| R:|1.5]
var ARC_ANGLE                 = [Angle|A| A:|1.3]



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
" All values are in mm, feedrates in mm/min"
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

" -------------------------------------------"
""
" Feed Rate Change - [F] mm/min"
""

+---------------------------------------------

begin FIRST_RAPID_MOVE

" -------------------------------------------"
""
" Rapid Move "
""
"  [X][Y][Z]"

+--------------------------------------------
begin RAPID_MOVE

" -------------------------------------------"	  
"  [X][Y][Z]"

+---------------------------------------------

begin PLUNGE_MOVE

" -------------------------------------------"
""
" Plunge Move "
""
"  [X][Y][Z]"

+---------------------------------------------

begin RETRACT_MOVE

" -------------------------------------------"
""
" Retract Move "
""
"  [X][Y][Z]"


+---------------------------------------------

begin FIRST_FEED_MOVE

" -------------------------------------------"
""
" Linear Feed Move "
""
"  [X][Y][Z]"

+---------------------------------------------

begin FEED_MOVE

" -------------------------------------------"	  
"  [X][Y][Z]"


+---------------------------------------------

begin FIRST_CW_ARC_MOVE

" -------------------------------------------"
""
" First Clockwise Arc Move "
""
"  CW Arc Start  [ArcStartX] [ArcStartY]"
""
"  CW Arc Centre - Incremental [I][J]"
"  CW Arc Centre - Absolute    [IA][JA]"
""
""
"  CW Arc Mid Pt - Incremental [ArcMidXI][ArcMidYI]"
"  CW Arc Mid Pt - Absolute    [ArcMidX][ArcMidY]"
""		  
""
"  CW Arc Radius [Radius] "
"  CW Arc Included Angle [Angle]"
""		  
"  CW Arc End [X][Y][Z]"
""	


+---------------------------------------------

begin CW_ARC_MOVE

" -------------------------------------------"	  
""
"  Clockwise Arc Move "
""
"  CW Arc Start  [ArcStartX][ArcStartY]"
""
"  CW Arc Centre - Incremental [I][J]"
"  CW Arc Centre - Absolute    [IA][JA]"
""
""
"  CW Arc Mid Pt - Incremental [ArcMidXI][ArcMidYI]"
"  CW Arc Mid Pt - Absolute    [ArcMidX][ArcMidY]"
""		  
""
"  CW Arc Radius [Radius] "
"  CW Arc Included Angle [Angle]"
""		  
"  CW Arc End [X][Y][Z]"
""		  

+---------------------------------------------

begin FIRST_CCW_ARC_MOVE

" -------------------------------------------"
""
" First Counter Clockwise Arc Move "
""
"  CCW Arc Start  [ArcStartX][ArcStartY]"
""
"  CCW Arc Centre - Incremental [I][J]"
"  CCW Arc Centre - Absolute    [IA][JA]"
""
""
"  CCW Arc Mid Pt - Incremental [ArcMidXI][ArcMidYI]"
"  CCW Arc Mid Pt - Absolute    [ArcMidX][ArcMidY]"
""		  
""
"  CCW Arc Radius [Radius] "
"  CCW Arc Included Angle [Angle]"
""		  
"  CCW Arc End [X][Y][Z]"
""		  


+---------------------------------------------

begin CCW_ARC_MOVE

" -------------------------------------------"	  
""
"  Counter Clockwise Arc Move "
""
"  CCW Arc Start  [ArcStartX][ArcStartY]"
""
"  CCW Arc Centre - Incremental [I][J]"
"  CCW Arc Centre - Absolute    [IA][JA]"
""
""
"  CCW Arc Mid Pt - Incremental [ArcMidXI][ArcMidYI]"
"  CCW Arc Mid Pt - Absolute    [ArcMidX][ArcMidY]"
""		  
""
"  CCW Arc Radius [Radius] "
"  CCW Arc Included Angle [Angle]"
""		  
"  CCW Arc End [X][Y][Z]"
""		  
	  



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
