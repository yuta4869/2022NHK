+================================================
+                                                
+ Pacer - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     16/11/2005 Written                      
+================================================

POST_NAME = "Sherline (inch) (*.ngc)"

FILE_EXTENSION = "ngc"

UNITS = "inches"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 10
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
VAR X_POSITION = [X|C|X |1.3]
VAR Y_POSITION = [Y|C|Y |1.3]
VAR Z_POSITION = [Z|C|Z |1.3]
VAR X_HOME_POSITION = [XH|A|X |1.3]
VAR Y_HOME_POSITION = [YH|A|Y |1.3]
VAR Z_HOME_POSITION = [ZH|A|Z |1.3]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"( File Created by VCarve Pro)"

"[N] G00 [ZH]"
"[N] G00 [XH] [YH]"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

+ "[N] M06 T[T]"
+ "[N] [S] M03"


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

"[N] G00 [ZH]"
"[N] G00 [XH] [YH]"

