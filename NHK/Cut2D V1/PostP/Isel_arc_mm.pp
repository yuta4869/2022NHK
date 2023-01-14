+================================================
+                                                
+ ISEL NCP - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who     When       What                         
+ ======== ========== ===========================  
+ Matthias 20/07/2007 Written
+================================================

POST_NAME = "ISEL Arc (mm) (*.ncp)"

FILE_EXTENSION = "ncp"

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
LINE_NUMBER_MAXIMUM = 99999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|05.0]
VAR SPINDLE_SPEED = [S|A||1.0]
VAR FEED_RATE = [F|C| |1.0|15]
VAR CUT_RATE    = [FC|A||1.0|0.0166]
VAR PLUNGE_RATE = [FP|A||1.0|0.0166]
VAR X_POSITION = [X|C| X|1.0|1000]
VAR Y_POSITION = [Y|C| Y|1.0|1000]
VAR Z_POSITION = [Z|C| Z|1.0|1000]
var ARC_CENTRE_I_ABS_POSITION = [IA|A| I|1.0|1000]
var ARC_CENTRE_J_ABS_POSITION = [JA|A| J|1.0|1000]
VAR X_HOME_POSITION = [XH|C| X|1.0|1000]
VAR Y_HOME_POSITION = [YH|C| Y|1.0|1000]
VAR Z_HOME_POSITION = [ZH|C| Z|1.0|1000]
VAR SAFE_Z_HEIGHT =   [SAFEZ|A||1.0|1000]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"IMF_PBL_V1.0"
";---"
";Type:          VCarve Wizard Toolpath"
";---"
";File Name:     [TP_FILENAME]"
";Path Name:     [PATHNAME]"
";---"
";Material Size: X=[XLENGTH] x Y=[YLENGTH] x Z=[ZLENGTH]"
";---"
";Safe Position: Z=[SAFEZ]"
";---"
" PLANE XY"
" FASTVEL 40000"
" SPINDLE OFF"
" COOLANT OFF"
" GETTOOL [T] ;ToolNo.: [T]-[TOOLNAME]"
" SPINDLE CW RPM[S] TIME2000 ;SpindleSpeed: [S] r.p.m"
" TYPE [TOOLPATH_NAME] CutFeed:[FC]mm/min Plunge:[FP]mm/min Spindle:[S]r.p.m"
" FASTABS[XH][YH]"
" COOLANT ON"
" FASTABS[ZH]"

+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

" SPINDLE OFF"
" GETTOOL [T] ;ToolNo.: [T]-[TOOLNAME]"
" SPINDLE CW RPM[S] TIME2000 ;SpindleSpeed: [S] r.p.m"
" TYPE [TOOLPATH_NAME] CutFeed:[FC]mm/min Plunge:[FP]mm/min Spindle:[S]r.p.m"

+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

" VEL[F]"

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
+  Commands output for the first clockwise arc move
+---------------------------------------------------

begin FIRST_CW_ARC_MOVE

" CWABS[IA][JA][X][Y]"

+---------------------------------------------------
+  Commands output for clockwise arc  move
+---------------------------------------------------

begin CW_ARC_MOVE

" CWABS[IA][JA][X][Y]"

+---------------------------------------------------
+  Commands output for the first counterclockwise arc move
+---------------------------------------------------

begin FIRST_CCW_ARC_MOVE

" CCWABS[IA][JA][X][Y]"

+---------------------------------------------------
+  Commands output for counterclockwise arc  move
+---------------------------------------------------

begin CCW_ARC_MOVE

" CCWABS[IA][JA][X][Y]"

+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

" FASTABS[Z]"
" FASTABS[X][Y]"
" SPINDLE OFF"
" COOLANT OFF"
" PROGEND"
