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
+ Tony     23/22/2005 Written                      
+================================================

POST_NAME = "Mastergrave (mm) (*.hp)"

FILE_EXTENSION = "hp"

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

";;;IN;!ST0;!NR;!MC0"
"!MX0,1,2"
"!SL4000"
"!VR100;VS[F];!VZ[F];!MC0"
"!PZ0,1000;PU[XH],[YH]"
"!ST1;!NR5;!ST0"
"!ZZ[XH],[YH],[ZH]"
"PD"
"!ST2;!NR16;!ST0"
"PU"
"!SS255;!MC1"
"!DW6000;"
+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

+ "SP[T];ZO100,[S]"


+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

+ "SF[F];"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"!ZZ[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

" !ZZ[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"!ZZ[X],[Y],[Z];"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"!ZZ[X],[Y],[ZH];"
"!ZZ[XH],[YH],[ZH];"
"!MC0"
"!ST4;!EJ;"

