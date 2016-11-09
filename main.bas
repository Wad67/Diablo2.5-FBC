#include "fbgfx.bi"
Using FB
ScreenRes 640, 480, 32
Dim as integer mx, my, mwheel, mbuttons
Dim As Integer x, y
main:

DO 
    cls
    GETMOUSE mx, my, mwheel, mbuttons
    
    BLoad "main.bmp"
    print mx, my, mwheel, mbuttons
    if mbuttons = 1 then
        open "debug.txt" For Output as #1
        print #1, mx, my, mwheel, mbuttons,;
        Close #1
    END IF
    if mx > 193 and my > 187 and mbuttons = 1 and mx < 424 and my < 259 then
        open "debug.txt" For Output as #1
        print #1, "we clicked something",;
        Close #1
        beep
        goto startgame:
    END IF
    if mx > 193 and my > 279 and mbuttons = 1 and mx < 424 and my < 358 then
        open "debug.txt" For Output as #1
        print #1, "we quit",;
        Close #1
        beep
        goto quit
    END IF
    sleep 60
   


  
LOOP

startgame:
'todo, finish all of the game init functions, finish actual game, etc
'at least there is keyboard input I suppose
cls
print "You have reached the end of the demo, have a nice gay.  "  
sleep 2000
Do
    ' Check arrow keys and update the (x, y) position accordingly
    If MultiKey(SC_LEFT ) And x >   0 Then x = x - 1.5
    If MultiKey(SC_RIGHT) And x < 639 Then x = x + 1.5
    If MultiKey(SC_UP   ) And y >   0 Then y = y - 1.5
    If MultiKey(SC_DOWN ) And y < 479 Then y = y + 1.5
    
    ' Lock the page while we work on it
    ScreenLock
        ' Clear the screen and draw a circle at the position (x, y)
        Cls
        Circle(x + 15, y), 30, , , , ,F
        draw string (x,y), "0__0", 232
        
    ScreenUnlock
    
    Sleep 15, 1
    
    ' Run loop until user presses Escape
Loop Until MultiKey(SC_ESCAPE)
While Inkey <> "": Wend
quit: