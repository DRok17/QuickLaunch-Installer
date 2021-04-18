@echo off
IF EXIST .\app01.png (
    GOTO NEXT2
  ) ELSE (
    for %%i in (.\*.png*) do if not "%%i"==".\app02.png" if not "%%i"==".\app03.png" ren "%%i" "app01.png"
    GOTO EOF
  )

:NEXT2
@echo off
IF EXIST .\app02.png (
    GOTO NEXT3
  ) ELSE (
    for %%i in (.\*.png*) do if not "%%i"==".\app01.png" if not "%%i"==".\app03.png" ren "%%i" "app02.png"
    GOTO EOF
  )

:NEXT3
@echo off
IF EXIST .\app03.png (
    GOTO NEXT1
  ) ELSE (
    for %%i in (.\*.png*) do if not "%%i"==".\app01.png" if not "%%i"==".\app02.png" ren "%%i" "app03.png"
    GOTO EOF
  )

:EOF
exit

--- all ---
for %%i in (.\*.png*) do if not "%%i"==".\app01.png" if not "%%i"==".\app02.png" if not "%%i"==".\app03.png" ren "%%i" "app01.png"