+================================================
+                                                
+ Holz-Her -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ AMA      06/09/2005 Written                      
+================================================

POST_NAME = "Holz-Her-Conquest 250 / 510 ATC (inch) (*.xpi)"

FILE_EXTENSION = "xpi"

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
LINE_NUMBER_MAXIMUM = 32000

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.0]
VAR X_POSITION = [X|A|X|1.4]
VAR Y_POSITION = [Y|A|Y|1.4]
VAR Z_POSITION = [Z|A|Z|1.4]
VAR X_HOME_POSITION = [XH|A|X|1.4]
VAR Y_HOME_POSITION = [YH|A|Y|1.4]
VAR Z_HOME_POSITION = [ZH|A|Z|1.4]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"%[TP_FILENAME]"
"(CONQUEST 250 / 510 W/NUM 1020)"
"(w/2 pumps and zone 1 pins)"
"$0 [TP_FILENAME]"
"G70 G40 G90"
"G80"
"G17"
"G00 G52 Z0"
"M22"
"M100"
"M05"
"M120"
"M50"
"G04 F2"
"M52"
"M00"
"M58"
"M121"
"G59 X0 Y0 Z0"
"M22"
"([TOOLNAME])"
"([TOOLPATH_NAME])"
"M06 T[T]"
"D[T]"
"M03 [S]"
"G04 F2"
"M116"
"M21"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"G52 G00 Z0"
"([TOOLNAME])"
"([TOOLPATH_NAME])"
"M06 T[T]"
"D[T]"
"M03 [S]"
"G04 F2"
"M116"
"M21"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"G00 [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"G01 [X] [Y] [Z] [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[X] [Y] [Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"G00 G52 Z0"
"M05"
"M22"
"M100"
"M115"
"G00 G52 X1.5 Y48"
"M59"
"M51"
"M53"
"M02"

