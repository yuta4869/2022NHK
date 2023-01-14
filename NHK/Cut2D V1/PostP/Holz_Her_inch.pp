+================================================
+                                                
+ Holz-Her - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     02/08/2005 Written                      
+================================================

POST_NAME = "Holz-Her-ATC (inch) (*.tap)"

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

";(PRODUCED FOR A CONQUEST 510)"
";[TP_FILENAME]"
"G70 G40 G90 G27"
"G80"
"G79 G00 Z0"
"M12 M40"
"M180"
"M15 M25"
"M413 M423"
"M57"
"M0"
"M50 M60"
"M414 M40"
"M424 M40"
"(UOT,1,X0,Y0,Z0)"
";[TOOLNAME]"
";[TOOLPATH_NAME]"
"M06 T[T]"
"M13 [S]"
"(DLY,2)"
"M116"
"M11 M40"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"G79 G00 Z0"
";[TOOLNAME]"
";[TOOLPATH_NAME]"
"M15"
"M6 T[T]"
"M13 [S]"
"(DLY,2)"
"M116"
"M11 M40"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"G0 [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"G1 [X] [Y] [Z] [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[X] [Y] [Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"G40"
"G79 G00 Z0"
"M15"
"M12 M40"
"M25"
"M180"
"G79 G00 X0 Y60"
"M30"

