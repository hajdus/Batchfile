@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (  set "DEL=%%a")

:poczatek
echo %username% | find "." > nul
if errorlevel 1 (goto poczatek1) else (goto poczatek2) 

:poczatek1
cls

echo Zalogowany jako: %username%
echo +++++++++++++++++
echo  Wybierz z listy
echo +++++++++++++++++
echo.
call :colorEcho 0a "1) Restart print spoolera na serwerach"
echo.
call :colorEcho 0a "2) Waznosc konta uzytkownika"
echo.
call :colorEcho 0a "3) Lokalizacja dysk Z uzytkownika"
echo.
echo 4) KONIEC
echo.
set /p opcja=wybierz:
if %opcja%==1 goto opcja1
if %opcja%==2 goto opcja2
if %opcja%==3 goto opcja3
if %opcja%==4 exit
goto zly_wybor

:poczatek2
cls
echo Zalogowany jako: %username%
echo +++++++++++++++++
echo  Wybierz z listy
echo +++++++++++++++++
echo.
call :colorEcho 4c "1) Restart print spoolera na serwerach"
echo.
call :colorEcho 0a "2) Waznosc konta uzytkownika"
echo.
call :colorEcho 0a "3) Lokalizacja dysk Z uzytkownika"
echo.
echo 4) KONIEC
echo.

set /p opcja=wybierz:
if %opcja%==1 goto opcjablad
if %opcja%==2 goto opcja2
if %opcja%==3 goto opcja3
if %opcja%==4 exit
goto zly_wybor

:opcja1
cls
echo Czyszczenie spoolera serwer1 czekaj ...
sc \\serwer1.domain.corp stop spooler | find "STATE"
sc \\serwer1.domain.corp start spooler | find "STATE"
echo.
echo Czyszczenie spoolera serwer2 czekaj ...
sc \\serwer2.domain.corp stop spooler | find "STATE"
sc \\serwer2.domain.corp start spooler | find "STATE"
echo.
call :colorEcho 0a "Ukonczono czyszczenie buforow wydruku!"
echo.
pause
goto poczatek

:opcja2
cls
echo "Waznosc konta uzytkownika: "
set /p login=Podaj login usera:
net user %login% /domain | find "aktywne"
net user %login% /domain | find "Wygasanie"
net user %login% /domain | find "wygasa" 


pause
goto poczatek

:opcja3
cls
echo "Adres dysku Z: "
set /p login=Podaj login usera:
net user %login% /domain | find "Katalog" 
echo.
pause
goto poczatek

:opcjablad
cls
call :colorEcho 4c "ZALOGUJ SIE JAKO ADMIN DOMENOWY!"
echo.
pause
goto poczatek

:zly_wybor
call :colorEcho 4c "OPCJA NIE ZNANA.. WYBIERZ PONOWNIE!"
echo.
pause
goto poczatek


:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
