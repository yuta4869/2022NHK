+================================================
+                                                
+  Weeke / HOMAG  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     02/08/2006 Written                      
+================================================

POST_NAME = "HOMAG Weeke MPR (mm) (*.mpr)"

FILE_EXTENSION = "mpr"

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
VAR X_POSITION = [X|C|X|1.3]
VAR Y_POSITION = [Y|C|Y|1.3]
VAR Z_POSITION = [Z|C|Z|1.3]
VAR X_HOME_POSITION = [XH|A|X|1.3]
VAR Y_HOME_POSITION = [YH|A|Y|1.3]
VAR Z_HOME_POSITION = [ZH|A|Z|1.3]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

begin HEADER

"[91]H"
"VERSION=[34]4.0 Alpha[34]"
"MAT=[34]WEEKE[34]"
" "
"[91]001"
"L=[34][XLENGTH][34]"
"KM=[34]length of workpiece[34]"
"W=[34][YLENGTH][34]"
"KM=[34]width of workpiece[34]"
"T=[34][ZLENGTH][34]"
"KM=[34]thickness of workpiece[34]"
" "
"<100 \WerkStck\"
"LA=[34]L[34]"
"BR=[34]W[34]"
"DI=[34]T[34]"
" "
"<119 \Polygonzug\"
"NM=[34][TP_FILENAME].PLY[34]"
"XA=[34]L/2[34]"
"YA=[34]W/2[34]"
"BR=[34][XLENGTH][34]"
"HE=[34][YLENGTH][34]"
"WI=[34]0[34]"
"TI=[34]0[34]"
"WZ=[34]1[34]"
"RK=[34]NOWRK[34]"
"F_=[34]5[34]"
"HP=[34]0[34]"
"SP=[34]0[34]"
" "
"!"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

""

+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

""

+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

""

+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

