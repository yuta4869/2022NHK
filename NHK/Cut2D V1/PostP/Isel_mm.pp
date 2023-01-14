+================================================
+                                                
+ ISEL NCP - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     02/08/2005 Written                     
+================================================

POST_NAME = "ISEL (mm) (*.ncp)"

FILE_EXTENSION = "ncp"

UNITS = "MM"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 5
LINE_NUMBER_INCREMENT = 1
LINE_NUMBER_MAXIMUM = 99999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|06.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C| VEL |1.0|15]
VAR X_POSITION = [X|C| X|1.0|1000]
VAR Y_POSITION = [Y|C| Y|1.0|1000.1]
VAR Z_POSITION = [Z|C| Z|1.0|1000]
VAR X_HOME_POSITION = [XH|C| X|1.0|1000]
VAR Y_HOME_POSITION = [YH|C| Y|1.0|1000]
VAR Z_HOME_POSITION = [ZH|C| Z|1.0|1000]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"1MF_PBL_V1.0"
";"
";Type:   VCarve Wizard Toolpath    "
";"
" FASTVEL 40000"
" INITTOOL"
" SPINDLE OFF"
" COOLANT OFF"
" GETTOOL 0"
" SPINDLE RPM[S]"
" SPINDLE ON"
" WAIT 2000"
" FASTABS[XH][YH]"
" FASTABS[ZH]"
" COOLANT ON"


+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

"[F]"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

" FASTABS[X][Y][Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

" MOVEABS[X][Y][Z]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

" MOVEABS[X][Y][Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

" FASTABS[Z]"
" FASTABS[X][Y]"
" SPINDLE OFF"
" COOLANT OFF"
" PROGEND"

