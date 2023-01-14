+================================================
+                                                
+  Gravograph IS400 plt  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Tony     21/11/2005 Edited to include pause on material surface      
+ Tony     13/03/2006 Added Job Finish at the end of toolpath                  
+================================================

POST_NAME = "Gravograph IS400 (plt)"

FILE_EXTENSION = "plt"

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
VAR PLUNGE_RATE = [FP|A||1.0|0.0166]
VAR X_POSITION = [X|A||1.0|100]
VAR Y_POSITION = [Y|A||1.0|100]
VAR Z_POSITION = [Z|A||1.0|100]
VAR X_HOME_POSITION = [XH|A||1.0|100]
VAR Y_HOME_POSITION = [YH|A||1.0|100]
VAR Z_HOME_POSITION = [ZH|A||1.0|100]

VAR Z_LENGTH = [ZLENGTH|A||1.0|100]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"DF"
"V 37"
+ "!NR"
"! 1"
+ "Z 15250 10500 [ZH]"

+---------------------------------------------------
+  Commands output when feed rate changes
+---------------------------------------------------

begin FEED_RATE_CHANGE

"V [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"Z [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER


+ "Z 0 10500 [ZH]"
"! 0"
"H"
"JF"

