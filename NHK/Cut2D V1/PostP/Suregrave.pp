+================================================
+                                                
+ Suregrave - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     17/08/2005 Written                      
+================================================

POST_NAME = "Suregrave DML3 (mm) (*.plt)"

FILE_EXTENSION = "plt"

UNITS = "MM"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR FEED_RATE = [F|A||1.0|0.01667]
VAR CUT_RATE = [FC|A||1.0|0.01667]
VAR PLUNGE_RATE = [FP|A||1.0|0.01667]
VAR X_POSITION = [X|A||1.0|100]
VAR Y_POSITION = [Y|A||1.0|100]
VAR Z_POSITION = [Z|A||1.0|100]
VAR X_HOME_POSITION = [XH|A||1.0|100]
VAR Y_HOME_POSITION = [YH|A||1.0|100]
VAR Z_HOME_POSITION = [ZH|A||1.0|100]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"SS0;ZD0;"
"VS[FC];"
"ZS[FP];"
"ZL0;"
"ZU250;"
"PA;"


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

"ZZ[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"PG;"

