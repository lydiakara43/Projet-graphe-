@echo off
setlocal

cd /d "%~dp0"

where g++ >nul 2>nul
if errorlevel 1 (
    echo Erreur : g++ est introuvable.
    echo.
    echo Solution possible :
    echo - installer MSYS2 / MinGW-w64
    echo - ou ajouter le dossier contenant g++.exe au PATH
    echo.
    echo Sur cette machine, g++ est souvent ici :
    echo C:\msys64\ucrt64\bin\g++.exe
    pause
    exit /b 1
)

echo Compilation du projet...
g++ -std=c++17 -O2 -Wall -Wextra src\main.cpp -o graphe_coloration.exe

if errorlevel 1 (
    echo.
    echo La compilation a echoue.
    pause
    exit /b 1
)

echo.
echo Compilation reussie : graphe_coloration.exe
pause

