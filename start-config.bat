mode con: cols=120 lines=30
powershell -command "&{$H=get-host;$W=$H.ui.rawui;$B=$W.buffersize;$B.width=120;$B.height=1000;$W.buffersize=$B;}"

set IGNORE_UPDATES=0
set DISABLE_COLORS=0
set PREFERED_PLANET=530
set PREFERED_ZONE=77
set IGNORE_BOSS=1
