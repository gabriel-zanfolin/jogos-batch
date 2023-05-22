@echo off
title JO-KEN-PO
mode 80,35
cls
color 0a
set /a vitorias = 0
set /a derrotas = 0
set /a empates = 0
set jog_player = nula
set jog_maq = nula
set /p user= Digite o seu nome:
:inicio
cls
echo ---------------------------
echo.
echo            (o o)
echo =======ooO==(_)==Ooo=======
echo ---------------------------
echo   Bem-Vindo ao JO-KEN-PO
echo ---------------------------
echo.
echo [1] PEDRA
echo [2] PAPEL
echo [3] TESOURA
echo [4] LAGARTO
echo [5] SPOCK
echo [E] ENCERRAR JOGO
echo [R] REGRAS
echo ===========================
echo.
set /p op=Escolha uma opcao:
if %op% == 1 (goto:jog_pedra)
if %op% == 2 (goto:jog_papel)
if %op% == 3 (goto:jog_tesoura)
if %op% == 4 (goto:jog_lagarto)
if %op% == 5 (goto:jog_spock)
if /i %op% == e (exit)
if /i %op% == r (goto:regras) else (
goto:invalido)

:sorteia
echo.
echo %user% escolheu: %jog_player%
set /a cpu=(%random% %% 5) + 1
if %cpu% == 1 (set jog_maq=PEDRA)
if %cpu% == 2 (set jog_maq=PAPEL)
if %cpu% == 3 (set jog_maq=TESOURA)
if %cpu% == 4 (set jog_maq=LAGARTO)
if %cpu% == 5 (set jog_maq=SPOCK)
echo Computador escolheu: %jog_maq%
goto:validacao

:placar
echo.
echo ======PLACAR=DO=JOGO======
echo VITORIAS: %vitorias%
echo DERROTAS: %derrotas%
echo EMPATES: %empates%
echo ===========================
echo.
set /p resp=Deseja jogar novamente?[S/N]: 
if /I %resp% == s (goto:inicio)
if /I %resp% == n (exit) else (
goto:invalido)

:regras
echo.
echo Pedra:
echo    Empata com Pedra; Ganha de Tesoura e Lagarto; Perde de Papel e Spock;
echo.
echo Papel:
echo    Empata com Papel; Ganha de Pedra e Spock; Perde de Tesoura e Lagarto;
echo.
echo Tesoura:
echo    Empata com Tesoura; Ganha de Lagarto e Papel; Perde de Pedra e Spock;
echo.
echo Lagarto:
echo    Empata com Lagarto; Ganha de Papel e Spock; Perde de Pedra e Tesoura;
echo.
echo Spock:
echo    Empata com Spock; Ganha de Pedra e Tesoura; Perde de Lagarto e Papel;
echo.
echo Pressione qualquer tecla para continuar...
pause > nul
goto:inicio

:invalido
echo.
echo ===========================
echo     OPCAO INVALIDA!!!
echo ===========================
pause > nul
goto:inicio

:validacao
if %jog_maq%==%ganha1% (goto:ganhou)
if %jog_maq%==%ganha2% (goto:ganhou)
if %jog_maq%==%perde1% (goto:perdeu)
if %jog_maq%==%perde2% (goto:perdeu)
if %jog_maq%==%jog_player% (goto:empatou) else (
goto:invalido)

:ganhou
set /a vitorias=%vitorias%+1
echo.
echo PARABENS... VOCE VENCEU!!!
goto:placar

:perdeu
set /a derrotas=%derrotas%+1
echo.
echo QUE PENA... VOCE PERDEU!!!
goto:placar

:empatou
set /a empates=%empates%+1
echo.
echo OPS... DEU EMPATE!!!
goto:placar

:jog_pedra
set jog_player=PEDRA
set ganha1=TESOURA
set ganha2=LAGARTO
set perde1=PAPEL
set perde2=SPOCK
goto:sorteia

:jog_papel
set jog_player=PAPEL
set ganha1=PEDRA
set ganha2=SPOCK
set perde1=TESOURA
set perde2=LAGARTO
goto:sorteia

:jog_tesoura
set jog_player=TESOURA
set ganha1=PAPEL
set ganha2=LAGARTO
set perde1=PEDRA
set perde2=SPOCK
goto:sorteia

:jog_lagarto
set jog_player=LAGARTO
set ganha1=PAPEL
set ganha2=SPOCK
set perde1=PEDRA
set perde2=TESOURA
goto:sorteia

:jog_spock
set jog_player=SPOCK
set ganha1=PEDRA
set ganha2=TESOURA
set perde1=PAPEL
set perde2=LAGARTO
goto:sorteia
