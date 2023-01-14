+================================================
+                                                
+ Generic HPGL Vinyl Cutter - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Bart(Wemme) 13/05/07	Generic HPGL Vinyl Cutter
+================================================

POST_NAME = "Generic HPGL Plt (mm) (*.plt)"
+
FILE_EXTENSION = "plt"
UNITS = "MM"
PRINT_DIRECT = "YES"

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR FEED_RATE = [F|A||1.0|0.0166]
VAR X_POSITION = [X|A||1.0|40]
VAR Y_POSITION = [Y|A||1.0|40]
VAR X_HOME_POSITION = [XH|A||1.0|40]
VAR Y_HOME_POSITION = [YH|A||1.0|40]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------
begin HEADER
"IN;PA;"

+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------
begin RAPID_MOVE
"PU[X],[Y];"

+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------
begin FIRST_FEED_MOVE
"PD[X],[Y];"

+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------
begin FEED_MOVE
"PD[X],[Y];"

+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------
begin FOOTER
"PU0,0;SP0;!PG;"

