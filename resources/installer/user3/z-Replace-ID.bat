:MENU
@ECHO OFF
mode 50,12
set /p app1=< .\replace-id\z-1.txt
set /p app2=< .\replace-id\z-2.txt
set /p app3=< .\replace-id\z-3.txt
ECHO                 QUICKLAUNCHER ID
ECHO.
ECHO ..................................................
ECHO.
ECHO APP01 : %app1%
ECHO APP02 : %app2%
ECHO APP03 : %app3%
ECHO.
@set /p id="Vita ID (CAPS or #): "
@echo|set /p="%id%"> "replace-id/id.txt"
SET /P M=Type app # :
IF %M%==1 GOTO APP01
IF %M%==2 GOTO APP02
IF %M%==3 GOTO APP03

:APP01
cd ".\replace-id"
start rename-APP01-OUT.bat
timeout 2 >nul
copy ".\id.txt" ".\z-1.txt"
exit

:APP02
cd ".\replace-id"
start rename-APP02-OUT.bat
timeout 2 >nul
copy ".\id.txt" ".\z-2.txt"
exit

:APP03
cd ".\replace-id"
start rename-APP03-OUT.bat
timeout 2 >nul
copy ".\id.txt" ".\z-3.txt"
exit
