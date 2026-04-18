@echo off
setlocal

pushd "%~dp0"

if exist "..\fonts\variable" rmdir /s /q "..\fonts\variable"
mkdir "..\fonts\variable" || goto :error

fontmake -m "ToneOZ-Quicksnow.designspace" -o variable --output-path "..\fonts\variable\ToneOZ-Quicksnow.ttf" || goto :error
python3 merge_reference_tables.py || goto :error
python3 validate_build.py || goto :error

set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%

:error
set "EXIT_CODE=%ERRORLEVEL%"
popd
exit /b %EXIT_CODE%
