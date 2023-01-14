+================================================
+                                                
+ Biesse  -  Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who    When       What                         
+ ======== ========== ===========================
+ Tony     21/04/2006 Written  
+ Tony     15/06/2006 edited ST to always = 1    
+ Tony     20/08/2007 Edited to output Feed rates     
+ Tony     24/08/2007 Added Arc moves      
+================================================

POST_NAME = "Biesse Rover Arcs (mm) (*.*)"

FILE_EXTENSION = " "

UNITS = "MM"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 1
LINE_NUMBER_INCREMENT = 1
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE =   [F|C|F=|1.1|0.001]
VAR PLUNGE_RATE = [FP|A||1.1|0.001]
VAR CUT_RATE =    [FC|A||1.1|0.001]
VAR X_POSITION = [X|C|X|1.3]
VAR Y_POSITION = [Y|C|Y|1.3|-1]
VAR Z_POSITION = [Z|C|Z|1.3|-1]
VAR X_HOME_POSITION = [XH|A|X|1.3]
VAR Y_HOME_POSITION = [YH|A|Y|1.3|-1]
VAR Z_HOME_POSITION = [ZH|A|Z|1.3|-1]

VAR ARC_RADIUS = [Radius|A||1.3]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"START"
"[91]COMMENTO[93]"
"PARAMETRI=000000000"
"UTENSILI=000000000"
"LABELF=000000000"
"LABELC=000000000"
"FORATURA=000000000"
"CONTORNATURA=000000000"
"TABELLEFORI=000000000"
"CONFASSIST=000000000"
"ATTREZZAGGIO=000000000"
"[91]PARAMETRI01[93]"
"N10 G71 HC=1 LY=[YLENGTH] PLPZ=[ZLENGTH] PDM=0 PUOS=0 FIL=0 BLO=0 ACC=0 RUO=1 PRS=1 PRL=1 PPWQ=0.000 KA=256.000 LZ=[ZLENGTH] LX=[XLENGTH] "
"%"
"[91]UTENSILI01[93]"
"%"
"[91]CONTORNATURA01[93]"
"[N] PAN=1 ST1=[34][TOOLNAME][34] ST2=[34]NULL[34] ST3=[34]NULL[34] L=PCUA "
"[N] [XH] [YH] Z=PRK TP=1 PRF=0 F=[FC] VF=[FP] G40 L=PON M55"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"[N] L=POFF"
"[N] PAN=1 ST1=[34][TOOLNAME][34] ST2=[34]NULL[34] ST3=[34]NULL[34] L=PCUA "
"[N] [XH] [YH] Z=PRK TP=1 PRF=0 F=[FC] VF=[FP] G40 L=PON M55 "


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"[N] G0 [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"[N] G1 [X] [Y] [Z] [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[N] [X] [Y] [Z]"


+---------------------------------------------------
+  Commands output for first clockwise Arc
+---------------------------------------------------

begin FIRST_CW_ARC_MOVE

"[N] G5 [X] [Y] R-[Radius] [F]"


+---------------------------------------------------
+  Commands output for clockwise arc  move
+---------------------------------------------------

begin CW_ARC_MOVE

"[N] G5 [X] [Y] R-[Radius]"


+---------------------------------------------------
+  Commands output for first counterclockwise Arc
+---------------------------------------------------

begin FIRST_CCW_ARC_MOVE

"[N] G4 [X] [Y] R[Radius] [F]"


+---------------------------------------------------
+  Commands output for counterclockwise arc  move
+---------------------------------------------------

begin CCW_ARC_MOVE

"[N] G4 [X] [Y] R[Radius]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"[N] L=POFF"

