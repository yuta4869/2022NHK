+================================================
+                                                
+  Vision Series 1 & 2  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     04/08/2006 Written                      
+================================================

POST_NAME = "Vision Series 1 & 2 (inch) (*.txt)"

FILE_EXTENSION = "txt"

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

VAR FEED_RATE = [F|A||1.0|0.4216]
+ VAR CUT_RATE = [FC|A||1.1]
+ VAR PLUNGE_RATE = [FP|A||1.1]
VAR X_POSITION = [X|A||1.0|1000]
VAR Y_POSITION = [Y|A||1.0|-1000]
VAR Z_POSITION = [Z|A||1.0|-1000]
VAR X_HOME_POSITION = [XH|A||1.0|1000]
VAR Y_HOME_POSITION = [YH|A||1.0|-1000]
VAR Z_HOME_POSITION = [ZH|A||1.0|-1000]

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

+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

+"PU;"

+---------------------------------------------------
+  Commands output for Plunge moves
+---------------------------------------------------

begin PLUNGE_MOVE

"VZ[F];[13][10]PZ[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"PU[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"VS[F];[13][10]PZ[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"PZ[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"XP;"

