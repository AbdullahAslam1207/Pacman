INCLUDE Irvine32.inc
includelib winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data

SND_FILENAME DWORD 00020000h
SND_LOOP DWORD  00000008h
SND_ASYNC DWORD 00000001h
file BYTE "t.wav" , 0



ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
ground1 BYTE "|",0ah,0
ground2 BYTE "|",0

temp byte ?

strScore BYTE "Your score is: ",0
score BYTE 0

tempscore db 0

level dd 1

strlives db "LIVES: ", 0
lives db 3

pausegame db "YOUR GAME IS PAUSED:", 0
pauseend  db "                    ", 0
pausegame1 db 255 dup(?)

xPos BYTE 24
yPos BYTE 20

xCoinPos BYTE ?
yCoinPos BYTE ?

leveladdresses dd 0 ; for stroing the address of level1map suppose 

playernamestr db "The name of the player is: ", 0
 playername db ?
inputChar BYTE ?
collision db 0
collison_fruit db 0
splashSize dd 1050 ;
level1mapsize dd 4000;
level1clearedsize dd 1000
wallColor db 9
namescreensize dd 1800;
menusize dd 2000;
namescreen db"                                 ", 0
db"     _______   __________________     ", 0            
db"    / ____/ | / /_  __/ ____/ __ \        ", 0        
db"   / __/ /  |/ / / / / __/ / /_/ /         ", 0       
db"  / /___/ /|  / / / / /___/ _, _/            ", 0     
db" /_____/_/ |_/ /_/ /_____/_/_|_|______        ", 0    
db"                \ \/ / __ \/ / / / __ \        ", 0   
db"                 \  / / / / / / / /_/ /          ", 0 
db"                 / / /_/ / /_/ / _, _/           ", 0 
db"                /_/\____/\____/_/ |_|__  _________", 0
db"                       / | / /   |  /  |/  / ____/", 0
db"                      /  |/ / /| | / /|_/ / __/   ", 0
db"                     / /|  / ___ |/ /  / / /___   ", 0
db"                    /_/ |_/_/  |_/_/  /_/_____/ n" 
                                                 





menu db"78888888888888888888888888888888888888888888888888888888888888888888888888889", 0
db"4    __  __________   ____  __                                              4", 0            
db"4   /  |/  / ____/ | / / / / /                                              4", 0        
db"4  / /|_/ / __/ /  |/ / / / /                                               4", 0    
db"4 / /  / / /___/ /|  / /_/ /                                                4", 0
db"4/_/__/_/_____/_/ |_/\____/______    ____  ______                           4", 0
db"4                                                                           4", 0
db"4  / __ \         / ___/_  __/   |  / __ \/_  __/                           4", 0
db"4 / / / /         \__ \ / / / /| | / /_/ / / /                              4", 0
db"4/ /_/ /         ___/ // / / ___ |/ _, _/ / /                               4", 0
db"4\____(_)       /____//_/_/_/__|_/_/_|_| /_/                                4", 0
db"4                                                                           4", 0
db"4 /_  __/      /  _/ | / / ___/_  __/                                       4", 0
db"4  / /         / //  |/ /\__ \ / /                                          4", 0
db"4 / /        _/ // /|  /___/ // /                                           4", 0
db"4/_(_)___   /___/_/ |_//____//_/__________                                  4", 0
db"4                                                                           4", 0
db"4   / __ \         / ____/ |/ //  _/_  __/                                  4", 0
db"4  / /_/ /        / __/  |   / / /  / /                                     4", 0
db"4 / _, _/        / /___ /   |_/ /  / /                                      4", 0
db"4/_/ |_(_)      /_____//_/|_/___/ /_/                                       4", 0
db"18888888888888888888888888888888888888888888888888888888888888888888888888883n"   


                                                                       
                                                                                                                                        




frontpage db"7888888888888888888888888888888888888888888888888888888888888888888888889", 0
db"4           ____  ___   ________  ______    _   __                      4", 0
db"4          / __ \/   | / ____/  |/  /   |  / | / /                      4", 0
db"4         / /_/ / /| |/ /   / /|_/ / /| | /  |/ /                       4", 0
db"4        / ____/ ___ / /___/ /  / / ___ |/ /|  /                        4", 0
db"4       /_/   /_/  |_\____/_/  /_/_/  |_/_/ |_/                         4", 0
db"1888888888888888888888888888888888888888888888888888888888888888888888883n "



instructions db "  7888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888889 ", 0
  db "  4 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .                                        wINSTRUCTIONS                                                  . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .            wGATHER THE YELLOW DOTS TO EARN POINTS AND GO TO THE NEXT LEVEL.                           . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .            wAVOID THE GHOSTS, YOU HAVE THREE LIVES.                                                   . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .            wGATHER THE FRUITS IN HIGHER LEVEL TO EARN MORE POINTS AND BONUSES                         . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  4 .            wENJOY :)                                                                                  . 4 ", 0
  db "  4 .                                                                                                       . 4 ", 0
  db "  1888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888883n"


level1cleared db"                        ", 0
db"   __   _____   ________     ___ ", 0  
db"  / /  / __/ | / / __/ /    <  /  ", 0  
db" / /__/ _/ | |/ / _// /__   / /    ", 0 
db"/____/___/ |___/___/____/  /_/____ ", 0 
db" / ___/ /  / __/ _ | / _ \/ __/ _ \", 0 
db"/ /__/ /__/ _// __ |/ , _/ _// // /", 0 
db"\___/____/___/_/ |_/_/|_/___/____/ n"

level2cleared db"                                 ", 0
db"    __    _______    __________   ___  ", 0      
db"   / /   / ____/ |  / / ____/ /  |__ \  ", 0     
db"  / /   / __/  | | / / __/ / /   __/ / ", 0      
db" / /___/ /___  | |/ / /___/ /___/ __/ ", 0       
db"/_____/_____/  |___/_____/_____/____/_______ ", 0
db"  / ____/ /   / ____/   |  / __ \/ ____/ __ \", 0
db" / /   / /   / __/ / /| | / /_/ / __/ / / / /", 0
db"/ /___/ /___/ /___/ ___ |/ _, _/ /___/ /_/ / ", 0
db"\____/_____/_____/_/  |_/_/ |_/_____/_____/n" 
                                             
level3cleared db"                                 ", 0
db"    __    _______    __________   _____  ", 0    
db"   / /   / ____/ |  / / ____/ /  |__  /   ", 0   
db"  / /   / __/  | | / / __/ / /    /_ <    ", 0   
db" / /___/ /___  | |/ / /___/ /______/ /    ", 0   
db"/_____/_____/  |___/_____/_____/____/_______", 0 
db"  / ____/ /   / ____/   |  / __ \/ ____/ __ \", 0
db" / /   / /   / __/ / /| | / /_/ / __/ / / / /", 0
db"/ /___/ /___/ /___/ ___ |/ _, _/ /___/ /_/ / ", 0
db"\____/_____/_____/_/  |_/_/ |_/_____/_____/n " 
                                             

gameover db"                                 ", 0
db"   _________    __  _________   ____ _    ____________ ", 0
db"  / ____/   |  /  |/  / ____/  / __ \ |  / / ____/ __ \", 0
db" / / __/ /| | / /|_/ / __/    / / / / | / / __/ / /_/ /", 0
db"/ /_/ / ___ |/ /  / / /___   / /_/ /| |/ / /___/ _, _/ ", 0
db"\____/_/  |_/_/  /_/_____/   \____/ |___/_____/_/ |_|n"  
                                                       




level3map db "7888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888889", 0
db"4 . . 788888889 . 7888889 . . . . . . . . . . . . . . . . . . . . . . . . . . 7888889 . . . . . . . . . . . . . . 4", 0
db"4 . . 4       4 . 4     4 . 788888889 . 78888888889 . . . . . . . . . . . . . 4     4 . . 7888888888889 . 78889 . 4", 0
db"4 . . 4       4 . 1888883 . 4       4 . 4         4 . . 78889 . 788888888888883     4 . . 4           4 . 4   4 . 4", 0
db"4 . . 188888883 . . . . . . 4       4 . 4         4 . . 4   4 . 4                   4 . . 4           4 . 4   4 . 4", 0
db"4 . . . . . . . ~ . . . . . 188888883 . 4         4 . . 4   4 . 188888888888888888883 . . 4           4 . 4   4 ~ 4", 0
db"4 . . 7888888888888888889 . . . . . . . 18888888883 . . 4   4 . . . . . . . . . . . . . . 4           4 . 4   4 . 4", 0
db"4 & . 4                 4 . 4 . 4 . 4 . . . . . . . . . 4   4 . . . . . . . . . . . . . . 4           4 . 4   4 . 4", 0
db"4 . . 4                 4 . 4 . 4 . 4 . 78889 . 78889 . 4   4 . 788888888888888888889 . . 18889   78883 . 4   4 . 4", 0
db"4 . . 1888888888888888883 . . . . . . . 4   4 . 4   4 . 4   4 . 4                   4 . . . . 4   4 . . . 4   4 . 4", 0
db"4 . . . . . . . . . . . . . . . . . . . 4   4 . 4   4 . 4   4 . 4                   4 . 789 . 4   4 . . . 4   4 . 4", 0
db"4 78888888889 . 789 . . 78888888889 . . 4   4 . 4   4 . 4   4 . 4                   4 . 4 4 . 4   4 . . . 4   4 . 4", 0
db"4 4         4 . 4 4 . . 4 HELLO   4 . . 4   4 . 4   4 . 4   4 . 188888888888888888883 . 4 4 . 4   4 . . . 4   4 . 4", 0
db"4 4         4 . 4 4 . . 18888888883 . . 4   4 . 4   4 . 18883 ~ . . . . . . . . . . . . 4 4 . 4   4 . . . 4   4 . 4", 0
db"4 4         4 . 4 4 . . . . . . . . . . 4   4 . 4   4 . . . . . . . . 788888888888889 . 4 4 . 4   4 . . . 4   4 . 4", 0
db"4 4         4 . 4 4 . 7888888888888888883   4 . 4   188888888888889 . 4   LEVEL 3   4 . 4 4 . 18883 . . . 18883 . 4", 0
db"4 4         4 . 4 4 . 4                     4 . 4                 4 . 188888888888883 . 183 . . . . . . . . . . . 4", 0
db"4 1888889   4 . 4 4 . 4                     4 . 4                 4 . 7888889 . . . . . . . . . . . . $ . . . . . 4", 0
db"4 . . . 4   4 . 4 4 . 4                     4 . 4                 4 . 4     4 . 78888888888888888888888888888888884", 0
db"4 . ! . 4   4 . 4 4 . 4                     4 . 4                 4 . 4     4 . 4                                 4", 0
db"4 . . . 4   4 . 4 4 . 4                     4 . 4                 4 . 4     4 . 4                                 4", 0
db"4 . . . 18883 . 4 4 . 18888888888888888888883 . 1888888888888888883 . 4     4 . 4                                 4", 0
db"4 . . . . . . . 4 4 . . . . . . . . . . . . . . . . . . . . . . . . . 4     4 . 4                                 4", 0
db"4 . 7888889 . . 4 18888888889 . 7888888888888888888888889 . 7888889 . 4     4 . 4                                 4", 0
db"4 . 4     4 . . 1888888888883 . 4                       4 . 4     4 . 1888883 . 4                                 4", 0
db"4 . 4     4 . . . . . . . . . ~ 4                       4 . 4     4 . . . . . . 4                                 4", 0
db"4 . 1888883 . . 8888888888888 . 1888888888888888888888883 . 4     4 . 7888889 . 4                                 4", 0
db"4 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1888883 . 1888883 ^ 4                                 4", 0
db"188888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888883n"

                                   

level2map db "7888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888889", 0
db"4 . . 4 . . 4 . . 789 . . . . . . . . . . . . . . . . . . . . . 7888889 . . . . . 4 . . . 4 . . . 788888889 . . . 4", 0
db"4 . . 4 . . 4 . . 4 4 . . 4 . . . . . . . . . . . . . . . . . . 1888883 . . . . . 4 . . . 4 . . . 4       4 . . . 4", 0
db"4 . . 4 . . 4 . . 4 4 . . 4 . . 7888888888889 . . 4 . . . . . . . . . . . . . . . 4 . . . 4 . . . 188888883 . . . 4", 0
db"4 . . 4 . . 4 . . 183 . . 4 . . 4           4 . . 4 . . 788888888888889 . . . . . . . . . . . . . . . . . . . . . 4", 0
db"4 . . . . . . . . . . . . . . . 4           4 . . 4 . . 4             4 . . . 7888888888889   . . . 788888889 . . 4", 0
db"4 7888888888889 . . 7889  . . . 4           4           4             4       4           4         4       4 . . 4", 0
db"4 1888888888883 . . 1883  . . . 1888888888883 ~ . . . . 4             4 . . . 4           4   . . . 4       4 . . 4", 0
db"4 . . . . . . . . . . . . . . . . . . . . . . . . . . . 4             4 . . . 1888888888883   . . . 188888883 . . 4", 0
db"4 7888888888889 . . . . . . . 4 . . 4 . . 788888889 . . 4             4 . 78889 . . . . . . . . . . . . . . . . . 4", 0
db"4 4           188888889 . . . 4 . . 4 . . 4       4 . . 4             4 . 4   4 78888888888888889 . . . . . . . . 4", 0
db"4 4  LEVEL 2          4 . . . 4 . . 4 . . 188888883 . . 4             4 . 4   4 4               4 . 4 . 7888889 . 4", 0
db"4 188888888888888888883 . . . 4 . . 4 . . . . . . . . . 4             4 . 4   4 4               4 . 4 . 4     4 . 4", 0
db"4 . . . . . . . . . . . . . . 4 . . 4 . . . . . . . . . 188888888888883 . 4   4 4               4 . 4 . 4     4 . 4", 0
db"4 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4   4 4               4 . 4 . 4     4 . 4", 0
db"4 . . 7888889 . 7888889 . 788888889 . . 788888889 . . 78888_______88889 . 4   4 4               4 . 4 . 4     4 . 4", 0
db"4 . . 4     4 . 4     4 . 4       4 . . 4       4 . . 4               4 . 4   4 4               4 . 4 . 1888883 . 4", 0
db"4 . . 1888883 . 4     4 . 4       4 . . 4       4 . . 4               4 . 4   4 18888888888888883 . 4 . . . . . . 4", 0
db"4 . . . . . . . 4     4 . 4       4 . . 4       4 . . 4               4 . 4   4 . . . . . . . . . . . . . . . .   4", 0
db"4 . . . . . . . 4     4 . 4       4 . . 4       4 . . 4               4 . 4   4 78888888888888888888888888888888884", 0
db"4 ~ . 7888889 . 4     4 . 4       4 . . 4       4 . . 4               4 . 4   4 4                                 4", 0
db"4 . . 4     4 . 4     4 . 4       4 . . 4       4 . . 18888888888888883 . 4   4 4                                 4", 0
db"4 . . 1888883 . 1888883 . 4       4 . . 4       4 . . . . . . . . . . . . 4   4 4                                 4", 0
db"4 . . . . . . . . . . . . 188888883 . . 188888883 . . . . . . . . . . . . 4   4 4                                 4", 0
db"4 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 78889 . . . . 4   4 4                                 4", 0
db"4 ~ . . . . . . . . . . . . . . . . . . . . . . . 4 . . . . 4   4 . . . . 4   4 4                                 4", 0
db"4 . . . . 7888888888889 . . . 788888888888889 . . 4 . . . . 4   4 .       4   4 4                                 4", 0
db"4 . . . . 1888888888883 . . . 4             4 . . 4 . . . . 4   4 .       4   4 4                                 4", 0
db"4 . . . . . . . . . . . . . . 188888888888883 . . . 888888883   1888888 . 4   4 4                                 4", 0
db"188888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888883n"


level1map db "7888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888889", 0
db"4 . . . . . . . . . . . . . 4 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4", 0
db"4 . . . . . . . . . . . . . 4 . . . . . . . . . . . . . . . . . 4 . . . . . . . . . . . . . . . 7888889 . . . . . 4", 0
db"4 . . 788888889 . . . . . . 4 . . . . . . . . . . . . . . . . . 4 . . . . 78888888888888889 . . 4     4 . . . . . 4", 0
db"4 . . 4       4 . . . . . . 4 . . . . . . . . . . . . . . . . . 4 . . . . 4               4 . . 4     4 . . 4 . . 4", 0
db"4 . . 4       1888889 . . . 4 . . . . . . . . . . . . . . . . . 4 . . . . 4       788888883 . . 4     4 . . 4 . . 4", 0
db"4 . . 4             4 . . . . . . . . 78889 . . . . . . . . . . 4 . . . . 4       4 . . . . . . 4     4 . . 4 . . 4", 0
db"4 . . 4             4 . . . . . . . . 4   4 . . . . . . . . . . 4 . . . . 4       4 . . . . . . 4     4 . . 4 . . 4", 0
db"4 . . 188888888888883 . . . . . . . . 4   4 . . . . . . . . . . 4 . . . . 188888883 . . . . . . 4     4 . . 4 . . 4", 0
db"4 . . . . . . . . . . . . . . . . . . 4   4 . . . . . . . . . . . . . . . . . . . . . . . . . . 4     4 . . . . . 4", 0
db"4 . . 7888888888889 . . . . . 788888883   188888889 . . . . . 7888889 . . . . . . . . . . . . . 4     4 . . 4 . . 4", 0
db"4 . . 4    LEVEL  4 . . . . . 4                   4 . . . . . 4     4 . . 78888888888888889 . . 4     4 . . 4 . . 4", 0
db"4 . . 4     ONE   4 . . . . . 188888889   788888883 . . . . . 4     4 . . 4               4 . . 4     4 . . 4 . . 4", 0
db"4 . . 1888888888883 . . . . .         4   4 . . . . . . . . . 4     4 . . 4               4 . . 4     4 . . 4 . . 4", 0
db"4 . . . . . . . . . . . . . . . . . . 4   4 . . . . . . . . . 4     4 . . 4               4 . . 4     4 . . 4 . . 4", 0
db"4 . . 788888888888889 . . . . . . . . 4   4 . . . . . . . . . 4     4 . . 4               4 . . 4     4 . . 4 . . 4", 0
db"4 . . 4             4 . . . . . . . . 4   4 . . . . . . . . . 4     4 . . 18888888888888883 . . 1888883 . . . . . 4", 0
db"4 . . 4             4 . . . . . . . . 18883 . . . . . . . . . 4     4 . . . . . . . . . . . . . . . . . . . . . . 4", 0
db"4 . . 4             4 . . . . . . . . . . . . . . . . . . . . 1888883 . . . . . 78888888888888888888888888888888884", 0
db"4 . . 4             4 . . . .888888888888 . . . . . . . . . . . . . . . . . . . 4                                 4", 0
db"4 . . 4             4 . . . . . . . . . . . . . 7888889 . . . 4 . . 88888 . . . 4                                 4", 0
db"4 . . 4             4 . . . . . . . . . . . . . 4     4 . . . 4 . . . . . . . . 4                                 4", 0
db"4 . . 188888888888883 . . . . . . . . . . . . . 4     4 . . . 4 . . . . . . . . 4                                 4", 0
db"4 . . . . . . . . . . . . . . . . . . . . . . . 4     4 . . . 4 . . . . . . . . 4                                 4", 0
db"4 . . . . . . . . . . . . . . . . . . . . . . . 4     4 . . . . . . . . . . . . 4                                 4", 0
db"4 . . 78888888888888889 . 78888888888888889 . . 4     4 . . . . . . 4 . 4 . . . 4                                 4", 0
db"4 . . 4               4 . 4               4 . . 4     4 . . . . . . 4 . 4 . . . 4                                 4", 0
db"4 . . 18888888888888883 . 18888888888888883 . . 1888883 . . . . . . . . . . . . 4                                 4", 0
db"4 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4                                 4", 0
db"188888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888883n"

; FRUIT CO-ORDIATES 
FRUITX DB 28
FRUITY DB 72

;THE BELOW VARIABLES ARE FOR GHOSTS 1,2,3,4
; GHOST 1 


G1X db 4 ; x co-ordinate 
G1Y db 2 ; y co-ordinate
BOOLLEFT_G1 db 0;   ; sole purpose is for movement in a single direction 
BOOLRIGHT_G1 db 0; 
BOOLDOWN_G1 db 0; 
BOOLUP_G1 db 1; 

;GHOST 2
G2X db 50 ; x co-ordinate 
G2Y db 26 ; y co-ordinate
BOOLLEFT_G2 db 0;   ; sole purpose is for movement in a single direction 
BOOLRIGHT_G2 db 0; 
BOOLDOWN_G2 db 0; 
BOOLUP_G2 db 1; 

;GHOST 3

G3X db 20 ; x co-ordinate 
G3Y db 14 ; y co-ordinate
BOOLLEFT_G3 db 0;   ; sole purpose is for movement in a single direction 
BOOLRIGHT_G3 db 0; 
BOOLDOWN_G3 db 0; 
BOOLUP_G3 db 1; 

;GHOST 4

G4X db 14 ; x co-ordinate 
G4Y db 27 ; y co-ordinate
BOOLLEFT_G4 db 0;   ; sole purpose is for movement in a single direction 
BOOLRIGHT_G4 db 0; 
BOOLDOWN_G4 db 0; 
BOOLUP_G4 db 1; 



.code
main PROC



mov leveladdresses, offset level1map

call Randomize
call DrawMain
mov dh, 0
mov dl,1
;call Gotoxy
SPLASHSCRN:
call ReadKey
cmp eax, 1
jne nameinitial
mov eax, 10
call Delay
jmp SPLASHSCRN

nameinitial:
    call clrscr
    call Randomize
    call DRAWNAME
    mov dh, 0
    mov dl,1 
    call Gotoxy
    Screen:
        mov dh,20
        mov dl,2
        call gotoxy
        mov ecx, 15
        mov edx,offset playername
        mov ecx,20
        call readstring
    menu1:
        call clrscr
        call Randomize
        call DRAWMENU
        mov dh, 0
        mov dl, 1
        call Gotoxy
        menuscreen:
            call ReadChar
            cmp al,31h 
            je gameinitial 
            cmp al, 32h
            je instruction
            cmp al,33h
            je exitGame
            jmp menuscreen
    instruction:
        call clrscr
        call instructions11
        call Readchar
        cmp eax, 1
        jne gameinitial
        jmp instruction


    gameinitial:
    call clrscr
    

    


    

    call  DRAWLEVEL1MAP


    call DrawPlayer
    call DISPLAYG1

    

    call Randomize

    gameLoop:
    INVOKE PlaySound, offset file,NULL,11h
        ; for the pause part of game 
        ;mov eax, 30
        ;call Delay
        
            
        mov eax,100
        call Delay
        ;call ReadKey
        ;cmp al, 'p'
        ;je pause1
        ;jne carryon
        ;pause1:
         ;   mov dl,85
          ;  mov dh,24
           ; call Gotoxy
            ;mov edx,OFFSET pausegame
            ;call WriteString
            ;call ReadKey
            ;cmp al, 'p'
            ;je carryon
            ;jne pause1
        ;carryon:
          ;  mov dl,85
          ;  mov dh,24
          ;  call Gotoxy
          ;  mov edx,OFFSET pauseend
          ;  call WriteString
          ;  mov al, 0
        cmp level, 3
        je g3time
        jne g3notime
        g3time:
            call G3MOVE
            call G3COLLISONX
            cmp collision, 1
            jne g3notime
            je livedecrement
        g3notime:

        cmp level, 3
        je g4time
        jne g4notime
        g4time:
            call G4MOVE
            call G4COLLISONX
            cmp collision, 1
            jne g4notime
            je livedecrement
        g4notime:
        
        
        cmp level,2 
        jae g2time
        jne g2notime
        g2time:
            call G2MOVE
            call G2COLLISONX
            cmp collision, 1
            jne g2notime
            je livedecrement
        g2notime:
        call G1MOVE   ; for constant moving of ghost
        
        call G1COLLISONX
        cmp collision,1 
        jne continue11
        je livedecrement
        livedecrement:
            cmp level, 3 
            je level3pos
            jne normalpos
            level3pos:
                mov xPos, 20
                mov yPos, 20
                jmp goon
            normalpos:
            mov xPos, 24
            mov yPos,20
            goon:
            call DrawPlayer
            mov collision, 0
            sub lives, 1
            cmp lives, 0
            jne continue11
            je finally
        continue11:
        mov dl,0
        mov dh,0
        call Gotoxy ; just to set the cursor at the first point of the game 
        

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,85
        mov dh,20
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt

       ; draw lives 
        mov dl,85
        mov dh,22
        call Gotoxy
        mov edx,OFFSET strlives
        call WriteString
        mov al,lives
        call WriteInt




        
        ;mov eax, 50
        ;call Delay
        ; get user key input:
        call ReadKey
        ;mov eax, " "
        mov inputChar,al
        

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je finally

        
        cmp inputChar,"a"
        je moveLeft
        cmp inputChar,"s"
        je moveDown
        cmp inputChar,"w"
        je moveUp

        
        cmp inputChar,"d"
        je moveRight

        jmp gameLoop

        moveUp:
        ; allow player to jump:
        movzx eax, yPos;
        movzx ebx, xPos
        call ABOVECHECK
        cmp al, 2eh      ; comparing al with hex of '.' and updating score
        je scoreadd
        jne continue
        scoreadd:
            add score,1
            add tempscore,1 
        continue:
        cmp al,"~" 
        je fruit
        jne continue1
        fruit:
            add score, 5
            add tempscore, 5
        continue1:
        call SHORTCUT1
        call SHORTCUT2
        call MOVEMENTCHECK
        cmp ebx, 1
        je noyoucant

        mov ecx,1
        jumpLoop:
            call UpdatePlayer
            dec yPos
            call DrawPlayer
            mov eax,70
            call Delay
        loop jumpLoop
        noyoucant:
            ;mov eax, " "
            jmp movinon

        moveDown:
        movzx eax, yPos;
        movzx ebx, xPos
        call BELOWCHECK
        cmp al, 2eh      ; comparing al with hex of '.' and updating score
        je scoreadd2
        jne continue2
        scoreadd2:
            add score,1
            add tempscore,1 
        continue2:
        cmp al,"~" 
        je fruit2
        jne continue5
        fruit2:
            add score, 5
            add tempscore, 5
        continue5:
        call SHORTCUT1        ; to see for shortcuts
        call SHORTCUT2
        call MOVEMENTCHECK
        cmp ebx, 1
        je noyoucant2

        call UpdatePlayer
        inc yPos
        call DrawPlayer
        noyoucant2:
            ;mov eax, " "
            jmp movinon

        moveLeft:
        movzx eax, yPos;
        movzx ebx, xPos
        call LEFTCHECK
        cmp al, 2eh      ; comparing al with hex of '.' and updating score
        je scoreadd3
        jne continue3
        scoreadd3:
            add score,1
            add tempscore,1 
        continue3:
        cmp al,"~" 
        je fruit3
        jne continue6
        fruit3:
            add score, 5
            add tempscore, 5
        continue6:
        call SHORTCUT1
        call SHORTCUT2
        call MOVEMENTCHECK
        cmp ebx, 1
        je noyoucant3

        call UpdatePlayer
        sub xPos,2
        call DrawPlayer
        noyoucant3:
            ;mov eax, " "
            jmp movinon

        moveRight:
        movzx eax, yPos;
        movzx ebx, xPos
        call RIGHTCHECK
        cmp al, 2eh      ; comparing al with hex of '.' and updating score
        je scoreadd4
        jne continue4
        scoreadd4:
            add score,1
            add tempscore,1 
        continue4:
        cmp al,"~" 
        je fruit4
        jne continue7
        fruit4:
            add score, 5
            add tempscore, 5
        continue7:
        call SHORTCUT1
        call SHORTCUT2
        call MOVEMENTCHECK
        cmp ebx,1 
        je noyoucant4

        call UpdatePlayer
        add xPos,2
        call DrawPlayer
        noyoucant4:
            ;mov eax, " "
            ;jmp movinon
        
        ; comparing level 1 score with 100 so as to move to next level 
        movinon:
        cmp level , 1
        je level1_score
        cmp level, 2 
        je level2_score
        cmp level, 3
        je level3_score
        level1_score:
            cmp tempscore, 10
            je level1_clear
            jne level1_notclear
        level2_score:
            cmp tempscore, 5
            je level2_clear
            jne level2_notclear
        level3_score:
            cmp tempscore, 150
            je level3_clear
            jne level3_notclear
        compare_levels:
            
        
        level1_clear:
            call clrscr
            call DRAWLEVEL1CLEAR
            call Readchar
            cmp eax, 1
            jne level2movin
            jmp level1_clear

            level2movin:
            mov xpos,24
            mov ypos,16
            call UpdatePlayer
            mov leveladdresses, offset level2map
            
            mov level, 2
            
            ;mov score, 0
            mov tempscore,0
            call clrscr
            call DRAWLEVEL1MAP
            ;mov xPos, 24
            ;mov yPos, 16
            call DrawPlayer
            mov G1X, 2
            mov G1Y, 4
            call DISPLAYG1
            call DISPLAYG2
            call Randomize

            jmp gameLoop

        level2_clear:
            call clrscr
            call DRAWLEVEL2CLEAR
            call Readchar
            cmp eax, 1
            jne level3movin
            jmp level2_clear

            level3movin:
            mov xpos,20
            mov ypos,16
            call UpdatePlayer
            mov leveladdresses, offset level3map
            
            mov level, 3
            
            ;mov score, 0
            mov tempscore,0
            call clrscr
            call DRAWLEVEL1MAP
            ;mov xPos, 24
            ;mov yPos, 16
            call DrawPlayer
            mov G1X, 2
            mov G1Y, 4
            call DISPLAYG1
            mov G2X, 78
            mov G2Y, 26
            call DISPLAYG2
            
            call DISPLAYG3
            call DISPLAYG4
            call Randomize

            jmp gameLoop
            


        level1_notclear:  
        level2_notclear:
        level3_notclear:


        ;mov eax, 100
        ;call Delay
        


        ; for displaying random fruits during level 2
        
           
    

    jmp gameLoop

    
    level3_clear:
    call clrscr
    call DRAWLEVEL3CLEAR
        call Readchar
        cmp eax, 1
        jne finally
        jmp level3_clear
    finally:
    call clrscr
    call GAMEOVER11
    mov dl, 7
    mov dh, 7
    call Gotoxy
    mov edx , offset playernamestr
    call WriteString
    mov edx, offset playername
    call WriteString
    mov dl, 5
    mov dh, 10
    call Gotoxy
    mov edx , offset strScore
    call WriteString
    movzx eax, score
    call Writeint
    call Readchar
        cmp eax, 1
        jne exitGame
        jmp finally
    exitGame: 
    call clrscr
    exit
main ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

UpdatePlayer PROC
    movzx eax, yPos;
    movzx ebx, xPos
    cmp level , 1
    je level1
    cmp level ,2 
    je level2
    cmp level, 3
    je level3
    level1:
        call CHECKPOSFORUPDATE
        jmp continue
    level2:
        call CHECKPOSFORUPDATE_level2
        jmp continue
    level3:
        call CHECKPOSFORUPDATE_level3
    continue:

    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    
    ret
UpdatePlayer ENDP

DrawCoin PROC
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xCoinPos
    mov dh,yCoinPos
    call Gotoxy
    mov al,"."
    call WriteChar
    ret
DrawCoin ENDP







DrawMain PROC 

mov ecx, splashSize
mov esi, OFFSET frontpage

DRAWSPLASHLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done

call DrawWhatYouSee
inc esi
loop DRAWSPLASHLOOP

mov eax, 8
call SetTextColor ; reset text color
done:
ret

DrawMain ENDP


;DRAW LEVE1 MAP 
DRAWLEVEL1MAP PROC

mov ecx, level1mapsize
mov esi, leveladdresses
DRAWMAPLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done

call DrawWhatYouSee
inc esi
loop DRAWMAPLOOP
done:
ret
DRAWLEVEL1MAP endp

; draw level2 map
;DRAW LEVE2 MAP 



; draw level1 map cleared
DRAWLEVEL1CLEAR PROC

mov ecx, level1clearedsize
mov esi, offset level1cleared
DRAWMAPLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done

call DrawWhatYouSee
inc esi
loop DRAWMAPLOOP
done:
ret
DRAWLEVEL1CLEAR endp

DRAWLEVEL2CLEAR PROC

mov ecx, level1clearedsize
mov esi, offset level2cleared
DRAWMAPLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done

call DrawWhatYouSee
inc esi
loop DRAWMAPLOOP
done:
ret
DRAWLEVEL2CLEAR endp

DRAWLEVEL3CLEAR PROC

mov ecx, level1clearedsize
mov esi, offset level3cleared
DRAWMAPLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done

call DrawWhatYouSee
inc esi
loop DRAWMAPLOOP
done:
ret
DRAWLEVEL3CLEAR endp


instructions11 PROC

mov ecx,level1mapsize
mov esi, offset instructions
DRAWMAPLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done

call DrawWhatYouSee
inc esi
loop DRAWMAPLOOP
done:
ret
instructions11 endp


GAMEOVER11 PROC

mov ecx, level1clearedsize
mov esi, offset gameover
DRAWMAPLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done

call DrawWhatYouSee
inc esi
loop DRAWMAPLOOP
done:
ret
GAMEOVER11 endp


;DRAW  enteryourname part in 1st page 
DRAWNAME PROC

mov ecx, namescreensize
mov esi, offset namescreen
DRAWMAPLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done

call DrawWhatYouSee
inc esi
loop DRAWMAPLOOP
done:
ret
DRAWNAME endp

DRAWMENU PROC

mov ecx, menusize
mov esi, offset menu
DRAWMAPLOOP:
mov eax, 0
mov al, [esi]
cmp al, 'n'
je done
call DrawWhatYouSee
inc esi
loop DRAWMAPLOOP
done:
ret
DRAWMENU endp





DrawWhatYouSee PROC

cmp al, "7"
je print7

cmp al, "9"
je print9

cmp al, "1"
je print1

cmp al, "3"
je print3

cmp al, "8"
je print8

cmp al, "4"
je print4

cmp al, "/"
je printbackslash

cmp al, "\"
je printslash


cmp al, "5"
je printbottom

cmp al, "6"
je printblock

cmp al, "!"
je printexclamation

cmp al, "^"
je printpower

cmp al, "&"
je printpercent

cmp al, "$"
je printdollar

cmp al,"~"
je printtilda

cmp al, "@"
je printyellow





cmp al, "."
je printdot

cmp al, "_"
je printunder

cmp al, 0
je printcarriage

cmp al, " "
je printspace

call WriteChar
jmp GOONDRAW

printspace :
mov eax, " "
call WriteChar
jmp GOONDRAW

printyellow :
mov eax, 14
call SetTextColor
jmp printspace


printbackslash:
mov eax, yellow
call SetTextColor
mov eax, 47
call Writechar
jmp GOONDRAW 


printslash:
mov eax, green
call SetTextColor
mov eax, 92
call Writechar
jmp GOONDRAW 


print7 :
call PrintWall7
jmp GOONDRAW

print9 :
call PrintWall9
jmp GOONDRAW

print1 :
call PrintWall1
jmp GOONDRAW

print3 :
call PrintWall3
jmp GOONDRAW

print8 :
call PrintWall8
jmp GOONDRAW

print4 :
call PrintWall4
jmp GOONDRAW

printunder :
call PrintGate
jmp GOONDRAW


printblock :
call PrintTopBlock
jmp GOONDRAW

printbottom :
call PrintBottomBlock
jmp GOONDRAW

printtilda:
call PrintTildaSymbol
jmp GOONDRAW

printexclamation:
call PrintExSymbol
jmp GOONDRAW

printpower:
call  PrintPowSymbol
jmp GOONDRAW

printpercent:
call PrintPerSymbol
jmp GOONDRAW

printdollar:
call PrintDolSymbol
jmp GOONDRAW





printdot :
call PrintDot
jmp GOONDRAW


jmp GOONDRAW



printcarriage :
call CarriageReturn

GOONDRAW :
ret

DrawWhatYouSee ENDP


PrintExSymbol PROC
mov eax, 212
call WriteChar
ret
PrintExSymbol ENDP

PrintPerSymbol PROC

mov eax, 212
call WriteCHar
ret
PrintPerSymbol ENDP

PrintPowSymbol PROC

mov eax, 229
call WriteCHar
ret
PrintPowSymbol ENDP


PrintDolSymbol PROC

mov eax, 229
call WriteCHar
ret

PrintDolSymbol ENDP



PrintOne PROC

mov eax, 49
call WriteChar

ret

PrintOne ENDP


PrintBlock PROC

mov eax, 219
call WriteChar

ret

PrintBlock ENDP

PrintTildaSymbol PROC
mov eax, 254
call WriteChar

ret
PrintTildaSymbol ENDP



PrintTopBlock PROC

mov eax, 223
call WriteChar

ret

PrintTopBlock ENDP



PrintBottomBlock PROC

mov eax, 252
call WriteChar

ret

PrintBottomBlock ENDP



PrintWall7 PROC

movzx eax, wallColor
call SetTextColor
mov eax, 201
call WriteChar

ret

PrintWall7 ENDP

PrintWall9 PROC

movzx eax, wallColor
call SetTextColor
mov eax, 187
call WriteChar

ret

PrintWall9 ENDP



PrintWall1 PROC

movzx eax, wallColor
call SetTextColor
mov eax, 200
call WriteChar

ret

PrintWall1 ENDP



PrintWall3 PROC

movzx eax, wallColor
call SetTextColor
mov eax, 188
call WriteChar

ret

PrintWall3 ENDP



PrintWall8 PROC

movzx eax, wallColor
call SetTextColor
mov eax, 205
call WriteChar

ret

PrintWall8 ENDP


PrintWall4 PROC

movzx eax, wallColor
call SetTextColor
mov eax, 186
call WriteChar

ret

PrintWall4 ENDP



PrintDot PROC

mov eax, 7
call SetTextColor
mov eax, 250
call WriteChar

ret

PrintDot ENDP


PrintGate PROC

mov eax, 12
call SetTextColor
mov eax, 196
call WriteChar

ret

PrintGate ENDP








; ::CARRIAGERETURN ::
; goes to the next line

CarriageReturn PROC

call crlf

ret

CarriageReturn ENDP

; THE BELOW PROCEDURES ARE FOR CHEKING PACMANS MOVEMENT IF POSSIBLE 


ABOVECHECK PROC

dec eax
call CHECKPOS ; this is called so as to check the value above the cuurent pac pos if it is valid 
ret
ABOVECHECK endp

BELOWCHECK PROC

inc eax
call CHECKPOS
ret
BELOWCHECK endp

RIGHTCHECK PROC

add ebx, 2
call CHECKPOS 
ret

RIGHTCHECK endp

LEFTCHECK PROC

sub ebx, 2
call CHECKPOS
ret

LEFTCHECK endp


CHECKPOS PROC

mov esi, leveladdresses
push ebx
mov ebx, lengthof level1map
mul ebx 
pop ebx 
add eax, ebx
add esi, eax
mov al, [esi]

ret 
CHECKPOS endp


CHECKPOSFORUPDATE PROC

mov esi, leveladdresses
push ebx
mov ebx, lengthof level1map
mul ebx 
pop ebx 
add eax, ebx
add esi, eax
mov level1map[eax], ' '

ret 
CHECKPOSFORUPDATE endp


CHECKPOSFORUPDATE_level2 PROC

mov esi, leveladdresses
push ebx
mov ebx, lengthof level1map
mul ebx 
pop ebx 
add eax, ebx
add esi, eax
mov level2map[eax], ' '

ret 
CHECKPOSFORUPDATE_level2 endp


CHECKPOSFORUPDATE_level3 PROC

mov esi, leveladdresses
push ebx
mov ebx, lengthof level1map
mul ebx 
pop ebx 
add eax, ebx
add esi, eax
mov level3map[eax], ' '

ret 
CHECKPOSFORUPDATE_level3 endp




MOVEMENTCHECK PROC

cmp al,"$"
je invalid 
 
cmp al,"^"
je invalid
 
cmp al, 30h
jl valid

cmp al,5Fh 
je invalid 

cmp al, 39h
jg valid 

invalid:
    mov ebx ,1 
valid:
    ret 

MOVEMENTCHECK endp


; FOR SHORTCUTS 
SHORTCUT1 PROC

cmp al,"!"
je true11
jne false11
true11:
    
    call UpdatePlayer
    mov xPos, 102
    mov yPos, 16

    call DrawPlayer
false11:
    

ret
SHORTCUT1 ENDP


SHORTCUT2 PROC

cmp al,"&"
je true11
jne false11
true11:
    
    call UpdatePlayer
    mov xPos, 78
    mov yPos, 26  

    call DrawPlayer
false11:
    

ret
SHORTCUT2 ENDP


;THIS PART IS FOR GHOST1 APPEARNACES AND ITS CHECKS 




DISPLAYG1 PROC

mov eax, red
call SetTextColor
mov dl, G1X
mov dh, G1Y
call Gotoxy
mov al, "A"
call WriteChar
ret

DISPLAYG1 endp

UPDATEG1 PROC

mov dl, G1X
mov dh, G1Y
call Gotoxy
mov esi, leveladdresses
movzx eax, G1Y
movzx ebx, G1X
call CHECKPOS; returns the character at the x position in eax and the y position in ebx in al
call DrawWhatYouSee; draws the character we got from calling the call above at G1XCoord and G1YCoord

ret

UPDATEG1 endp

G1MOVE PROC
mov al, 1
cmp al, BOOLUP_G1
je moveup
cmp al, BOOLDOWN_G1
je movedown
cmp al, BOOLLEFT_G1
je moveleft
jmp moveright
moveup :
movzx eax, G1Y
movzx ebx, G1X
call ABOVECHECK
call MOVEMENTCHECK
; mov ecx, ebx
cmp ebx, 1
jne passed1
je booloff1
booloff1 :
mov BOOLUP_G1, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown1
cmp eax, 1
je boolright1
cmp eax, 2
je boolleft1
booldown1 :
mov BOOLDOWN_G1, 1
jmp final1
boolright1 :
mov BOOLRIGHT_G1, 1
jmp final1
boolleft1 :
mov BOOLLEFT_G1, 1
final1 :

    ; cmp ecx, 1
    je out1
    passed1 :
call UPDATEG1
dec G1Y
call DISPLAYG1
jmp out1
movedown :
movzx eax, G1Y
movzx ebx, G1X
call BELOWCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed2
je booloff2

booloff2 :
mov BOOLDOWN_G1, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown2
cmp eax, 1
je boolright2
cmp eax, 2
je boolleft2
booldown2 :
mov BOOLUP_G1, 1
jmp final2
boolright2 :
mov BOOLRIGHT_G1, 1
jmp final2
boolleft2 :
mov BOOLLEFT_G1, 1
final2 :

    je out1
    passed2 :
call UPDATEG1
inc G1Y
call DISPLAYG1
jmp out1
moveright :
movzx eax, G1Y
movzx ebx, G1X
call RIGHTCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed3
je booloff3
booloff3 :
mov BOOLRIGHT_G1, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown3
cmp eax, 1
je boolright3
cmp eax, 2
je boolleft3
booldown3 :
mov BOOLDOWN_G1, 1
jmp final3
boolright3 :
mov BOOLUP_G1, 1
jmp final3
boolleft3 :
mov BOOLLEFT_G1, 1
final3 :
    je out1
    passed3 :
call UPDATEG1
add G1X, 2
call DISPLAYG1
jmp out1
moveleft :
movzx eax, G1Y
movzx ebx, G1X
call LEFTCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed4
je booloff4
booloff4 :
mov BOOLLEFT_G1, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown4
cmp eax, 1
je boolright4
cmp eax, 2
je boolleft4
booldown4 :
mov BOOLDOWN_G1, 1
jmp final4
boolright4 :
mov BOOLRIGHT_G1, 1
jmp final4
boolleft4 :
mov BOOLRIGHT_G1, 1
final4 :
    je out1
    passed4 :
call UPDATEG1
sub G1X, 2
call DISPLAYG1
jmp out1
out1 :
ret


G1MOVE endp


G1COLLISONX PROC

mov al, G1Y
cmp al, yPos
je check
jne out1
check :
mov al, G1X
cmp al, xPos
jne out1
mov collision, 1
out1 :
    ret
    G1COLLISONX endp

;ghost 2

DISPLAYG2 PROC

mov eax, red
call SetTextColor
mov dl, G2X
mov dh, G2Y
call Gotoxy
mov al, "B"
call WriteChar
ret

DISPLAYG2 endp

UPDATEG2 PROC

mov dl, G2X
mov dh, G2Y
call Gotoxy
mov esi, leveladdresses
movzx eax, G2Y
movzx ebx, G2X
call CHECKPOS; returns the character at the x position in eax and the y position in ebx in al
call DrawWhatYouSee; draws the character we got from calling the call above at G1XCoord and G1YCoord

ret

UPDATEG2 endp

G2MOVE PROC
mov al, 1
cmp al, BOOLUP_G2
je moveup
cmp al, BOOLDOWN_G2
je movedown
cmp al, BOOLLEFT_G2
je moveleft
jmp moveright
moveup :
movzx eax, G2Y
movzx ebx, G2X
call ABOVECHECK
call MOVEMENTCHECK
; mov ecx, ebx
cmp ebx, 1
jne passed1
je booloff1
booloff1 :
mov BOOLUP_G2, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown1
cmp eax, 1
je boolright1
cmp eax, 2
je boolleft1
booldown1 :
mov BOOLDOWN_G2, 1
jmp final1
boolright1 :
mov BOOLRIGHT_G2, 1
jmp final1
boolleft1 :
mov BOOLLEFT_G2, 1
final1 :

    ; cmp ecx, 1
    je out1
    passed1 :
call UPDATEG2
dec G2Y
call DISPLAYG2
jmp out1
movedown :
movzx eax, G2Y
movzx ebx, G2X
call BELOWCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed2
je booloff2

booloff2 :
mov BOOLDOWN_G2, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown2
cmp eax, 1
je boolright2
cmp eax, 2
je boolleft2
booldown2 :
mov BOOLUP_G2, 1
jmp final2
boolright2 :
mov BOOLRIGHT_G2, 1
jmp final2
boolleft2 :
mov BOOLLEFT_G2, 1
final2 :

    je out1
    passed2 :
call UPDATEG2
inc G2Y
call DISPLAYG2
jmp out1
moveright :
movzx eax, G2Y
movzx ebx, G2X
call RIGHTCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed3
je booloff3
booloff3 :
mov BOOLRIGHT_G2, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown3
cmp eax, 1
je boolright3
cmp eax, 2
je boolleft3
booldown3 :
mov BOOLDOWN_G2, 1
jmp final3
boolright3 :
mov BOOLUP_G2, 1
jmp final3
boolleft3 :
mov BOOLLEFT_G2, 1
final3 :
    je out1
    passed3 :
call UPDATEG2
add G2X, 2
call DISPLAYG2
jmp out1
moveleft :
movzx eax, G2Y
movzx ebx, G2X
call LEFTCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed4
je booloff4
booloff4 :
mov BOOLLEFT_G2, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown4
cmp eax, 1
je boolright4
cmp eax, 2
je boolleft4
booldown4 :
mov BOOLDOWN_G2, 1
jmp final4
boolright4 :
mov BOOLRIGHT_G2, 1
jmp final4
boolleft4 :
mov BOOLRIGHT_G2, 1
final4 :
    je out1
    passed4 :
call UPDATEG2
sub G2X, 2
call DISPLAYG2
jmp out1
out1 :
ret


G2MOVE endp


G2COLLISONX PROC

mov al, G2Y
cmp al, yPos
je check
jne out1
check :
mov al, G2X
cmp al, xPos
jne out1
mov collision, 1
out1 :
    ret
G2COLLISONX endp


;GHOST 3
DISPLAYG3 PROC

mov eax, red
call SetTextColor
mov dl, G3X
mov dh, G3Y
call Gotoxy
mov al, "C"
call WriteChar
ret

DISPLAYG3 endp

UPDATEG3 PROC

mov dl, G3X
mov dh, G3Y
call Gotoxy
mov esi, leveladdresses
movzx eax, G3Y
movzx ebx, G3X
call CHECKPOS; returns the character at the x position in eax and the y position in ebx in al
call DrawWhatYouSee; draws the character we got from calling the call above at G1XCoord and G1YCoord

ret

UPDATEG3 endp

G3MOVE PROC
mov al, 1
cmp al, BOOLUP_G3
je moveup
cmp al, BOOLDOWN_G3
je movedown
cmp al, BOOLLEFT_G3
je moveleft
jmp moveright
moveup :
movzx eax, G3Y
movzx ebx, G3X
call ABOVECHECK
call MOVEMENTCHECK
; mov ecx, ebx
cmp ebx, 1
jne passed1
je booloff1
booloff1 :
mov BOOLUP_G3, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown1
cmp eax, 1
je boolright1
cmp eax, 2
je boolleft1
booldown1 :
mov BOOLDOWN_G3, 1
jmp final1
boolright1 :
mov BOOLRIGHT_G3, 1
jmp final1
boolleft1 :
mov BOOLLEFT_G3, 1
final1 :

    ; cmp ecx, 1
    je out1
    passed1 :
call UPDATEG3
dec G3Y
call DISPLAYG3
jmp out1
movedown :
movzx eax, G3Y
movzx ebx, G3X
call BELOWCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed2
je booloff2

booloff2 :
mov BOOLDOWN_G3, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown2
cmp eax, 1
je boolright2
cmp eax, 2
je boolleft2
booldown2 :
mov BOOLUP_G3, 1
jmp final2
boolright2 :
mov BOOLRIGHT_G3, 1
jmp final2
boolleft2 :
mov BOOLLEFT_G3, 1
final2 :

    je out1
    passed2 :
call UPDATEG3
inc G3Y
call DISPLAYG3
jmp out1
moveright :
movzx eax, G3Y
movzx ebx, G3X
call RIGHTCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed3
je booloff3
booloff3 :
mov BOOLRIGHT_G3, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown3
cmp eax, 1
je boolright3
cmp eax, 2
je boolleft3
booldown3 :
mov BOOLDOWN_G3, 1
jmp final3
boolright3 :
mov BOOLUP_G3, 1
jmp final3
boolleft3 :
mov BOOLLEFT_G3, 1
final3 :
    je out1
    passed3 :
call UPDATEG3
add G3X, 2
call DISPLAYG3
jmp out1
moveleft :
movzx eax, G3Y
movzx ebx, G3X
call LEFTCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed4
je booloff4
booloff4 :
mov BOOLLEFT_G3, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown4
cmp eax, 1
je boolright4
cmp eax, 2
je boolleft4
booldown4 :
mov BOOLDOWN_G3, 1
jmp final4
boolright4 :
mov BOOLRIGHT_G3, 1
jmp final4
boolleft4 :
mov BOOLRIGHT_G3, 1
final4 :
    je out1
    passed4 :
call UPDATEG3
sub G3X, 2
call DISPLAYG3
jmp out1
out1 :
ret


G3MOVE endp


G3COLLISONX PROC

mov al, G3Y
cmp al, yPos
je check
jne out1
check :
mov al, G3X
cmp al, xPos
jne out1
mov collision, 1
out1 :
    ret
G3COLLISONX endp


;GHOST 4

DISPLAYG4 PROC

mov eax, red
call SetTextColor
mov dl, G4X
mov dh, G4Y
call Gotoxy
mov al, "D"
call WriteChar
ret

DISPLAYG4 endp

UPDATEG4 PROC

mov dl, G4X
mov dh, G4Y
call Gotoxy
mov esi, leveladdresses
movzx eax, G4Y
movzx ebx, G4X
call CHECKPOS; returns the character at the x position in eax and the y position in ebx in al
call DrawWhatYouSee; draws the character we got from calling the call above at G1XCoord and G1YCoord

ret

UPDATEG4 endp

G4MOVE PROC
mov al, 1
cmp al, BOOLUP_G4
je moveup
cmp al, BOOLDOWN_G4
je movedown
cmp al, BOOLLEFT_G4
je moveleft
jmp moveright
moveup :
movzx eax, G4Y
movzx ebx, G4X
call ABOVECHECK
call MOVEMENTCHECK
; mov ecx, ebx
cmp ebx, 1
jne passed1
je booloff1
booloff1 :
mov BOOLUP_G4, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown1
cmp eax, 1
je boolright1
cmp eax, 2
je boolleft1
booldown1 :
mov BOOLDOWN_G4, 1
jmp final1
boolright1 :
mov BOOLRIGHT_G4, 1
jmp final1
boolleft1 :
mov BOOLLEFT_G4, 1
final1 :

    ; cmp ecx, 1
    je out1
    passed1 :
call UPDATEG4
dec G4Y
call DISPLAYG4
jmp out1
movedown :
movzx eax, G4Y
movzx ebx, G4X
call BELOWCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed2
je booloff2

booloff2 :
mov BOOLDOWN_G4, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown2
cmp eax, 1
je boolright2
cmp eax, 2
je boolleft2
booldown2 :
mov BOOLUP_G4, 1
jmp final2
boolright2 :
mov BOOLRIGHT_G4, 1
jmp final2
boolleft2 :
mov BOOLLEFT_G4, 1
final2 :

    je out1
    passed2 :
call UPDATEG4
inc G4Y
call DISPLAYG4
jmp out1
moveright :
movzx eax, G4Y
movzx ebx, G4X
call RIGHTCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed3
je booloff3
booloff3 :
mov BOOLRIGHT_G4, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown3
cmp eax, 1
je boolright3
cmp eax, 2
je boolleft3
booldown3 :
mov BOOLDOWN_G4, 1
jmp final3
boolright3 :
mov BOOLUP_G4, 1
jmp final3
boolleft3 :
mov BOOLLEFT_G4, 1
final3 :
    je out1
    passed3 :
call UPDATEG4
add G4X, 2
call DISPLAYG4
jmp out1
moveleft :
movzx eax, G4Y
movzx ebx, G4X
call LEFTCHECK
call MOVEMENTCHECK
cmp ebx, 1
jne passed4
je booloff4
booloff4 :
mov BOOLLEFT_G4, 0
call Randomize
mov eax, 3
call RandomRange
cmp eax, 0
je booldown4
cmp eax, 1
je boolright4
cmp eax, 2
je boolleft4
booldown4 :
mov BOOLDOWN_G4, 1
jmp final4
boolright4 :
mov BOOLRIGHT_G4, 1
jmp final4
boolleft4 :
mov BOOLRIGHT_G4, 1
final4 :
    je out1
    passed4 :
call UPDATEG3
sub G4X, 2
call DISPLAYG3
jmp out1
out1 :
ret


G4MOVE endp


G4COLLISONX PROC

mov al, G4Y
cmp al, yPos
je check
jne out1
check :
mov al, G4X
cmp al, xPos
jne out1
mov collision, 1
out1 :
    ret
G4COLLISONX endp

    

END main