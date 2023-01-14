+================================================
+                                                
+ Northwood  -   Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     05/08/2006 Written                      
+================================================

POST_NAME = "Northwood ATC (mm) (*.tap)"

FILE_EXTENSION = "tap"

UNITS = "MM"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 0
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
VAR X_POSITION = [X|C|X|1.3]
VAR Y_POSITION = [Y|C|Y|1.3]
VAR Z_POSITION = [Z|C|Z|1.3]
VAR X_HOME_POSITION = [XH|A|X|1.3]
VAR Y_HOME_POSITION = [YH|A|Y|1.3]
VAR Z_HOME_POSITION = [ZH|A|Z|1.3]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"%"
"O3001 ([PATHNAME])"
"/M34"
"M59"
"M5S0"
"M100"
"M46"
"G53 G90 G00 Z0 H0"
"G17"
"G90"
"G55"
"[N]"
"G52 X0 Y0 Z0"
"T[T]"
"/T[T] M06"
"/M61"
"/M03 [S]"
"G0 X0 Y0"
"G43 Z20 H9[T]"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"G53 G90 G00 Z0 H0"
"M5S0"
"T[T]"
"/T[T] M06"
"/M3[S]"
"G0 X0 Y0"
"G43 Z20 H9[T]"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"G0[X][Y][Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"G1[X][Y][Z][F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[X][Y][Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"G53 G90 G00 Z0 H0"
"M05 S0"
"G53 G90 G00 Y0"
"M46"
"M100"
"M98 P9002"
"M30"
"%"

