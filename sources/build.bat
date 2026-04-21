@echo off
setlocal

pushd "%~dp0"

if not exist "..\fonts" mkdir "..\fonts" || goto :error
if exist "..\fonts\ToneOZ-Quicksnow.ttf" del /f /q "..\fonts\ToneOZ-Quicksnow.ttf" || goto :error

fontmake -m "ToneOZ-Quicksnow.designspace" -o variable --output-path "..\fonts\ToneOZ-Quicksnow.ttf" || goto :error
python3 merge_reference_tables.py || goto :error
python3 validate_build.py || goto :error

set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%

:error
set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%
