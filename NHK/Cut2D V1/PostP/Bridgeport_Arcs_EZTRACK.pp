+================================================
+
+ Bridgeport EZTRACK- Vectric machine output configuration file
+
+================================================
+
+ History
+
+ Who    When       What
+ ======== ========== ===========================
+ Tony     02/08/2005 Written
+ JAB      07/05/2007 edited for Dennis Toomey
+ ================================================

POST_NAME = "Bridgeport ARCs EZTRACK (*.txt)"

FILE_EXTENSION = "txt"

UNITS = "INCHES"


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
VAR FEED_RATE = [F|A|F|1.1]
VAR X_POSITION = [X|C|X|1.4]
VAR Y_POSITION = [Y|C|Y|1.4]
VAR Z_POSITION = [Z|C|Z|1.4]
VAR ARC_CENTRE_I_INC_POSITION = [I|A|I|1.4]
VAR ARC_CENTRE_J_INC_POSITION = [J|A|J|1.4]
VAR X_HOME_POSITION = [XH|A|X|1.4]
VAR Y_HOME_POSITION = [YH|A|Y|1.4]
VAR Z_HOME_POSITION = [ZH|A|Z|1.4]

+================================================
+
+    Block definitions for toolpath output
+
+================================================
+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"[N]G70G75G90"
"[N]G0X0.0Y0.0T[T]M6"
"[N][S]M3"
"[N]G0[ZH]"

+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"[N]G0[ZH]"
"[N]G0X0.0Y0.0T[T]M6"
"[N][S] M3"
"[N]G0[ZH]"

+---------------------------------------------------
+  Commands output for rapid moves
+---------------------------------------------------

begin RAPID_MOVE

"[N]G0[X][Y][Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"[N]G1[X][Y][Z][F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[N][X][Y][Z]"

+---------------------------------------------------
+  Commands output for the first clockwise arc move
+---------------------------------------------------

begin FIRST_CW_ARC_MOVE

"[N]G2[X][Y][I][J][F]"

+---------------------------------------------------
+  Commands output for clockwise arc  move
+---------------------------------------------------

begin CW_ARC_MOVE

"[N]G2[X][Y][I][J][F]"

+---------------------------------------------------
+  Commands output for the first counterclockwise arc move
+---------------------------------------------------

begin FIRST_CCW_ARC_MOVE

"[N]G3[X][Y][I][J][F]"

+---------------------------------------------------
+  Commands output for counterclockwise arc  move
+---------------------------------------------------

begin CCW_ARC_MOVE

"[N]G3[X][Y][I][J][F]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"[N]G0[ZH]"
"[N]G0[XH][YH]"
"[N]G0X0.0Y0.0M25"
"[N]M02"
"[04]"