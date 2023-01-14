+================================================
+                                                
+  Anilam  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     31/01/2006 Written                      
+================================================

POST_NAME = "Anilam (inch) (*.m)"

FILE_EXTENSION = "m"

UNITS = "INCHES"

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
VAR FEED_RATE = [F|C|FEED |1.1]
VAR X_POSITION = [X|C|X|1.4]
VAR Y_POSITION = [Y|C|Y|1.4]
VAR Z_POSITION = [Z|C|Z|1.4]
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

"DIM ABS"
"UNIT INCHES"
"PLANE XY"
"RAPID  [XH] [YH] [ZH] TOOL# 0"
"TOOL# [T]"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"RAPID  [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"LINE [X] [Y] [Z] [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"LINE  [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"ENDMAIN"

