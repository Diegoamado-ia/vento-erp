@echo off
title Actualizar Proyecto en GitHub y Vercel
color 0A

echo ===================================================
echo     ACTUALIZANDO INDEX.HTML EN GITHUB Y VERCEL
echo ===================================================
echo.

:: 1. Solicitar el mensaje de commit
set /p commit_msg="Ingresa una descripcion para los cambios (o presiona Enter para usar 'Actualizacion de index.html'): "

:: Si no se ingresa nada, asigna un mensaje por defecto
if "%commit_msg%"=="" set commit_msg=Actualizacion de index.html

echo.
echo [1/3] Añadiendo cambios a Git...
git add .

echo.
echo [2/3] Creando commit: "%commit_msg%"...
git commit -m "%commit_msg%"

echo.
echo [3/3] Subiendo cambios a GitHub (origin main)...
git push origin main

echo.
if %ERRORLEVEL% EQU 0 (
    echo ===================================================
    echo  !EXITO! Los cambios se subieron correctamente.
    echo  Vercel actualizara tu sitio en unos segundos.
    echo ===================================================
) else (
    echo ===================================================
    echo  [ERROR] Hubo un problema al hacer push.
    echo  Verifica tu conexion o si hay conflictos en Git.
    echo ===================================================
)

echo.
pause