@echo off
REM Find all locals admins

setlocal enabledelayedexpansion
set csv=\\server1.domain.corp\Log\list.csv
set group=administrators
set /p csv=%computername%,%date%<nul>>!csv!
for /f "skip=6 delims=?" %%u in ('net localgroup !group! ^| findstr /vb Polecenie') do set /p csv=,%%u<nul>>!csv!
echo.>>!csv!
type !csv!
