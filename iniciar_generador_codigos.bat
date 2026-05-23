@echo off
:: ─────────────────────────────────────────────────────────────
::  Generador de Códigos de Inventario — Servidor Local
::  Coloque este archivo en la misma carpeta que
::  generador_codigos_inventario.html y ejecute con doble clic.
:: ─────────────────────────────────────────────────────────────

cd /d "%~dp0"

:: Verificar si Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo Python no está instalado o no está en el PATH.
    echo Descárguelo en https://www.python.org/downloads/
    echo Asegúrese de marcar "Add Python to PATH" durante la instalación.
    pause
    exit /b 1
)

:: Puerto fijo — no cambiar para preservar datos guardados
set PORT=8400

:: Verificar si el puerto está ocupado
netstat -an | find ":%PORT% " >nul 2>&1
if not errorlevel 1 (
    echo.
    echo  El puerto %PORT% ya está en uso.
    echo  Si el aplicativo ya está corriendo, abra su navegador en:
    echo  http://localhost:%PORT%/generador_codigos_inventario.html
    echo.
    echo  Si no está corriendo, cierre la otra aplicación que usa ese puerto
    echo  y vuelva a ejecutar este archivo.
    pause
    exit /b 1
)

echo.
echo  Generador de Códigos de Inventario
echo  ─────────────────────────────────────────────────────────
echo  Servidor iniciado en: http://localhost:%PORT%
echo  Abriendo el navegador...
echo.
echo  IMPORTANTE: No cierre esta ventana mientras usa el aplicativo.
echo  Para cerrar el servidor, cierre esta ventana.
echo  ─────────────────────────────────────────────────────────
echo.

:: Abrir el navegador con un pequeño delay
start "" timeout /t 2 /nobreak >nul
start "" "http://localhost:%PORT%/generador_codigos_inventario.html?v=1.4.1"

:: Iniciar el servidor en puerto fijo
python -m http.server %PORT%

pause
