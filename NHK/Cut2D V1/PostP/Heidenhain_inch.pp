+================================================
+                                                
+ Heidenhain  -   Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     27/06/2006 Written                      
+================================================

POST_NAME = "Heidenhain (inch) (*.tap)"

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
LINE_NUMBER_INCREMENT = 1
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR SPINDLE_SPEED = [S|A|S|1,3]
VAR FEED_RATE = [F|C||1.0]
VAR X_POSITION = [X|C| X|+1,4]
VAR Y_POSITION = [Y|C| Y|+1,4]
VAR Z_POSITION = [Z|C| Z|+1,3]
VAR X_HOME_POSITION = [XH|A|X|+1,4]
VAR Y_HOME_POSITION = [YH|A|Y|+1,4]
VAR Z_HOME_POSITION = [ZH|A|Z|+1,4]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"[N] BEGIN PGM 1248 Inch"
"[N] TOOL DEF 1 L+0,000 R+0,000"
"[N] TOOL CALL 1 Z [S]"
"[N] L [ZH] F9999 M03"
"[N] L [XH] [YH] [ZH] F9999 M03"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[N] L[X][Y][Z] F[F] M"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"[N] STOP M02"
"[N] END PGM 1248 Inch"

