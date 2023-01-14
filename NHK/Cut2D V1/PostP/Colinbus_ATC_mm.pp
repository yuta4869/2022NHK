+================================================
+                                                
+    Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     14/07/2006 Written                      
+================================================

POST_NAME = "Colinbus ATC (mm) (*.c3d)"

FILE_EXTENSION = "c3d"

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
VAR SPINDLE_SPEED = [S|A||1.0]
VAR FEED_RATE = [F|C||1.0|16.66667]
VAR X_POSITION = [X|A||1.0|1000]
VAR Y_POSITION = [Y|A||1.0|1000]
VAR Z_POSITION = [Z|A||1.0|-1000]
VAR X_HOME_POSITION = [XH|A||1.0|1000]
VAR Y_HOME_POSITION = [YH|A||1.0|1000]
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

"SID:Toolpath from Vectric Software;"
"T:[T];[TOOLNAME]"
"RVS [S];"
"VS 45000;"
"PA [XH],[YH],[ZH];"

+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

"VS [F];"

+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"PA [X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"PA [X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"PA [X],[Y],[Z];"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"T:[T];[TOOLNAME]"
"RVS [S];"

+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"PA [XH],[YH],[ZH];"


