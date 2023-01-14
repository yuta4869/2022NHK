+================================================
+                                                
+  Apex  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     12/05/2006 Written                      
+================================================

POST_NAME = "Apex (mm) (*.cnc)"

FILE_EXTENSION = "cnc"

UNITS = "MM"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0|0.0033]
VAR FEED_RATE = [F|C|F|1.1|0.01666]
VAR X_POSITION = [X|C|X|1.2]
VAR Y_POSITION = [Y|C|Y|1.2]
VAR Z_POSITION = [Z|C|Z|1.2|-1]
VAR X_HOME_POSITION = [XH|A|X|1.2]
VAR Y_HOME_POSITION = [YH|A|Y|1.2]
VAR Z_HOME_POSITION = [ZH|A|Z|1.2|-1]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"G71"
"G90"
"G00X0.00Y0.00Z0.00"
"M03[S]"
"G00X0.00Y0.00[ZH]"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"G00[X][Y][Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"G01[X][Y][Z][F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"G01[X][Y][Z][F]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"M05"
"M02"

