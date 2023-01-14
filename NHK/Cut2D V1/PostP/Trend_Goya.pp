+================================================
+                                                
+   Trend  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     30/01/2006 Written                      
+================================================

POST_NAME = "Goya G-Code (mm) (*.gio)"

FILE_EXTENSION = "gio"

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
VAR X_POSITION = [X|C|X|1.2]
VAR Y_POSITION = [Y|C|Y|1.2]
VAR Z_POSITION = [Z|C|Z|1.2]
VAR X_HOME_POSITION = [XH|A|X|1.2]
VAR Y_HOME_POSITION = [YH|A|Y|1.2]
VAR Z_HOME_POSITION = [ZH|A|Z|1.2]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"[91][13]"
"[34][TP_FILENAME][34]"
"G57,2"
"G64"
"G90"
"[S]"
"G68 P0"
"G04 F5"
"G00[ZH]"
"G00[XH][YH]"


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

"[X][Y][Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"G00[ZH]"
"G00X0Y0"
"G67 P0"
"M02"
"[93]"

