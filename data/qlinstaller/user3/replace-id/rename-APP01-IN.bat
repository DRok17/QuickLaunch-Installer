@echo off
set /p id=< .\id.txt
set /p pid=< .\z-1.txt"
jrepl "%pid%" "%id%" /f ..\whatsnew.xml /o -
exit
