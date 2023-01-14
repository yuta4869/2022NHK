+================================================
+                                                
+ G Code ATC - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     16/11/2006 Written    
+ Tony     13/02/2007 Updated as requested by Mark Angus
+                     Mark confirmed the pp is working
+================================================

POST_NAME = "Wadkin GCode (mm) (*.anc)"

FILE_EXTENSION = "anc"

UNITS = "MM"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 1
LINE_NUMBER_INCREMENT = 1
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.0]
VAR X_POSITION = [X|A|X|1.3]
VAR Y_POSITION = [Y|A|Y|1.3]
VAR Z_POSITION = [Z|A|Z|1.3]
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

"START"
"'([TP_FILENAME])"
"%1. ASYLUM"
"(NORMAL)"
"[N] G53 G90"
"[N] M3 [S] M140"
"[N] G4 F4"
"[N] G0 Z0 D0 M118"
"[N] M50"
"[N] L1=25. L2=35."
"'(Tool [T] [TOOLNAME])"
"[N] G77 H820"
"[N] M3 [S] M140"
"[N] G4 F4"
"[N] G0 Z[ZH] D0[T]"
"[N] M171"
+ "[N] G00 [XH][YH]"
+ "[N] G00[ZH]"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"[N] G00 [X] [Y] [Z]"


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

"[N] G00 [ZH]"
"[N] M171"
"[N] G0 Z0 D0"
"[N] G59 [XH] [YH]"
"[N] G0 Z0 D0"
"[N] M141"
"[N] M2"


