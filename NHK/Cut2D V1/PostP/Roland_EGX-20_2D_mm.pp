+================================================
+                                                
+ Roland 3D HPGL - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     02/08/2005 Written                      
+ Brian    24/02/2006 Added PRINT_DIRECT 
+================================================

POST_NAME = "Roland EGX-20 2D (*.rol)"

FILE_EXTENSION = "rol"

UNITS = "MM"

PRINT_DIRECT = "YES"

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
VAR SAFE_Z_HEIGHT =   [SAFEZ|A||1.0|100]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

";;IN;!MC0"
"VS5"
"!PZ-25,[ZH];!MC1"
"PU[XH],[YH]"

+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

+begin FEED_RATE_CHANGE

+"VS [F];F [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"PD[X],[Y]"


+---------------------------------------------------
+  Commands output for First Plune rate moves
+---------------------------------------------------

begin PLUNGE_MOVE

"!PZ[Z],[SAFEZ];PD[X],[Y]"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"PU[X],[Y]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"PU[XH],[YH]"
"!MC0"
+ !PZ[ZH],[ZH];PU10000,15200

      