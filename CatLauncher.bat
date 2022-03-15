@echo off

rem Color Info
rem 0 = Black    And    8 = Gray
rem 1 = Blue     And    9 = Light Blue
rem 2 = Green    And    A = Light Green
rem 3 = Aqua     And    B = Light Aqua
rem 4 = Red      And    C = Light Red
rem 5 = Purple   And    D = Light Purple
rem 6 = Yellow   And    E = Light Yellow
rem 7 = White    And    F = Bright White

set "ASHESOBLIGE=AshesOblige-master.zip"

:LCHR
cls
color 03
echo .----------------------------------------------------------------.
echo .              .:.      Felix, The Cat Launcher                  .
echo .             .::::.                                             .
echo . ..         ..::::::''::                                        .
echo . ::::..  .::''''':::    ''.                                     .
echo . ':::::::'         '.  ..  '.           Hello Beautiful         .
echo . ::::::'            : '::   :                                   .
echo .  :::::     .        : ':'   :                                  .
echo .  :::::    :::       :.     .'.        Felix Welcomes You       .
echo . .::::::    ':'     .' '.:::: :                                 .
echo . ::::::::.         .    ::::: :                                 .
echo . :::::    '':.... ''      '''' :           Lets Play!           .
echo . ':::: .:'              ...'' :                                 .
echo . ..::.   '.........:::::'   :                                   .
echo .  '':::.   '::'':'':::'   .'                                    .
echo .        '..  ''.....'  ..'                                      .
echo .           ''........''                                CTL v1.1 .
echo .----------------------------------------------------------------.
pause
cls


:FILECHQ1
IF EXIST freedoom2.wad (
goto :FILECHQ2
) ELSE (
goto :NOFREWAD
)

:FILECHQ2
IF EXIST AshesOblige-master.zip (
goto :FILECHQ3
) ELSE (
goto :NOASHOBL
)

:FILECHQ3
IF EXIST ctl (
goto :FILECHQ4
) ELSE (
goto :NOCTL
)

:FILECHQ4
IF EXIST maps (
goto :QUIF
) ELSE (
goto :NOMAP
)

:NOMAP
cls
color 0C
echo X------------------------------------------------------------------------X
echo                         Oblige Maps Not Found :( 
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .              Please Copy maps folder In This GZDoom Folder             .
echo .                                                                        .                
echo .                 Please Read The Install.txt For More Info              .                 
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
echo .                                                                        
echo .
type ctl\INSTALL.type > Install.txt
pause
goto :LCHR


:NOCTL
cls
color 0C
echo X------------------------------------------------------------------------X
echo                          Launcher Files Not Found :( 
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .              Please Copy ctl folder In This GZDoom Folder              .
echo .                                                                        .                
echo .                 Please Read The Install.txt For More Info              .                 
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
echo .                                                                        
echo .
type ctl\INSTALL.type > Install.txt
pause
goto :LCHR

:NOFREWAD
cls
color 0C
echo X------------------------------------------------------------------------X
echo                             Base Game Not Found :(
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .              Please Copy freedoom2.wad In This GZDoom Folder           .
echo .                                                                        .                
echo .                 Please Read The Install.txt For More Info              .                 
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
echo .                                                                        
echo .
type ctl\INSTALL.type > Install.txt
pause
goto :LCHR

:NOASHOBL
cls
color 0C
echo X------------------------------------------------------------------------X
echo                            Core Game Not Found :(
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .         Please Copy AshesOblige-master.zip In This GZDoom Folder       .
echo .                                                                        .                
echo .                 Please Read The Install.txt For More Info              .                 
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
echo .                                                                        
echo .
type ctl\INSTALL.type > Install.txt
pause
goto :LCHR


:QUIF
IF EXIST QuickGame.bat (
    goto :INTRO1
) ELSE (
    goto :INTRO
)

:SET1
dir ctl\*.set /b > ctl\settings.data

set "fileset=settings.data"
set /A k=0
cd ctl
for /F "usebackq delims=" %%s in ("%fileset%") do (
set /A k+=1
call set setting[%%k%%]=%%s
call set n1=%%k%%
)
cd ..
if %k%==0 goto :NOSET
goto :SET2


:SET2
color 0B
cls
echo X------------------------------------------------------------------------X
echo                                 Settings
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .                
echo .                      Total SET File Found : %n1%                          .                 
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X         
echo [0] : Go Back To Previous Menu                                               
for /L %%p in (1,1,%k%) do call echo [%%p] : %%setting[%%p]%%
echo X------------------------------------------------------------------------X
echo        Type The Number For Anyone Setting Preset Selection
set /p "G=>"
iF %G% LSS 0 goto :SET2
if %G%==0 goto :QUIF
If %G% LEQ %k% goto :SETDONE
goto :SET2


:SETDONE
cd ctl
color 0B
echo X------------------------------------------------------------------------X
echo                                 Setting Done!
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                  Now, You Can Go Back And Launch The Game              .
echo .                                                                        .                
echo .                                                                        .                 
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
call echo %%setting[%G%]%% > selectedsetting.data
set "selectset=selectedsetting.data"
for /F "usebackq delims=" %%o in ("%selectset%") do (
set /A m+=1
call set selectset[%%m%%]=%%o
call set n2=%%m%%
)
type %selectset[1]% > ..\gzdoom-%username%.ini
pause
cd ..
cls
goto :QUIF     


:NOSET
cls
color 0C
echo X------------------------------------------------------------------------X
echo                           No Settings File Found :(
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .               Please Copy set files  Inside - ctl Folder               .
echo .                                                                        .                
echo .                Please Read The Install.txt For More Info               .                 
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
echo .                                                                        
echo .
type CTL\INSTALL.type > Install.txt
pause
goto :QUIF                              


:INTRO1
cls
color 0D
echo X------------------------------------------------------------------------X
echo                                Welcome Again :3
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .                 [1] Launch Ashes-Oblige (Without Maps Packs)           .
echo .                                                                        .
echo .                 [2] Launch Ashes-Oblige (Using Map Launcher)           .
echo .                                                                        .
echo .                 [3] Lets Play With The Previous Map Selection          .
echo .                                                                        .
echo .                 [4] Settings                                           .
echo .                                                                        .
echo X------------------------------------------------------------------------X
echo                       Type The Number For Option Selection
set /p "Z=>"
if %Z%==1 goto :AO1
if %Z%==2 goto :AO2
if %Z%==3 goto :QUIK
if %Z%==4 goto :SET1
cls
goto :INTRO1

:QUIK
color 0E
echo X------------------------------------------------------------------------X
echo                               Load Successfully!
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .                
echo .                                Fully Loaded!                           .                 
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
call QuickGame.bat
pause
goto :LCHR

:INTRO
cls
color 0D
echo X------------------------------------------------------------------------X
echo                           What Would You Like To Do?
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .                 [1] Launch Ashes-Oblige (Without Maps Packs)           .
echo .                                                                        .
echo .                 [2] Launch Ashes-Oblige (Using Map Launcher)           .
echo .                                                                        .
echo .                 [3] Settings                                           .
echo .                                                                        .
echo X------------------------------------------------------------------------X
echo                       Type The Number For Option Selection
set /p "C=>"
if %C%==1 goto :AO1
if %C%==2 goto :AO2
if %C%==3 goto :SET1
cls 
goto :QUIF

:AO1
color 0A
echo X------------------------------------------------------------------------X
echo                                     Done!
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .                
echo .                              Game Launched!                            .                 
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
gzdoom.exe -iwad freedoom2.wad -file AshesOblige-master.zip
pause
goto :QUIF

:AO2
color 0A
dir maps\*.wad /b > mapdata.map

set "file=mapdata.map"
set /A i=0

for /F "usebackq delims=" %%a in ("%file%") do (
set /A i+=1
rem call echo %%i%%
call set map[%%i%%]=%%a
call set n=%%i%%
)
if %i%==0 goto :NOMAPWAD
goto :MPLR

:NOMAPWAD
cls
color 0C
echo X------------------------------------------------------------------------X
echo                           No Map-Wad File Found :( 
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .               Please Copy Some Map-Wads Inside - maps Folder           .
echo .                                                                        .                
echo .                 Please Read The Install.txt For More Info              .                 
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
echo .                                                                        
echo .
type CTL\INSTALL.type > Install.txt
pause
goto :QUIF                                                                         


:MPLR
color 0A
cls
echo X------------------------------------------------------------------------X
echo                                 Map Launcher
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .                
echo .                      Total Map-Wad File Found : %i%                      .                 
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X         
echo [0] : Exit This Map Launcher                                               
for /L %%i in (1,1,%n%) do call echo [%%i] : %%map[%%i]%%
rem call echo start gzdoom.exe -iwad freedoom2.wad -file maps/%%map[%i%]%% -file AshesOblige-master.zip
echo X------------------------------------------------------------------------X
echo      Type The Number For Option Selection (You Can Choose Only One Map)
set /p "V=>"
iF %V% LSS 0 goto :MPLR
if %V%==0 goto :QUIF
If %V% LEQ %N% goto :ASHL
goto :MPLR

:ASHL
color 0B
echo X------------------------------------------------------------------------X
echo                                     Done!
echo X------------------------------------------------------------------------X
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .                
echo .                          Game Launched With The Map                    .                 
echo .                                                                        .
echo .                                                                        .
echo .                                                                        .
echo X------------------------------------------------------------------------X
call echo gzdoom.exe -iwad freedoom2.wad -file maps/%%map[%V%]%% -file AshesOblige-master.zip > QuickGame.bat
call QuickGame.bat
pause
cls
goto :QUIF    
