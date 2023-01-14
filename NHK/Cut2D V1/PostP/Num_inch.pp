+================================================
+                                                
+ Num - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     03/08/2005 Written                      
+================================================

POST_NAME = "Num Control (inch) (*.tap)"

FILE_EXTENSION = "tap"

UNITS = "INCHES"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 0
LINE_NUMBER_INCREMENT = 1
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

var LINE_NUMBER = [N|A|N|1.0]
var SPINDLE_SPEED = [S|A|S|1.0]
var FEED_RATE = [F|C|F|1.0]
var X_POSITION = [X|C|X|1.3]
var Y_POSITION = [Y|C|Y|1.3]
var Z_POSITION = [Z|C|Z|1.3]
var X_HOME_POSITION = [XH|A|X|1.3]
var Y_HOME_POSITION = [YH|A|Y|1.3]
var Z_HOME_POSITION = [ZH|A|Z|1.3]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"START"
"[N] G52 G0 Z0"
"[N] M80"
"[N] G90 M3 M64"
"[N] G40"
"[N] D0"
"[N] M50"
"[N] G70"
"[N] M110"
"[N] M130"
"[N] M31 T[T]"
"[N] M6"
"[N] G0 [XH] [YH]"
"[N] M113"
"[N] M3M64"
"[N] M31 [S]"
"[N] M23"
"[N] M71"
"[N] D[T]"
"[N] [XH] [YH]"
"[N] [ZH]"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"[N] G0 [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"[N] G1 [X] [Y] [Z] [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[N] [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"[N] G0 [ZH]"
"[N] M80"
"[N] G52 G0 Z0"
"[N] M50"
"[N] M110"
"[N] M130"
"[N] G52 G0 Z0"
"[N] M29"
"[N] G0 G52 X0 Y0 V0 Z0"
"[N] M02"

