+================================================
+                                                
+ Teetz - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     02/08/2005 Written                      
+================================================

POST_NAME = "Teetz (mm) (*.plt)"

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

VAR FEED_RATE = [F|A||1.0|0.0166]
VAR X_POSITION = [X|A||1.0|100]
VAR Y_POSITION = [Y|A||1.0|100]
VAR Z_POSITION = [Z|A||1.0|-100]
VAR X_HOME_POSITION = [XH|A||1.0|100]
VAR Y_HOME_POSITION = [YH|A||1.0|100]
VAR Z_HOME_POSITION = [ZH|A||1.0|-100]
VAR X_MIN = [XMIN|A||1.0|100]
VAR Y_MIN = [YMIN|A||1.0|100]
VAR Z_MIN = [ZMIN|A||1.0|-100]
VAR X_MAX = [XMAX|A||1.0|100]
VAR Y_MAX = [YMAX|A||1.0|100]
VAR Z_MAX = [ZMAX|A||1.0|-100]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"T3D;"
"C[T];"
"R[XMIN],[YMIN],[ZMIN],[XMAX],[YMAX],[ZMAX],[XH],[YH],[ZH];"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"C[T];"


+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

"V[F];"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"M[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"E;"

