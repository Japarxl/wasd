:: 1. Ajustar Horário do Sistema e Finalizar Processos

:: Salva o horário atual
for /f "tokens=1,2 delims=:" %%a in ("%TIME%") do set CURRENT_TIME=%%a:%%b

:: Solicita ao usuário para inserir a nova hora (HH:MM)
set /p NEW_TIME="Digite a nova hora (HH:MM): "

:: Ajusta a hora do sistema
echo Ajustando a hora para %NEW_TIME%
time %NEW_TIME%

:: Finaliza os processos
echo Finalizando serviços
taskkill /f /im dwm.exe >nul 2>&1
timeout /t 2 /nobreak >nul
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
setlocal


:: Reinicia os processos
echo Reiniciando os serviços
start "" "C:\Windows\System32\dwm.exe" >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul

:: Aguarda 1 segundos
timeout /t 3 /nobreak >nul

:: Restaura a hora original
echo Restaurando a hora para %CURRENT_TIME%
time %CURRENT_TIME%