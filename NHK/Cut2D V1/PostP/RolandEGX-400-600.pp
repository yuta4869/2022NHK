+================================================
+                                                
+ Roland 3D HPGL - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ====== ========== ===========================
+ Tony   02/08/2005 Written                      
+ Brian  24/02/2006 Added PRINT_DIRECT 
+ Brian  06/12/2006 Added SPINDLE_SPEED_RANGE  
+================================================

POST_NAME = "Roland EGX-400/600"

FILE_EXTENSION = "rol"

UNITS = "MM"

PRINT_DIRECT = "YES"

SPINDLE_SPEED_RANGE = 1 15 8000 30000

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR FEED_RATE = [F|A||1.0|0.0166]
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

"^DF"
+"!NR"
"! 1;Z [XH],[YH],[ZH]"
"V 64;F 64"
"!RC [S]"


+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

"V [F];F [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"Z [X],[Y],[Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"H"


+---------------------------------------------------
+  Commands output for a new segment - toolpath
+  with same toolnumber but maybe different feedrates
+---------------------------------------------------

begin NEW_SEGMENT

"!RC [S]"
