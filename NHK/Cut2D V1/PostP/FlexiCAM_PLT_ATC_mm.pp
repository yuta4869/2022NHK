+================================================
+                                                
+ Flexicam - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     02/08/2005 Written                      
+================================================

POST_NAME = "FlexiCAM ATC (mm) (*.plt)"

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
VAR X_POSITION = [X|A||1.0|40]
VAR Y_POSITION = [Y|A||1.0|40]
VAR Z_POSITION = [Z|A||1.0|-40]
VAR X_HOME_POSITION = [XH|A||1.0|40]
VAR Y_HOME_POSITION = [YH|A||1.0|40]
VAR Z_HOME_POSITION = [ZH|A||1.0|-40]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"IN;PA;ZZ1;"
"SP[T];ZO100,[S];"
"ZO100,[S];"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"SP[T];ZO100,[S]"


+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

"SF[F];"


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

"PA[X],[Y],[ZH];"
"PU[XH],[YH],[ZH];"
"SP0;"

