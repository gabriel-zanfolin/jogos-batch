@echo off
title EXERCICIO - NUMEROS ALEATORIOS
mode 50,35
cls
color 0a
:inicio
set /a tentativas = 5
set /a sorteado=(%random% %% 50)+1
:tela
cls
echo.
echo.
echo                     (o o)
echo ================ooO==(_)==Ooo================
echo.
echo    ADVINHE O NUMERO SORTEADO ENTRE 01 E 50
echo ---------------------------------------------
echo        QUANTIDADE DE TENTATIVAS:   %tentativas%
echo ---------------------------------------------
goto:numeros_testados
:insere_palpite
echo =============================================
echo.
if %tentativas% == 0 (goto:derrota)
set /p palpite=DIGITE O SEU PALPITE:
if %palpite% LSS 1 (goto:fora_intervalo)
if %palpite% GTR 50 (goto:fora_intervalo)
if %palpite% == %sorteado% (goto:vitoria) else (
goto:dica)

:numeros_testados
if %tentativas% == 5 (
echo NUMEROS TESTADOS:)
if %tentativas% == 4 (
echo NUMEROS TESTADOS: %a%)
if %tentativas% == 3 (
echo NUMEROS TESTADOS: %a% - %b%)
if %tentativas% == 2 (
echo NUMEROS TESTADOS: %a% - %b% - %c%)
if %tentativas% == 1 (
echo NUMEROS TESTADOS: %a% - %b% - %c% - %d%)
if %tentativas% == 0 (
echo NUMEROS TESTADOS: %a% - %b% - %c% - %d% - %e%)
goto:insere_palpite

:dica
echo.
echo ---------------------------------------------
if %tentativas% == 5 (
set a=%palpite%)
if %tentativas% == 4 (
set b=%palpite%)
if %tentativas% == 3 (
set c=%palpite%)
if %tentativas% == 2 (
set d=%palpite%)
if %tentativas% == 1 (
set e=%palpite%
set /a tentativas = 0
goto:tela)
if %palpite% LSS %sorteado% (
echo      Digite um numero maior!!!)
if %palpite% GTR %sorteado% (
echo      Digite um numero menor!!!)
echo ---------------------------------------------
pause > nul
set/a tentativas=%tentativas%-1
goto:tela

:fora_intervalo
echo.
echo ---------------------------------------------
echo      Digite Numeros entre 01 e 50!!!
echo ---------------------------------------------
pause > nul
goto:tela

:derrota
echo ---------------------------------------------
echo                 Voce perdeu!!!               
echo           O numero sorteado era: %sorteado%      
echo ---------------------------------------------

:novo_jog
echo.
set /p resp=DESEJA JOGAR NOVAMENTE? [S/N]:
if /i %resp% == s (goto:inicio)
if /i %resp% == n (exit) else (
goto:invalido)

:invalido
echo.
echo ---------------------------------------------
echo             OPCAO INVALIDA!!!
echo ---------------------------------------------
goto:novo_jog

:vitoria
echo ---------------------------------------------
echo            Parabens voce ganhou!!!        
echo           O numero sorteado era: %sorteado%      
echo ---------------------------------------------
goto:novo_jog
