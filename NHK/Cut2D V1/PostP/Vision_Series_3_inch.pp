+================================================
+                                                
+ Vision - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     12/09/2005 Written       
+ Tony     01/02/2006 Inverted the Y axis               
+================================================

POST_NAME = "Vision Series 3 (inch) (*.plt)"

FILE_EXTENSION = "plt"

UNITS = "INCHES"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================


VAR CUT_RATE    = [FC|A||1.1|0.0166]
VAR PLUNGE_RATE = [FP|A||1.1|0.0166]

VAR FEED_RATE =  [F|A||1.1|0.0166]
VAR X_POSITION = [X|A||1.0|1020.95]
VAR Y_POSITION = [Y|A||1.0|-1020.95]
VAR Z_POSITION = [Z|A||1.0|-1020.95]
VAR X_HOME_POSITION = [XH|A||1.0|1020.95]
VAR Y_HOME_POSITION = [YH|A||1.0|-1020.95]
VAR Z_HOME_POSITION = [ZH|A||1.0|-1020.95]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"IN;"
"ZZ1;"
"SP[T];"
"ZO100,[S];"
"VS[FC];"
"VZ[FP];"
"PA;"

+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

+"SF[F];"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"PU[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"PD[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"PD[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"SP;"

