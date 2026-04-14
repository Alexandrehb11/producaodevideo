@echo off
echo ============================================
echo   MoneyPrinterTurbo - Instalacao e Inicio
echo ============================================
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Python nao encontrado!
    echo Instale o Python em: https://www.python.org/downloads/
    echo Marque a opcao "Add Python to PATH" durante a instalacao.
    pause
    exit /b 1
)

echo Python encontrado. Instalando pacotes...
echo.

python -m pip install moviepy==2.1.2 streamlit==1.45.0 edge_tts==7.2.7 fastapi==0.115.6 uvicorn==0.32.1 openai==1.56.1 loguru==0.7.3 pyyaml==6.0.3 requests==2.33.1 pydub==0.25.1 python-multipart==0.0.19 redis==5.2.0 g4f==0.5.2.2 socksio==1.0.0 faster-whisper==1.1.0 -q

echo.
echo Pacotes instalados! Iniciando servidor...
echo.

set PYTHONPATH=%CD%
start /B python main.py > backend.log 2>&1
timeout /t 4 /nobreak >nul

echo ============================================
echo   Acesse: http://localhost:8501
echo ============================================
echo.

streamlit run .\webui\Main.py --browser.gatherUsageStats=False --server.enableCORS=True

pause
