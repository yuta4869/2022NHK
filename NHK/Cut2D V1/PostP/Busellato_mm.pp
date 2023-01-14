+================================================
+                                                
+   Busellato  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     04/06/2006 Written                      
+================================================

POST_NAME = "Busellato (mm)  (*.cnc)"

FILE_EXTENSION = "cnc"

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

VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C||1.0]
VAR X_POSITION = [X|A||1.2]
VAR Y_POSITION = [Y|A||1.2]
VAR Z_POSITION = [Z|A||1.2]
VAR X_HOME_POSITION = [XH|A||1.2]
VAR Y_HOME_POSITION = [YH|A||1.2]
VAR Z_HOME_POSITION = [ZH|A||1.2]
VAR X_MIN = [XMIN|C||1.2]
VAR Y_MIN = [YMIN|C||1.2]
VAR Z_MIN = [ZMIN|C||1.2]
VAR X_MAX = [XMAX|C||1.2]
VAR Y_MAX = [YMAX|C||1.2]
VAR Z_MAX = [ZMAX|C||1.2]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"TPA\ALBATROS\EDICAD\01.00:20:r0w0"
"::SIDE=1;"
"::UNm DL=[XLENGTH] DH=[YLENGTH] DS=[ZLENGTH]"
"OFFS{"
"#0=0.0|0"
"#1=0.0|0"
"#2=0.0|0"
"#3=0.0|0"
"#4=0.0|0"
"#5=0.0|0"
"#6=0.0|0"
"#7=0.0|0"
"}OFFS"
"VARV{"
"#0=0.0|0"
"#1=0.0|0"
"#2=0.0|0"
"#3=0.0|0"
"#4=0.0|0"
"#5=0.0|0"
"#6=0.0|0"
"#7=0.0|0"
"}VARV"
"VAR{"
"}VAR"
"SPEC{"
"::0"
"}SPEC"
"OPTI{"
"}OPTI"
"LINK{"
"}LINK"
"PREV{"
"}PREV"
"SIDE#1{"
"$=side 1"
"W#89{ ::WTs WS=[T] #1=0 #2=0 #3=[ZLENGTH] #8015=0 #8101=0 #8096=0 #40=0 #8135=0 #8136=0 #44=0 #201=1 #203=1 #205=[T] }W"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"W#89{ ::WTs WS=[T] #1=[XH] #2=[YH] #3=[ZH] #8015=0 #8101=0 #8096=0 #40=0 #8135=0 #8136=0 #44=0 #201=1 #203=1 #205=[T] }W"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"W#2201{ ::WTl  #1=[X] #2=[Y] #3=[Z] }W"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"}SIDE"
"SIDE=2{"
"$=side 2"
"}SIDE"
"SIDE#3{"
"$=side 3"
"}SIDE"
"SIDE#4{"
"$=side 4"
"}SIDE"
"SIDE#5{"
"$=side 5"
"}SIDE"
"SIDE#6{"
"$=side 6"
"}SIDE"

