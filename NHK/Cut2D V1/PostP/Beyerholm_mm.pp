+================================================
+                                                
+  Beyerholm  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     03/11/2005 Written
+ Tony     10/11/2005 Added setup options in header
+ Tony     11/11/2005 Edited feedrate parameters                      
+================================================

POST_NAME = "Beyerholm (mm) (*.plt)"

FILE_EXTENSION = "plt"

UNITS = "MM"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = " [13][10]"

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

";!IQ"
"PU;!PZ"
"!VS1.000"
"!PR"
"!ZZ0,0,[ZH]"
"!NR"
"!PA"
"!ZZ[XH],[YH],[ZH]"
"!NR"
"!PZ;PD"
"!VR50;VS[F];!VZ[F]"
"!SS[S];!MC1"
"!PA"

+---------------------------------------------------
+  Commands output for first rapid move 
+---------------------------------------------------

begin FIRST_RAPID_MOVE

"VS[F][13][10]!ZZ[X],[Y],[Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"VS[F][13][10]!ZZ[X],[Y],[Z]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"!ZZ[X],[Y],[Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"!MC0"
"!ZZ[XH],[YH],[ZH]"
"!EJ"
"!MO"

