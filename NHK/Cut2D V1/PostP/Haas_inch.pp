+================================================
+                                                
+ Haas - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     10/08/2005 Written                      
+================================================

POST_NAME = "Haas (inch) (*.NCC)"

FILE_EXTENSION = "NCC"

UNITS = "INCHES"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 10
LINE_NUMBER_INCREMENT = 5
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
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

"%"
"O1005"
"(EZ Date not possible)"
"([TOOLPATH_NAME])"
"(Segment = STE1)"
"[N] G00 G90 G54"
"[N] T[T] M6"
"[N] G00 [XH] [YH] [S] M03"
"G43 H [T]"
"[N] [ZH]"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

+ begin TOOLCHANGE

+ "G00G91G28Z0M09"
+ "M01"
+ "T[T]M6"
+ "M03[S]"
+ "G54G90X0Y0"
+ "G43[ZH]H[T]M8"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"[N] G00 [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"[N] G01 [X] [Y] [Z] [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[N] [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"[N] G00 G91 G28 [ZH]"
"[N] G49 G90"
"[N] G28 Y0"
"[N] M30"
"%"

