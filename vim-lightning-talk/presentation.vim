let SessionLoad = 1
set nonu
set hidden
badd +1 slides/1.txt
badd +1 slides/2.txt
badd +1 slides/3.txt
badd +1 slides/4.txt
badd +1 slides/5.txt
badd +1 slides/6.txt
badd +1 slides/7.txt
badd +1 slides/8.txt
edit slides/1.txt
doautoall SessionLoadPost
unlet SessionLoad
