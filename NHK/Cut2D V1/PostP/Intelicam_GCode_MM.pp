+================================================
+                                                
+  NC Studio  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who       When       What                         
+ ======== ========== ===========================
+ Tony      13/09/2007 Written                      
+================================================

POST_NAME = "Intelicam GCode (MM) (*.nc)"

FILE_EXTENSION = "nc"

UNITS = "MM"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 0
LINE_NUMBER_INCREMENT = 1
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|A||1.1]
VAR X_POSITION = [X|A||1.3]
VAR Y_POSITION = [Y|A||1.3]
VAR Z_POSITION = [Z|A||1.3]
VAR ARC_CENTRE_I_INC_POSITION = [I|A||1.3]
VAR ARC_CENTRE_J_INC_POSITION = [J|A||1.3]
VAR X_HOME_POSITION = [XH|A||1.3]
VAR Y_HOME_POSITION = [YH|A||1.3]
VAR Z_HOME_POSITION = [ZH|A||1.3]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"[N] G0 X[XH] Y[YH] Z[ZH]"

+---------------------------------------------------
+  Commands output for first rapid move 
+---------------------------------------------------

begin FIRST_RAPID_MOVE

"[N] G0 X[X] Y[Y] Z[Z]"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"[N] G0 X[X] Y[Y] Z[Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"[N] G1 X[X] Y[Y] Z[Z]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[N] G1 X[X] Y[Y] Z[Z]"

+---------------------------------------------------
+  Commands output for the first clockwise arc move
+---------------------------------------------------

begin FIRST_CW_ARC_MOVE

"[N] G2 X[X] Y[Y] I[I] J[J]"


+---------------------------------------------------
+  Commands output for clockwise arc  move
+---------------------------------------------------

begin CW_ARC_MOVE

"[N] G2 X[X] Y[Y] I[I] J[J]"


+---------------------------------------------------
+  Commands output for the first counterclockwise arc move
+---------------------------------------------------

begin FIRST_CCW_ARC_MOVE

"[N] G3 X[X] Y[Y] I[I] J[J]"


+---------------------------------------------------
+  Commands output for counterclockwise arc  move
+---------------------------------------------------

begin CCW_ARC_MOVE

"[N] G3 X[X] Y[Y] I[I] J[J]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"[N] G0 X[XH] Y[YH] Z[ZH]"




