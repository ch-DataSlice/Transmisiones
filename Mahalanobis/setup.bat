@echo off

:: Nombre del entorno virtual
set VENV_DIR=venv

:: Verificar si Python está en el PATH
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python no está instalado o no está en el PATH. Por favor, instálalo primero.
    exit /b
)

:: Crear el entorno virtual si no existe
if not exist %VENV_DIR% (
    echo Creando el entorno virtual...
    python -m venv %VENV_DIR%
) else (
    echo El entorno virtual ya existe.
)

:: Activar el entorno virtual
echo Activando el entorno virtual...
call %VENV_DIR%\Scripts\activate

:: Verificar si requirements.txt existe
if not exist "requirements.txt" (
    echo El archivo requirements.txt no existe en el directorio actual.
    exit /b
)

:: Instalar las dependencias desde requirements.txt
echo Instalando dependencias desde requirements.txt...
pip install --upgrade pip
pip install -r requirements.txt

echo Configuración completada. El entorno virtual está activo.
