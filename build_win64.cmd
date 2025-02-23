@echo off

if not "%~1" == "" (
  set QT_DIR=%1
) else (
  set QT_DIR="C:\Qt\6.5.0\msvc2019_64\bin"
)
set QT_DIR=%QT_DIR:"=%

set PRO=%~dp0kleiner-brauhelfer-2.pro
set BUILD_DIR=%~dp0build-win64

if not exist "%QT_DIR%" (
  echo Error: Qt directory not found
  echo Usage: build_win64.cmd ^<qt-bin-directory^>
  echo Default: build_win64.cmd C:\Qt\6.5.0\msvc2019_64\bin
  exit /b -1
)

if not exist "%QT_DIR%\qmake.exe" (
  echo Error: qmake.exe not found in "%QT_DIR%"
  exit /b -1
)

for /f "usebackq delims=#" %%a in (`"%PROGRAMFILES(x86)%\Microsoft Visual Studio\Installer\vswhere" -products * -latest -property installationPath`) do set VSPATH=%%a
if not defined VSPATH (
  echo Error: Visual Studio installation not found
  exit \b -1
)
call "%VSPATH%\VC\Auxiliary\Build\vcvars64.bat" > nul 2>&1

mkdir %BUILD_DIR%
cd %BUILD_DIR%
"%QT_DIR%\qmake.exe" "%PRO%" -config release
nmake
cd %~dp0
