@echo off
set /p id=< .\id.txt
set /p pid=< .\z-2.txt"
jrepl "%pid%" "%id%" /f ..\whatsnew.xml /o -
exit
