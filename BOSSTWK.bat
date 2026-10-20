@echo off
setlocal EnableExtensions
title BOSSTWK - Maximizando tus FPS y bajando el INPUT
color 0B

REM ==================================================================
REM  BOSSTWK  -  Maximizando tus FPS y bajando el INPUT
REM  Un solo archivo con los 10 modulos de BOSS.
REM  Doble clic = menu (si no tocas nada, en 12 segundos aplica TODO).
REM  Se auto-eleva a administrador. Todo se puede comprobar y restaurar.
REM  Uso por consola:  BOSSTWK.bat  modo  modulo   (modo: apply, check, restore, play o fps)
REM  Modulos: 1 power  2 km  3 sys  4 net  5 aff  6 audio  7 adv  8 smooth  9 fluid  10 extra
REM ==================================================================

REM ------------------ CONFIGURACION (1 = si, 0 = no) ----------------
REM ---- MODULO 1 - PLAN DE ENERGIA ----
REM IDLE_DISABLE      : 1 = desactiva C-states por powercfg (latencia minima,
REM                     pero mas calor y consumo en reposo; en X3D puede
REM                     bajar un poco el boost por temperatura)
REM DISPLAY_OFF_MIN   : minutos hasta apagar pantalla (0 = nunca)
REM DISABLE_HIBERNATE : 1 = quita hibernacion e inicio rapido (arranque limpio)
REM APPLY_EXTRAS      : 1 = tweaks extra de registro, USB, red y timers
set "IDLE_DISABLE=0"
set "DISPLAY_OFF_MIN=0"
set "DISABLE_HIBERNATE=1"
set "APPLY_EXTRAS=1"

REM ---- MODULO 2 - TECLADO Y RATON ----
REM KB_REPEAT_FAST       1 = retardo minimo de repeticion (puede sentirse raro al escribir), 0 = no tocar
REM DISABLE_LANG_HOTKEYS 1 = quita Alt+Shift y Ctrl+Shift del cambio de idioma
REM USB_IRQ_PRIORITY     1 = prioridad de interrupcion alta en controladores USB
REM WIN_KEY              0 = no tocar, 1 = desactivar tecla Windows, 2 = restaurarla
REM FORTNITE_INI         1 = editar GameUserSettings.ini de Fortnite
REM MAKE_BACKUP          1 = copia de seguridad en ProgramData\BOSS
set "KB_REPEAT_FAST=0"
set "DISABLE_LANG_HOTKEYS=1"
set "USB_IRQ_PRIORITY=1"
set "WIN_KEY=0"
set "FORTNITE_INI=1"
set "MAKE_BACKUP=1"

REM ---- MODULO 3 - SISTEMA Y FORTNITE ----
REM RESTORE_POINT       crea un punto de restauracion de Windows antes de empezar
REM TELEMETRY           telemetria, tareas de recopilacion, publicidad y sugerencias
REM ACCESSIBILITY       narrador y atajos de accesibilidad que roban el foco
REM SERVICES            servicios innecesarios, solo los seguros
REM PERF_TWEAKS         ajustes de Windows para FPS y latencia
REM GPU_TWEAKS          detecta tu grafica y aplica lo seguro (NVIDIA, AMD, Intel)
REM DISPLAY_HZ          pone la pantalla principal a su frecuencia maxima
REM FORTNITE            GameUserSettings.ini y GPU de alto rendimiento para Fortnite
REM FORTNITE_FULLSCREEN pone Fortnite en Pantalla completa real (menor latencia)
REM DISABLE_VBS         0 = solo informa. 1 = quita VBS y la integridad de memoria
REM                     (mas FPS pero menos proteccion; necesita reiniciar)
set "RESTORE_POINT=1"
set "TELEMETRY=1"
set "ACCESSIBILITY=1"
set "SERVICES=1"
set "PERF_TWEAKS=1"
set "GPU_TWEAKS=1"
set "DISPLAY_HZ=1"
set "FORTNITE=1"
set "FORTNITE_FULLSCREEN=1"
set "DISABLE_VBS=0"

REM ---- MODULO 4 - RED Y BUFFERBLOAT ----
REM LOAD_TEST     mide el bufferbloat bajando y subiendo datos a Cloudflare.
REM               Gasta datos: hasta cerca de 1 GB en fibra gigabit.
REM REGION_TEST   hace ping a los 8 servidores de region de Epic.
REM FORTNITE_QOS  marca el trafico UDP de Fortnite con DSCP 46.
REM NIC_TWEAKS    ajustes de latencia en el adaptador Ethernet principal.
REM DELIVERY_OPT  evita que Windows suba actualizaciones a otros PCs.
set "LOAD_TEST=1"
set "REGION_TEST=1"
set "FORTNITE_QOS=1"
set "NIC_TWEAKS=1"
set "DELIVERY_OPT=1"

REM ---- MODULO 5 - AFINIDAD Y TIMER ----
REM AFFINITY           afinidad de interrupciones de GPU, USB de entrada y audio
REM RSS_NIC            fija las colas RSS de tu tarjeta de red a un nucleo concreto
REM FORCE_MSI          activa MSI solo en GPU, USB, red y audio que sigan en modo legacy
REM TIMER_RES          calibra y mantiene la resolucion del timer (con medicion real)
REM PAGING_EXEC        mantiene el kernel y los drivers en RAM (solo con 16 GB o mas)
REM DISABLE_UNUSED_WIFI  1 = desactiva el Wi-Fi si vas por cable (menos interrupciones)
REM CHECK_SECONDS      segundos de muestreo en el modo comprobar
set "AFFINITY=1"
set "RSS_NIC=1"
set "FORCE_MSI=1"
set "TIMER_RES=1"
set "PAGING_EXEC=1"
set "DISABLE_UNUSED_WIFI=0"
set "CHECK_SECONDS=15"

REM ---- MODULO 6 - AUDIO ----
REM DUCKING               Windows no baja el volumen del juego durante el chat de voz
REM MMCSS_AUDIO           prioridad alta para las tareas multimedia de audio
REM AUDIO_POWER           el audio nunca se duerme (menos retardo al primer sonido)
REM FORTNITE_ENGINE_AUDIO buffer de audio mas pequeno en Engine.ini de Fortnite
REM                       (Epic no lo soporta oficialmente y Fortnite puede ignorarlo)
REM AUDIO_FRAMES          tamano del buffer en frames a 48 kHz (512 = 10,7 ms)
REM DISABLE_AUDIO_DSP     1 = desactiva servicios de efectos como Nahimic o Sonic Studio
set "DUCKING=1"
set "MMCSS_AUDIO=1"
set "AUDIO_POWER=1"
set "FORTNITE_ENGINE_AUDIO=1"
set "AUDIO_FRAMES=512"
set "DISABLE_AUDIO_DSP=0"

REM ---- MODULO 7 - AVANZADO Y MODO JUGAR ----
REM HICCUP_TEST           1 = mide microcortes (ISR, DPC, SMI) en cada nucleo, unos 25 s
REM HICCUP_MS             milisegundos de medida por nucleo
REM MOUSE_TEST            1 = mide el polling real del raton (mueve el raton unos 14 s)
REM BCD_FIX               1 = quita el reloj HPET forzado y fija el tick constante
REM FORTNITE_REPLAYS_OFF  1 = apaga la grabacion de repeticiones (menos disco y CPU)
REM CLEAN_SHADER_CACHE    1 = borra la cache de shaders de NVIDIA y DirectX (se regenera)
REM PLAY_TASK             1 = crea una tarea para lanzar el modo JUGAR sin aviso de UAC
REM PLAY_SUSPEND          procesos que se pausan mientras juegas (se reanudan despues)
REM PLAY_SERVICES         servicios que se paran mientras juegas (se reinician despues)
REM PLAY_INTERVAL         segundos entre muestras durante la partida
REM PLAY_GPU              1 = tambien mide la GPU durante la partida (nvidia-smi)
set "HICCUP_TEST=1"
set "HICCUP_MS=1500"
set "MOUSE_TEST=1"
set "BCD_FIX=1"
set "FORTNITE_REPLAYS_OFF=0"
set "CLEAN_SHADER_CACHE=0"
set "PLAY_TASK=1"
set "PLAY_SUSPEND=OneDrive,Teams,ms-teams,PhoneExperienceHost,YourPhone,wallpaper32,wallpaper64,Dropbox,GoogleDriveFS,Widgets,WidgetService"
set "PLAY_SERVICES=wuauserv,UsoSvc,BITS,DoSvc"
set "PLAY_INTERVAL=10"
set "PLAY_GPU=0"

REM ---- MODULO 8 - SMOOTH Y AUDITORIA ----
REM MEMORY_AGENT   1 = sin compresion de memoria ni combinado de paginas (solo 32 GB o mas)
REM FRAME_CAP      0 = no tocar el limite de FPS de Fortnite
REM                1 = automatico: Hz menos 3 solo si se detecta pantalla VRR (G-SYNC o FreeSync)
REM                2 = siempre Hz menos 3
REM NET_TEST       1 = mide ping, jitter y perdida hacia tu mejor region de Epic
REM IDLE_REPORT    1 = lista los procesos que consumen CPU o disco en reposo
set "MEMORY_AGENT=1"
set "FRAME_CAP=0"
set "NET_TEST=1"
set "IDLE_REPORT=1"

REM ---- MODULO 9 - FLUIDEZ Y VELOCIDAD ----
REM FLUID_PROFILE         rapido = sin limite de FPS ni vsync (lo mas rapido)
REM                       fluido = limite de FPS en Hz menos 3 (con pantalla VRR)
REM                       keep   = no tocar el limite de FPS
REM KEY_TEST              1 = prueba la repeticion de tecla (abre una ventana, 4 s)
REM FPS_SECONDS           segundos de captura en el modo FPS (de 15 a 180)
REM FPS_GPU               1 = tambien lee la GPU durante la captura de FPS
REM RESTORE_MOUSE_SLIDER  1 = vuelve la velocidad del puntero de Windows a la que tenias
set "FLUID_PROFILE=rapido"
set "KEY_TEST=1"
set "FPS_SECONDS=40"
set "FPS_GPU=1"
set "RESTORE_MOUSE_SLIDER=1"


REM ---- MODULO 10 - EXTRA: SALUD, ESTABILIDAD Y LIMPIEZA ----
REM HEALTH_SCAN        1 = revisa la imagen de Windows y el disco del sistema (solo informa)
REM CPU_TEST           1 = prueba corta de CPU a plena carga (unos 15 s) para ver el boost real
REM CLEAN              1 = borra temporales, volcados de fallos y registros de mas de 7 dias
REM CLEAN_EPIC_CACHE   1 = tambien borra la cache web del launcher de Epic (cierra el launcher)
REM COMPONENT_CLEANUP  1 = limpieza de componentes de Windows (tarda, ahorra disco)
REM DEFENDER_SOFT      1 = el antivirus escanea con poca CPU y solo en reposo (sin bajar la proteccion)
REM NO_AUTO_REBOOT     1 = Windows Update no reinicia el PC con la sesion abierta
REM HAGS               keep, on u off (planificacion de GPU por hardware; prueba y mide)
REM DISABLE_MPO        1 = desactiva MPO (solo si tienes microtirones con varios monitores)
set "HEALTH_SCAN=1"
set "CPU_TEST=1"
set "CLEAN=1"
set "CLEAN_EPIC_CACHE=0"
set "COMPONENT_CLEANUP=0"
set "DEFENDER_SOFT=1"
set "NO_AUTO_REBOOT=1"
set "HAGS=keep"
set "DISABLE_MPO=0"

REM ---------------------------------------------------------------------

set "BOSS_SELF=%~f0"
set "A1=%~1"
set "A2=%~2"
set "A3=%~3"
set "MMODE=%A1%"
set "MMOD=%A2%"
if /i "%A1%"=="elevated" set "MMODE=%A2%"
if /i "%A1%"=="elevated" set "MMOD=%A3%"

REM ---------------- Auto-elevacion a administrador ---------------------
fltmc >nul 2>&1
if %errorlevel% equ 0 goto :ADMIN_OK
if /i "%A1%"=="elevated" goto :NO_ADMIN
powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -ArgumentList 'elevated %~1 %~2' -Verb RunAs" >nul 2>&1
exit /b
:NO_ADMIN
echo.
echo  No se pudo obtener permisos de administrador.
echo  Haz clic derecho sobre el archivo y elige Ejecutar como administrador.
echo.
pause
exit /b 1
:ADMIN_OK

if "%MMODE%"=="" goto :MENU
goto :DISPATCH

REM ==================================================================
REM  MENU
REM ==================================================================
:MENU
set "DEFOPT=1"
if exist "%ProgramData%\BOSS\sys_undo.json" set "DEFOPT=6"
call :BANNER
echo.
echo   [1]  APLICAR TODO  (los 10 modulos)
echo   [2]  Elegir modulos para aplicar
echo   [3]  COMPROBAR     (informes y medidas, no cambia nada)
echo   [4]  RESTAURAR TODO a como estaba
echo   [5]  JUGAR a Fortnite (modo sesion con informe)
echo   [6]  ARREGLAR FLUIDEZ: repeticion de tecla, limite de FPS y raton
echo   [7]  MEDIR FPS de Fortnite (fluidez y tirones, sin instalar nada)
echo   [8]  EXTRA: salud, estabilidad, drivers, limpieza y prueba de CPU
echo   [0]  Salir
echo.
echo   Si no tocas nada, en 12 segundos se elige la opcion %DEFOPT%.
echo.
choice /c 123456780 /n /t 12 /d %DEFOPT% /m "  Elige una opcion: "
if errorlevel 9 goto :BYE
if errorlevel 8 goto :M_EXTRA
if errorlevel 7 goto :M_FPS
if errorlevel 6 goto :M_FLUID
if errorlevel 5 goto :M_PLAY
if errorlevel 4 goto :M_RESTORE
if errorlevel 3 goto :M_CHECK
if errorlevel 2 goto :M_PICK
goto :M_ALL

:M_ALL
set "MMODE=apply"
set "MMOD=all"
goto :DISPATCH

:M_CHECK
set "MMODE=check"
set "MMOD=all"
goto :DISPATCH

:M_RESTORE
set "MMODE=restore"
set "MMOD=all"
goto :DISPATCH

:M_PLAY
set "MMODE=play"
set "MMOD=adv"
goto :DISPATCH

:M_FLUID
set "MMODE=apply"
set "MMOD=fluid"
goto :DISPATCH

:M_FPS
set "MMODE=fps"
set "MMOD=fluid"
goto :DISPATCH

:M_EXTRA
set "MMODE=apply"
set "MMOD=extra"
goto :DISPATCH

:M_PICK
echo.
echo   1 Plan de energia            6 Audio
echo   2 Teclado y raton            7 Avanzado (microcortes, polling, modo JUGAR)
echo   3 Sistema y Fortnite         8 Smooth (Hz, auditoria, RAM, red a Epic)
echo   4 Red y bufferbloat          9 Fluidez y velocidad (tecla, limite de FPS)
echo   5 Afinidad, RSS y timer      10 Extra (salud, estabilidad, limpieza, drivers)
echo.
set "SEL="
set /p "SEL=  Escribe los numeros separados por espacios (por ejemplo 1 3 5): "
set "MMODE=apply"
set "MMOD=%SEL%"
goto :DISPATCH

REM ==================================================================
REM  DESPACHO
REM ==================================================================
:DISPATCH
if /i "%MMODE%"=="apply" goto :DO_APPLY
if /i "%MMODE%"=="check" goto :DO_CHECK
if /i "%MMODE%"=="restore" goto :DO_RESTORE
if /i "%MMODE%"=="play" goto :DO_PLAY
if /i "%MMODE%"=="fps" goto :DO_FPS
if /i "%MMODE%"=="fluid" goto :M_FLUID
if /i "%MMODE%"=="extra" goto :M_EXTRA
echo.
echo  Modo desconocido: %MMODE%
goto :BYE_PAUSE

:DO_APPLY
if "%MMOD%"=="" set "MMOD=all"
call :BANNER
echo.
echo  APLICANDO. Puede tardar varios minutos: hay pruebas de red, microcortes y raton.
echo  Cuando salga el aviso del modulo 7, mueve el raton en circulos rapidos.
echo.
call :PREP_APPLY
if /i "%MMOD%"=="all" goto :APPLY_ALL
for %%m in (%MMOD%) do call :RUN_APPLY %%m
goto :APPLY_DONE
:APPLY_ALL
for %%m in (1 2 3 4 5 6 7 8 9 10) do call :RUN_APPLY %%m
:APPLY_DONE
call :RUNPS LAUNCH apply
echo.
echo ==================================================================
echo   BOSSTWK TERMINADO
echo   REINICIA el PC para que todo surta efecto.
echo   Despues usa BOSSTWK_MENU.bat del Escritorio y elige COMPROBAR.
echo   Para jugar a Fortnite usa BOSSTWK_JUGAR.bat del Escritorio.
echo   Para medir FPS y tirones usa BOSSTWK_FPS.bat con Fortnite en una partida.
echo ==================================================================
goto :BYE_PAUSE

:DO_CHECK
if "%MMOD%"=="" set "MMOD=all"
call :BANNER
echo.
echo  COMPROBANDO: informes y medidas, no se cambia nada.
echo.
if /i "%MMOD%"=="all" goto :CHECK_ALL
for %%m in (%MMOD%) do call :RUN_CHECK %%m
goto :BYE_PAUSE
:CHECK_ALL
for %%m in (1 2 3 4 5 6 7 8 9 10) do call :RUN_CHECK %%m
goto :BYE_PAUSE

:DO_RESTORE
if "%MMOD%"=="" set "MMOD=all"
call :BANNER
echo.
echo  RESTAURANDO los valores originales de cada modulo.
echo.
if /i "%MMOD%"=="all" goto :RESTORE_ALL
for %%m in (%MMOD%) do call :RUN_RESTORE %%m
goto :RESTORE_DONE
:RESTORE_ALL
for %%m in (10 9 8 7 6 5 4 3 2 1) do call :RUN_RESTORE %%m
:RESTORE_DONE
echo.
echo ==================================================================
echo   RESTAURACION TERMINADA. Reinicia el PC para completarla.
echo ==================================================================
goto :BYE_PAUSE

:DO_PLAY
echo.
echo  BOSSTWK - Modo JUGAR a Fortnite
call :RUNPS ADV play
goto :BYE_PAUSE

:DO_FPS
echo.
echo  BOSSTWK - Medicion de FPS de Fortnite
call :RUNPS FLUID fps
goto :BYE_PAUSE

:BYE_PAUSE
echo.
pause
:BYE
exit /b 0

REM ==================================================================
REM  SUBRUTINAS
REM ==================================================================
:BANNER
cls
call :RUNPS BANNER none
exit /b 0

:PREP_APPLY
if "%RESTORE_POINT%"=="1" call :RUNPS RP apply
set "RESTORE_POINT=0"
exit /b 0

REM  parametros: nombre del modulo y modo
:RUNPS
set "BOSS_MODE=%~2"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$f=[IO.File]::ReadAllText('%BOSS_SELF%'); $a='#PS_'+'MODULE:%~1:'; $i=$f.IndexOf($a,[StringComparison]::Ordinal); if($i -lt 0){Write-Host 'Modulo no encontrado'; exit 2}; $j=$f.IndexOf('#PS_'+'MODULE:',$i+12,[StringComparison]::Ordinal); if($j -lt 0){$j=$f.Length}; Invoke-Expression $f.Substring($i,$j-$i)"
exit /b 0

:RUN_APPLY
set "M=%~1"
if /i "%M%"=="1" goto :RA1
if /i "%M%"=="power" goto :RA1
if /i "%M%"=="2" goto :RA2
if /i "%M%"=="km" goto :RA2
if /i "%M%"=="3" goto :RA3
if /i "%M%"=="sys" goto :RA3
if /i "%M%"=="4" goto :RA4
if /i "%M%"=="net" goto :RA4
if /i "%M%"=="5" goto :RA5
if /i "%M%"=="aff" goto :RA5
if /i "%M%"=="6" goto :RA6
if /i "%M%"=="audio" goto :RA6
if /i "%M%"=="7" goto :RA7
if /i "%M%"=="adv" goto :RA7
if /i "%M%"=="8" goto :RA8
if /i "%M%"=="smooth" goto :RA8
if /i "%M%"=="9" goto :RA9
if /i "%M%"=="fluid" goto :RA9
if /i "%M%"=="10" goto :RA10
if /i "%M%"=="extra" goto :RA10
echo  Modulo desconocido: %M%
exit /b 0
:RA1
echo.
echo ===================== [1/10] PLAN DE ENERGIA =====================
call :MOD_POWER
exit /b 0
:RA2
echo.
echo ===================== [2/10] TECLADO Y RATON =====================
call :RUNPS KM apply
exit /b 0
:RA3
echo.
echo ================== [3/10] SISTEMA Y FORTNITE =====================
call :RUNPS SYS apply
exit /b 0
:RA4
echo.
echo ================== [4/10] RED Y BUFFERBLOAT ======================
call :RUNPS NET apply
exit /b 0
:RA5
echo.
echo =================== [5/10] AFINIDAD Y TIMER ======================
call :RUNPS AFF apply
exit /b 0
:RA6
echo.
echo ========================= [6/10] AUDIO ===========================
call :RUNPS AUDIO apply
exit /b 0
:RA7
echo.
echo ============= [7/10] AVANZADO Y MODO JUGAR =======================
call :RUNPS ADV apply
exit /b 0
:RA8
echo.
echo =================== [8/10] SMOOTH Y AUDITORIA ====================
call :RUNPS SMOOTH apply
exit /b 0
:RA9
echo.
echo ============== [9/10] FLUIDEZ Y VELOCIDAD ========================
if /i "%MMOD%"=="all" set "KEY_TEST=0"
call :RUNPS FLUID apply
exit /b 0
:RA10
echo.
echo =============== [10/10] EXTRA: SALUD Y LIMPIEZA ================
call :RUNPS EXTRA apply
exit /b 0

:RUN_CHECK
set "M=%~1"
if /i "%M%"=="1" goto :RK1
if /i "%M%"=="power" goto :RK1
if /i "%M%"=="2" goto :RKN
if /i "%M%"=="km" goto :RKN
if /i "%M%"=="3" goto :RKN
if /i "%M%"=="sys" goto :RKN
if /i "%M%"=="4" goto :RKN
if /i "%M%"=="net" goto :RKN
if /i "%M%"=="5" goto :RK5
if /i "%M%"=="aff" goto :RK5
if /i "%M%"=="6" goto :RK6
if /i "%M%"=="audio" goto :RK6
if /i "%M%"=="7" goto :RK7
if /i "%M%"=="adv" goto :RK7
if /i "%M%"=="8" goto :RK8
if /i "%M%"=="smooth" goto :RK8
if /i "%M%"=="9" goto :RK9
if /i "%M%"=="fluid" goto :RK9
if /i "%M%"=="10" goto :RK10
if /i "%M%"=="extra" goto :RK10
echo  Modulo desconocido: %M%
exit /b 0
:RK1
echo.
echo ================= [1/10] PLAN DE ENERGIA (estado) ================
powercfg -getactivescheme
exit /b 0
:RKN
echo.
echo  Modulo %M%: sin comprobacion propia, lo revisa la auditoria del modulo 8.
exit /b 0
:RK5
echo.
echo ================ [5/10] AFINIDAD Y TIMER (comprobar) =============
call :RUNPS AFF check
exit /b 0
:RK6
echo.
echo ===================== [6/10] AUDIO (comprobar) ===================
call :RUNPS AUDIO check
exit /b 0
:RK7
echo.
echo =============== [7/10] AVANZADO (comprobar) ======================
call :RUNPS ADV check
exit /b 0
:RK8
echo.
echo ================ [8/10] SMOOTH Y AUDITORIA (comprobar) ===========
call :RUNPS SMOOTH check
exit /b 0
:RK9
echo.
echo ============= [9/10] FLUIDEZ Y VELOCIDAD (comprobar) =============
call :RUNPS FLUID check
exit /b 0
:RK10
echo.
echo =========== [10/10] EXTRA: SALUD Y LIMPIEZA (comprobar) =======
call :RUNPS EXTRA check
exit /b 0

:RUN_RESTORE
set "M=%~1"
if /i "%M%"=="1" goto :RR1
if /i "%M%"=="power" goto :RR1
if /i "%M%"=="2" goto :RR2
if /i "%M%"=="km" goto :RR2
if /i "%M%"=="3" goto :RR3
if /i "%M%"=="sys" goto :RR3
if /i "%M%"=="4" goto :RR4
if /i "%M%"=="net" goto :RR4
if /i "%M%"=="5" goto :RR5
if /i "%M%"=="aff" goto :RR5
if /i "%M%"=="6" goto :RR6
if /i "%M%"=="audio" goto :RR6
if /i "%M%"=="7" goto :RR7
if /i "%M%"=="adv" goto :RR7
if /i "%M%"=="8" goto :RR8
if /i "%M%"=="smooth" goto :RR8
if /i "%M%"=="9" goto :RR9
if /i "%M%"=="fluid" goto :RR9
if /i "%M%"=="10" goto :RR10
if /i "%M%"=="extra" goto :RR10
echo  Modulo desconocido: %M%
exit /b 0
:RR1
echo.
echo ================ [1/10] PLAN DE ENERGIA (restaurar) ==============
call :RUNPS PWRESTORE restore
exit /b 0
:RR2
echo.
echo ============== [2/10] TECLADO Y RATON (restaurar) ================
call :RUNPS KMRESTORE restore
exit /b 0
:RR3
echo.
echo ============= [3/10] SISTEMA Y FORTNITE (restaurar) ==============
call :RUNPS SYS restore
exit /b 0
:RR4
echo.
echo ============= [4/10] RED Y BUFFERBLOAT (restaurar) ===============
call :RUNPS NET restore
exit /b 0
:RR5
echo.
echo ============== [5/10] AFINIDAD Y TIMER (restaurar) ===============
call :RUNPS AFF restore
exit /b 0
:RR6
echo.
echo ===================== [6/10] AUDIO (restaurar) ===================
call :RUNPS AUDIO restore
exit /b 0
:RR7
echo.
echo ============ [7/10] AVANZADO Y MODO JUGAR (restaurar) ============
call :RUNPS ADV restore
exit /b 0
:RR8
echo.
echo ============ [8/10] SMOOTH Y AUDITORIA (restaurar) ===============
call :RUNPS SMOOTH restore
exit /b 0
:RR9
echo.
echo ============ [9/10] FLUIDEZ Y VELOCIDAD (restaurar) ==============
call :RUNPS FLUID restore
exit /b 0
:RR10
echo.
echo =========== [10/10] EXTRA: SALUD Y LIMPIEZA (restaurar) =======
call :RUNPS EXTRA restore
exit /b 0

REM ==================================================================
REM  MODULO 1: PLAN DE ENERGIA (batch)
REM ==================================================================
:MOD_POWER
REM ------------------------- Constantes -----------------------------
set "BOSS=b0550000-b055-4055-8055-b05500b05500"
set "ULTIMATE=e9a42b02-d5df-448d-aa00-03f14749eb61"
set "HIGHPERF=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"

set "SUB_PROC=54533251-82be-4824-96c1-47b60b740d00"
set "SUB_DISK=0012ee47-9041-4b5d-9b77-535fba8b1442"
set "SUB_SLEEP=238c9fa8-0aad-41ed-83f4-97be242c8f20"
set "SUB_USB=2a737441-1930-4402-8d77-b2bebba308a3"
set "SUB_PCIE=501a4d13-42af-4429-9fd1-a8218c268e20"
set "SUB_VIDEO=7516b95f-f776-4464-8c53-06167f40cc99"
set "SUB_WIFI=19cbb8fa-5279-450e-9fac-8a3d5fedd0c1"
set "SUB_SLIDE=0d7dbae2-4294-402a-ba8e-26777e8488cd"
set "SUB_GFX=e276e160-7cb0-43c6-b20b-73f5dce39954"
set "SUB_AMDGFX=c763b4ec-0e50-4b6b-9bed-2b92a6ee884e"
set "SUB_MM=9596fb26-992f-4d7e-b6cb-18dff1b5b9f2"
set "SUB_SAVER=de830923-a562-41af-a086-e3a2c6bad2da"

set "OK=0"
set "SKIP=0"
set /a DISP_SEC=%DISPLAY_OFF_MIN%*60

echo ==================================================================
echo   Plan de energia GAMING EXTREMO para Windows 11
echo ==================================================================
echo.

REM ------------------ 1. Crear el plan desde cero -------------------
echo [1/8] Creando plan BOSS ...
powercfg -setactive SCHEME_BALANCED >nul 2>&1
powercfg -delete %BOSS% >nul 2>&1
powercfg -duplicatescheme %ULTIMATE% %BOSS% >nul 2>&1
if %errorlevel% neq 0 powercfg -duplicatescheme %HIGHPERF% %BOSS% >nul 2>&1
if %errorlevel% neq 0 goto :PW_FAIL_CREATE
powercfg -changename %BOSS% "BOSS" "Maximiza FPS y reduce INPUT" >nul 2>&1

REM ------------------ 2. Procesador (CPU) ---------------------------
echo [2/8] CPU: 100 por ciento fijo, boost agresivo, sin parking, EPP al maximo ...
REM Estado minimo y maximo del procesador
call :PW_S %SUB_PROC% 893dee8e-2bef-41e0-89c6-b55d0929964c 100
call :PW_S %SUB_PROC% bc5038f7-23e0-4960-96da-33abaf5935ec 100
call :PW_S %SUB_PROC% 893dee8e-2bef-41e0-89c6-b55d0929964d 100
call :PW_S %SUB_PROC% bc5038f7-23e0-4960-96da-33abaf5935ed 100
REM Sin limite de frecuencia maxima (0 = ilimitado)
call :PW_S %SUB_PROC% 75b0ae3f-bce0-45a7-8c89-c9611c25e100 0
call :PW_S %SUB_PROC% 75b0ae3f-bce0-45a7-8c89-c9611c25e101 0
REM Modo boost agresivo y politica de boost al 100
call :PW_S %SUB_PROC% be337238-0d82-4146-a960-4f3749d470c7 2
call :PW_S %SUB_PROC% be337238-0d82-4146-a960-4f3749d470c8 2
call :PW_S %SUB_PROC% 45bcc044-d885-43e2-8605-ee0ec6e96b59 100
call :PW_S %SUB_PROC% 45bcc044-d885-43e2-8605-ee0ec6e96b5a 100
REM Core parking desactivado (todos los nucleos siempre activos)
call :PW_S %SUB_PROC% 0cc5b647-c1df-4637-891a-dec35c318583 100
call :PW_S %SUB_PROC% 0cc5b647-c1df-4637-891a-dec35c318584 100
call :PW_S %SUB_PROC% ea062031-0e34-4ff1-9b6d-eb1059334028 100
call :PW_S %SUB_PROC% ea062031-0e34-4ff1-9b6d-eb1059334029 100
REM Preferencia energia/rendimiento (EPP) = 0 (maximo rendimiento, CPPC AMD e Intel HWP)
call :PW_S %SUB_PROC% 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 0
call :PW_S %SUB_PROC% 36687f9e-e3a5-4dbf-b1dc-15eb381c6864 0
REM Pistas de sensibilidad a latencia al maximo
call :PW_S %SUB_PROC% 616cdaa5-695e-4545-97ad-97dc2d1bdd88 100
call :PW_S %SUB_PROC% 616cdaa5-695e-4545-97ad-97dc2d1bdd89 100
call :PW_S %SUB_PROC% 619b7505-003b-4e82-b7a6-4dd29c300971 100
call :PW_S %SUB_PROC% 619b7505-003b-4e82-b7a6-4dd29c300972 100
REM Politica de subida de rendimiento = Rocket (salto inmediato)
call :PW_S %SUB_PROC% 465e1f50-b610-473a-ab58-00d1077dc418 2
call :PW_S %SUB_PROC% 465e1f50-b610-473a-ab58-00d1077dc419 2
REM Refrigeracion activa (ventiladores antes de bajar frecuencia)
call :PW_S %SUB_PROC% 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
REM Sin throttle states
call :PW_S %SUB_PROC% 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb 0
REM Idle disable (ver configuracion arriba)
call :PW_S %SUB_PROC% 5d76a2ca-e8c0-402f-a133-2158492d58ad %IDLE_DISABLE%

REM ------------------ 3. Almacenamiento -----------------------------
echo [3/8] Discos: sin suspension, sin ahorro en SATA ni NVMe ...
call :PW_S %SUB_DISK% 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
call :PW_S %SUB_DISK% d639518a-e56d-4345-8af2-b9f32fb26109 0
call :PW_S %SUB_DISK% d3d55efd-c1ff-424e-9dc3-441be7833010 0
call :PW_S %SUB_DISK% fc7372b6-ab2d-43ee-8797-15e9841f2cca 0
call :PW_S %SUB_DISK% dab60367-53fe-4fbc-825e-521d069d2456 0
call :PW_S %SUB_DISK% 0b2d69d7-a2a1-449c-9680-f91c70521c60 0

REM ------------------ 4. USB, PCIe y red ----------------------------
echo [4/8] USB, PCIe y Wi-Fi: sin ahorro de energia ...
call :PW_S %SUB_USB% 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
call :PW_S %SUB_USB% 0853a681-27c8-4100-a2fd-82013e970683 0
call :PW_S %SUB_USB% d4e98f31-5ffe-4ce1-be31-1b38b384c009 0
call :PW_S %SUB_PCIE% ee12f906-d277-404b-b6da-e5fa1a576df5 0
call :PW_S %SUB_WIFI% 12bbebe6-58d6-4636-95bb-3217ef867c1a 0

REM ------------------ 5. Suspension, hibernacion y pantalla ---------
echo [5/8] Suspension y pantalla ...
call :PW_S %SUB_SLEEP% 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
call :PW_S %SUB_SLEEP% 9d7815a6-7ee4-497e-8888-515a05f02364 0
call :PW_S %SUB_SLEEP% 7bc4a2f9-d8fc-4469-b07b-33eb785aaca0 0
call :PW_S %SUB_SLEEP% 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
call :PW_S %SUB_SLEEP% bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
call :PW_S %SUB_VIDEO% 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e %DISP_SEC%
call :PW_S %SUB_VIDEO% 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
call :PW_S %SUB_VIDEO% aded5e82-b909-4619-9949-f5d71dac0bcb 100
call :PW_S %SUB_VIDEO% f1fbfde2-a960-4165-9f88-50667911ce96 100
call :PW_S %SUB_VIDEO% fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0

REM ------------------ 6. Graficos, multimedia y ahorro --------------
echo [6/8] Graficos, multimedia y ahorro de energia ...
call :PW_S %SUB_GFX% a1662ab2-9d34-4e53-ba8b-2639b9e20857 3
call :PW_S %SUB_AMDGFX% 7ec1751b-60ed-4588-afb5-9819d3d77d90 3
call :PW_S %SUB_SLIDE% 309dce9b-bef4-4119-9921-a851fb12f0f4 1
call :PW_S %SUB_MM% 03680956-93bc-4294-bba6-4e0f09bb717f 1
call :PW_S %SUB_MM% 10778347-1370-4ee0-8bbd-33bdacaade49 1
call :PW_S %SUB_MM% 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
call :PW_S %SUB_SAVER% 5c5bb349-ad29-4ee2-9d0b-2b25270f7a81 0

REM ------------------ 7. Hibernacion e inicio rapido ----------------
echo [7/8] Hibernacion e inicio rapido ...
if "%DISABLE_HIBERNATE%"=="1" powercfg -h off >nul 2>&1

REM ------------------ 8. Extras ------------------------------------
echo [8/8] Extras de sistema ...
if "%APPLY_EXTRAS%"=="1" call :PW_EXTRAS

REM ------------------ Activar el plan -------------------------------
powercfg -setactive %BOSS% >nul 2>&1
if %errorlevel% neq 0 goto :PW_FAIL_ACTIVATE

echo.
echo ==================================================================
echo   BOSS activado
echo   Ajustes aplicados: %OK%   Omitidos por no existir en tu PC: %SKIP%
echo ==================================================================
powercfg -getactivescheme
echo.
echo  Reinicia el PC para que los cambios de timer y tick surtan efecto.
echo  Para volver atras: Panel de control, Opciones de energia, elige otro plan.
echo  Para borrar el plan:  powercfg -delete %BOSS%
echo.
exit /b 0

REM ==================================================================
:PW_FAIL_CREATE
echo.
echo  ERROR: no se pudo crear el plan de energia.
echo  Comprueba que el servicio de energia de Windows funciona.
echo.
exit /b 1

:PW_FAIL_ACTIVATE
echo.
echo  ERROR: el plan se creo pero no se pudo activar.
echo  Activalo a mano desde Opciones de energia.
echo.
exit /b 1

REM ---------- Subrutina: aplica un ajuste en AC y DC ----------------
REM  parametros: subgrupo, ajuste y valor
:PW_S
powercfg -attributes %~1 %~2 -ATTRIB_HIDE >nul 2>&1
powercfg -setacvalueindex %BOSS% %~1 %~2 %~3 >nul 2>&1
if errorlevel 1 (set /a SKIP+=1) else (set /a OK+=1)
powercfg -setdcvalueindex %BOSS% %~1 %~2 %~3 >nul 2>&1
exit /b 0

REM ---------- Subrutina: tweaks extra --------------------------------
:PW_EXTRAS
REM Sin power throttling en procesos en segundo plano
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f >nul 2>&1
REM Resolucion de timer global (necesita reinicio)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 1 /f >nul 2>&1
REM Tick constante, sin HPET forzado (necesita reinicio)
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
REM USB selective suspend global desactivado
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v DisableSelectiveSuspend /t REG_DWORD /d 1 /f >nul 2>&1
REM Prioridad de juegos en MMCSS y sin limitacion de red
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d High /f >nul 2>&1
REM Game Mode activado y grabacion en segundo plano (Game DVR) desactivada
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
REM Ahorro de energia por dispositivo desactivado (mando, raton, teclado, hubs, red)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-WmiObject -Namespace root\wmi -Class MSPower_DeviceEnable -ErrorAction SilentlyContinue | ForEach-Object { try { $_.Enable = $false; $_.Put() | Out-Null } catch {} }" >nul 2>&1
REM Ethernet eficiente (EEE), Green Ethernet y similares desactivados por palabra clave del driver (sirve en cualquier idioma)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Where-Object { $_.PhysicalMediaType -notmatch '802.11' } | ForEach-Object { $n = $_.Name; $props = @(Get-NetAdapterAdvancedProperty -Name $n -ErrorAction SilentlyContinue); foreach ($kw in '*EEE','EEELinkAdvertisement','EnableGreenEthernet','AdvancedEEE','GigaLite','PowerSavingMode','ULPMode') { $p = $props | Where-Object { $_.RegistryKeyword -eq $kw } | Select-Object -First 1; if ($p -and ($p.RegistryValue[0] -ne '0') -and (($p.ValidRegistryValues.Count -eq 0) -or ($p.ValidRegistryValues -contains '0'))) { try { Set-NetAdapterAdvancedProperty -Name $n -RegistryKeyword $kw -RegistryValue '0' -ErrorAction Stop } catch {} } } }" >nul 2>&1
exit /b 0

exit /b 0

REM ==================================================================
REM  MODULOS POWERSHELL (el batch de arriba nunca llega aqui)
REM ==================================================================
#PS_MODULE:BANNER:
$ErrorActionPreference = 'SilentlyContinue'
$logo = @(
    '######   #####   #####   #####  ####### ##     ## ##   ##',
    '##   ## ##   ## ##   ## ##   ##    ##   ##     ## ##  ##',
    '##   ## ##   ## ##      ##         ##   ##  #  ## ## ##',
    '######  ##   ##  #####   #####     ##   ##  #  ## ####',
    '##   ## ##   ##      ##      ##    ##   ## ### ## ## ##',
    '##   ## ##   ## ##   ## ##   ##    ##   ###   ### ##  ##',
    '######   #####   #####   #####     ##   ##     ## ##   ##'
)
$colors = @('White', 'Cyan', 'Cyan', 'Cyan', 'DarkCyan', 'DarkCyan', 'DarkCyan')
Write-Host ''
Write-Host ('  ' + ('=' * 61)) -ForegroundColor DarkCyan
Write-Host ''
for ($i = 0; $i -lt $logo.Count; $i++) { Write-Host ('   ' + $logo[$i]) -ForegroundColor $colors[$i] }
Write-Host ''
Write-Host ('  ' + ('=' * 61)) -ForegroundColor DarkCyan
Write-Host '   Maximizando tus FPS y bajando el INPUT' -ForegroundColor White
Write-Host ('  ' + ('=' * 61)) -ForegroundColor DarkCyan
Write-Host '   1 Energia  2 Teclado/Raton  3 Sistema  4 Red  5 Afinidad  6 Audio  7 Avanzado  8 Smooth  9 Fluidez  10 Extra' -ForegroundColor Gray
Write-Host ''
#PS_MODULE:RP:
$ErrorActionPreference = 'SilentlyContinue'
Write-Host ''
Write-Host '== Punto de restauracion de Windows (uno solo para todos los modulos)' -ForegroundColor Cyan
try {
    Enable-ComputerRestore -Drive ($env:SystemDrive + '\') -ErrorAction Stop
    $srKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore'
    $oldFreq = (Get-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue).SystemRestorePointCreationFrequency
    Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value 0 -Type DWord -Force
    Checkpoint-Computer -Description 'BOSSTWK (antes de aplicar)' -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
    if ($null -ne $oldFreq) { Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value $oldFreq -Type DWord -Force } else { Remove-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue }
    Write-Host '  [OK] Punto de restauracion creado' -ForegroundColor Green
} catch {
    Write-Host '  [!!] No se pudo crear el punto de restauracion (se sigue: cada modulo guarda lo que cambia para deshacerlo)' -ForegroundColor Yellow
}
#PS_MODULE:LAUNCH:
$ErrorActionPreference = 'SilentlyContinue'
Write-Host ''
Write-Host '== Lanzadores del Escritorio' -ForegroundColor Cyan
try {
    $dataDir = Join-Path $env:ProgramData 'BOSS'
    New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
    $self = $env:BOSS_SELF
    $dst = Join-Path $dataDir 'BOSSTWK.bat'
    if ($self -and ($self -ne $dst)) { Copy-Item -LiteralPath $self -Destination $dst -Force }
    $desk = [Environment]::GetFolderPath('Desktop')
    $crlf = "`r`n"
    $lp = @('@echo off', 'schtasks /run /tn "BOSS_Fortnite_Play" >nul 2>&1', 'if errorlevel 1 call "%ProgramData%\BOSS\BOSSTWK.bat" play adv')
    $lm = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat"')
    $lf = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" fps')
    $asc = New-Object System.Text.ASCIIEncoding
    [IO.File]::WriteAllText((Join-Path $desk 'BOSSTWK_JUGAR.bat'), (($lp -join $crlf) + $crlf), $asc)
    [IO.File]::WriteAllText((Join-Path $desk 'BOSSTWK_MENU.bat'), (($lm -join $crlf) + $crlf), $asc)
    [IO.File]::WriteAllText((Join-Path $desk 'BOSSTWK_FPS.bat'), (($lf -join $crlf) + $crlf), $asc)
    Write-Host '  [OK] En el Escritorio: BOSSTWK_JUGAR.bat (modo Fortnite con informe), BOSSTWK_FPS.bat (mide FPS y tirones) y BOSSTWK_MENU.bat (menu, comprobar y restaurar)' -ForegroundColor Green
} catch {
    Write-Host '  [!!] No se pudieron crear los lanzadores del Escritorio' -ForegroundColor Yellow
}
#PS_MODULE:PWRESTORE:
$ErrorActionPreference = 'SilentlyContinue'
Write-Host ''
Write-Host '== Plan de energia: volver al plan Equilibrado' -ForegroundColor Cyan
$bossGuid = 'b0550000-b055-4055-8055-b05500b05500'
& powercfg.exe -setactive SCHEME_BALANCED
& powercfg.exe -delete $bossGuid
& powercfg.exe -h on
Write-Host '  [OK] Plan BOSS eliminado, plan Equilibrado activo y hibernacion reactivada' -ForegroundColor Green
Write-Host '  (los ajustes sueltos de registro del modulo 1 no se registraron: se quedan como estan)' -ForegroundColor DarkGray
#PS_MODULE:KMRESTORE:
$ErrorActionPreference = 'SilentlyContinue'
function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function ReadIniFile($path) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $bom = (($bytes.Length -ge 2) -and ((($bytes[0] -eq 0xFF) -and ($bytes[1] -eq 0xFE)) -or (($bytes[0] -eq 0xFE) -and ($bytes[1] -eq 0xFF)))) -or (($bytes.Length -ge 3) -and ($bytes[0] -eq 0xEF) -and ($bytes[1] -eq 0xBB) -and ($bytes[2] -eq 0xBF))
    $sr = New-Object System.IO.StreamReader($path, $true)
    $text = $sr.ReadToEnd()
    $enc = $sr.CurrentEncoding
    $sr.Close()
    if (-not $bom) { $enc = New-Object System.Text.UTF8Encoding($false) }
    return [pscustomobject]@{ Text = $text; Enc = $enc }
}
Say ''
Say '== Teclado y raton: restaurar desde la primera copia de seguridad' 'Cyan'
$roots = @((Join-Path $env:ProgramData 'BOSS'), [Environment]::GetFolderPath('Desktop'))
$found = @()
foreach ($r in $roots) { $found += @(Get-ChildItem -LiteralPath $r -Directory -Filter 'BOSS_KM_Backup_*' -ErrorAction SilentlyContinue) }
$first = $found | Sort-Object Name | Select-Object -First 1
if (-not $first) {
    Say '  [!!] No hay copia de seguridad del modulo 2' 'Yellow'
    exit 0
}
$n = 0
foreach ($f in @(Get-ChildItem -LiteralPath $first.FullName -Filter '*.reg')) {
    & reg.exe import $f.FullName *> $null
    if ($LASTEXITCODE -eq 0) { $n++ }
}
Say ('  [OK] Claves de registro restauradas: ' + $n + '  (copia ' + $first.Name + ')') 'Green'
$ini = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'
$bak = $ini + '.boss.bak'
if ((Test-Path -LiteralPath $ini) -and (Test-Path -LiteralPath $bak)) {
    if (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) {
        Say '  [!!] Fortnite esta abierto: cierralo y repite para restaurar sus claves de raton' 'Yellow'
    } else {
        $cur = ReadIniFile $ini
        $old = ReadIniFile $bak
        $text = $cur.Text
        $changed = 0
        foreach ($k in @('bDisableMouseAcceleration', 'bEnableMouseSmoothing', 'bViewAccelerationEnabled')) {
            $rx = '(?mi)^(\s*' + [regex]::Escape($k) + '\s*=\s*)(\S+)'
            $mo = [regex]::Match($old.Text, $rx)
            if ($mo.Success -and [regex]::IsMatch($text, $rx)) {
                $text = [regex]::Replace($text, $rx, ('${1}' + $mo.Groups[2].Value))
                $changed++
            }
        }
        if ($changed -gt 0) {
            $ro = (Get-Item -LiteralPath $ini).IsReadOnly
            if ($ro) { Set-ItemProperty -LiteralPath $ini -Name IsReadOnly -Value $false }
            [IO.File]::WriteAllText($ini, $text, $cur.Enc)
            if ($ro) { Set-ItemProperty -LiteralPath $ini -Name IsReadOnly -Value $true }
            Say ('  [OK] Claves de raton de Fortnite restauradas: ' + $changed) 'Green'
        }
    }
}
Say '  Reinicia el PC para completar la restauracion.' 'Gray'
#PS_MODULE:KM:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

function SetReg($path, $name, $value, $type) {
    try {
        if (-not (Test-Path -LiteralPath $path)) { New-Item -Path $path -Force -ErrorAction Stop | Out-Null }
        New-ItemProperty -LiteralPath $path -Name $name -Value $value -PropertyType $type -Force -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

function Apply($title, $items) {
    $cnt = 0
    foreach ($it in $items) {
        if (SetReg $it[0] $it[1] $it[2] $it[3]) { $cnt++ }
    }
    $txt = $title + ' [' + $cnt + '/' + $items.Count + ']'
    if ($cnt -eq $items.Count) { Ok $txt } else { Warn $txt }
}

$cfgRepeat   = Flag 'KB_REPEAT_FAST' 1
$cfgLang     = Flag 'DISABLE_LANG_HOTKEYS' 1
$cfgUsbIrq   = Flag 'USB_IRQ_PRIORITY' 1
$cfgWinKey   = Flag 'WIN_KEY' 0
$cfgFortnite = Flag 'FORTNITE_INI' 1
$cfgBackup   = Flag 'MAKE_BACKUP' 1

# ------------------------------------------------------------------
Head 'Copia de seguridad'
$bkDir = $null
if ($cfgBackup -eq 1) {
    $bkDir = Join-Path ((Join-Path $env:ProgramData 'BOSS')) ('BOSS_KM_Backup_' + (Get-Date -Format 'yyyyMMdd_HHmmss'))
    New-Item -ItemType Directory -Path $bkDir -Force | Out-Null
    $exports = @(
        @('mouse', 'HKCU\Control Panel\Mouse'),
        @('keyboard', 'HKCU\Control Panel\Keyboard'),
        @('accessibility', 'HKCU\Control Panel\Accessibility'),
        @('layout_toggle', 'HKCU\Keyboard Layout\Toggle'),
        @('gamebar', 'HKCU\Software\Microsoft\GameBar'),
        @('keyboard_layout_hklm', 'HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout')
    )
    foreach ($ex in $exports) {
        & reg.exe export $ex[1] (Join-Path $bkDir ($ex[0] + '.reg')) /y *> $null
    }
    if (Test-Path -LiteralPath $bkDir) { Ok ('Copias .reg guardadas en: ' + $bkDir) } else { Warn 'No se pudo crear la carpeta de copia de seguridad'; $bkDir = $null }
} else {
    Say '  (desactivada)'
}

# ------------------------------------------------------------------
$api = $true
try {
    Add-Type -ErrorAction Stop -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
public static class BossInput {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, int[] pvParam, uint fWinIni);
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, IntPtr pvParam, uint fWinIni);
}
'@
} catch {
    $api = $false
}

# ------------------------------------------------------------------
Head 'Raton: Windows'
$mousePath = 'HKCU:\Control Panel\Mouse'
Apply 'Sin aceleracion (EPP off), velocidad 6/11 = 1:1, sin estela ni snap' @(
    @($mousePath, 'MouseSpeed', '0', 'String'),
    @($mousePath, 'MouseThreshold1', '0', 'String'),
    @($mousePath, 'MouseThreshold2', '0', 'String'),
    @($mousePath, 'MouseSensitivity', '10', 'String'),
    @($mousePath, 'MouseTrails', '0', 'String'),
    @($mousePath, 'SnapToDefaultButton', '0', 'String')
)
if ($api) {
    try {
        $accel = [int[]](0, 0, 0)
        $r1 = [BossInput]::SystemParametersInfo(0x0004, 0, $accel, 3)
        $r2 = [BossInput]::SystemParametersInfo(0x0071, 0, [IntPtr]10, 3)
        if ($r1 -and $r2) { Ok 'Ajustes de raton aplicados en caliente' } else { Warn 'No se aplico en caliente: se aplicara al reiniciar' }
    } catch {
        Warn 'No se aplico en caliente: se aplicara al reiniciar'
    }
}

# ------------------------------------------------------------------
Head 'Teclado: repeticion'
if ($cfgRepeat -eq 1) {
    $kbPath = 'HKCU:\Control Panel\Keyboard'
    Apply 'Retardo minimo y repeticion maxima' @(
        @($kbPath, 'KeyboardDelay', '0', 'String'),
        @($kbPath, 'KeyboardSpeed', '31', 'String')
    )
    if ($api) {
        try {
            $k1 = [BossInput]::SystemParametersInfo(0x000B, 31, [IntPtr]::Zero, 3)
            $k2 = [BossInput]::SystemParametersInfo(0x0017, 0, [IntPtr]::Zero, 3)
            if ($k1 -and $k2) { Ok 'Repeticion de teclado aplicada en caliente' } else { Warn 'No se aplico en caliente: se aplicara al reiniciar' }
        } catch {
            Warn 'No se aplico en caliente: se aplicara al reiniciar'
        }
    }
} else {
    Say '  (desactivado)'
}

# ------------------------------------------------------------------
Head 'Teclado: atajos de accesibilidad que roban el foco en juego'
$accPath = 'HKCU:\Control Panel\Accessibility'
foreach ($ac in @(@('StickyKeys', '510', $true), @('Keyboard Response', '126', $true), @('ToggleKeys', '62', $true), @('MouseKeys', '', $false))) {
    $p = $accPath + '\' + $ac[0]
    $cur = (Get-ItemProperty -LiteralPath $p -Name Flags -ErrorAction SilentlyContinue).Flags
    if (-not $cur) {
        if ($ac[2]) { $cur = $ac[1] } else { continue }
    }
    $newFlags = ([int64]$cur -bor 5) - 5
    if (SetReg $p 'Flags' ([string]$newFlags) 'String') {
        Ok ($ac[0] + ': atajo y activacion desactivados (Flags ' + $cur + ' -> ' + $newFlags + ')')
    } else {
        Warn ($ac[0] + ': no se pudo modificar')
    }
}

# ------------------------------------------------------------------
Head 'Teclado: cambio de idioma y distribucion'
if ($cfgLang -eq 1) {
    $togPath = 'HKCU:\Keyboard Layout\Toggle'
    Apply 'Atajos Alt+Shift / Ctrl+Shift desactivados' @(
        @($togPath, 'Hotkey', '3', 'String'),
        @($togPath, 'Language Hotkey', '3', 'String'),
        @($togPath, 'Layout Hotkey', '3', 'String')
    )
} else {
    Say '  (desactivado)'
}

# ------------------------------------------------------------------
Head 'Atajos del sistema: Game Bar y boton Xbox'
$gbPath = 'HKCU:\Software\Microsoft\GameBar'
Apply 'Sin overlay por boton Xbox ni panel de inicio, Game Mode activo' @(
    @($gbPath, 'UseNexusForGameBarEnabled', 0, 'DWord'),
    @($gbPath, 'GamepadNexusChordEnabled', 0, 'DWord'),
    @($gbPath, 'ShowStartupPanel', 0, 'DWord'),
    @($gbPath, 'AutoGameModeEnabled', 1, 'DWord'),
    @($gbPath, 'AllowAutoGameMode', 1, 'DWord')
)

# ------------------------------------------------------------------
Head 'USB / HID: sin ahorro de energia en teclado y raton'
$powerDevs = @(Get-WmiObject -Namespace 'root\wmi' -Class MSPower_DeviceEnable -ErrorAction SilentlyContinue | Where-Object { $_.InstanceName -match '^(USB|HID)\\' })
$pwrCnt = 0
foreach ($pd in $powerDevs) {
    try { $pd.Enable = $false; $pd.Put() | Out-Null; $pwrCnt++ } catch { }
}
if ($pwrCnt -gt 0) { Ok ('Dispositivos USB/HID con ahorro de energia desactivado: ' + $pwrCnt) } else { Warn 'No se pudo cambiar el ahorro de energia de dispositivos USB/HID' }

$devNames = @('EnhancedPowerManagementEnabled', 'AllowIdleIrpInD3', 'D3ColdSupported', 'SelectiveSuspendEnabled', 'SelectiveSuspendOn', 'DeviceSelectiveSuspended', 'EnableSelectiveSuspend')
$regCnt = 0
foreach ($root in @('HKLM:\SYSTEM\CurrentControlSet\Enum\USB', 'HKLM:\SYSTEM\CurrentControlSet\Enum\HID')) {
    $dpKeys = @(Get-ChildItem -LiteralPath $root -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -eq 'Device Parameters' })
    foreach ($dk in $dpKeys) {
        foreach ($dn in $devNames) {
            if ($null -ne $dk.GetValue($dn)) {
                try { Set-ItemProperty -LiteralPath $dk.PSPath -Name $dn -Value 0 -Force -ErrorAction Stop; $regCnt++ } catch { }
            }
        }
    }
}
Ok ('Valores de suspension selectiva puestos a 0 en el registro de dispositivos: ' + $regCnt)

if (SetReg 'HKLM:\SYSTEM\CurrentControlSet\Services\USB' 'DisableSelectiveSuspend' 1 'DWord') { Ok 'Suspension selectiva USB desactivada globalmente' } else { Warn 'No se pudo desactivar la suspension selectiva global' }

if ($cfgUsbIrq -eq 1) {
    $ctrls = @(Get-PnpDevice -Class USB -PresentOnly -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -like 'PCI\*' })
    $irqCnt = 0
    foreach ($ct in $ctrls) {
        $ap = 'HKLM:\SYSTEM\CurrentControlSet\Enum\' + $ct.InstanceId + '\Device Parameters\Interrupt Management\Affinity Policy'
        if (SetReg $ap 'DevicePriority' 3 'DWord') { $irqCnt++ }
    }
    if ($irqCnt -gt 0) { Ok ('Prioridad de interrupcion alta en controladores USB: ' + $irqCnt + ' (efecto tras reiniciar)') } else { Warn 'No se encontraron controladores USB PCI o no se pudo escribir' }
} else {
    Say '  (prioridad de interrupciones desactivada)'
}

# ------------------------------------------------------------------
Head 'Tecla Windows'
if ($cfgWinKey -ne 0) {
    $smPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout'
    $mine = [byte[]](0,0,0,0, 0,0,0,0, 3,0,0,0, 0,0,0x5B,0xE0, 0,0,0x5C,0xE0, 0,0,0,0)
    $curMap = (Get-ItemProperty -LiteralPath $smPath -Name 'Scancode Map' -ErrorAction SilentlyContinue).'Scancode Map'
    $isMine = ($null -ne $curMap) -and (($curMap -join ',') -eq ($mine -join ','))
    if ($cfgWinKey -eq 1) {
        if (($null -eq $curMap) -or $isMine) {
            if (SetReg $smPath 'Scancode Map' $mine 'Binary') { Ok 'Tecla Windows desactivada (tras reiniciar)' } else { Warn 'No se pudo escribir el Scancode Map' }
        } else {
            Warn 'Ya existe un Scancode Map distinto: no se toca'
        }
    } elseif ($cfgWinKey -eq 2) {
        if ($isMine) {
            Remove-ItemProperty -LiteralPath $smPath -Name 'Scancode Map' -ErrorAction SilentlyContinue
            Ok 'Tecla Windows restaurada (tras reiniciar)'
        } else {
            Warn 'No hay un mapa propio que restaurar'
        }
    }
} else {
    Say '  (sin cambios, WIN_KEY=0)'
}

# ------------------------------------------------------------------
Head 'Fortnite: GameUserSettings.ini'
if ($cfgFortnite -eq 1) {
    $ini = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'
    if (-not (Test-Path -LiteralPath $ini)) {
        Warn 'No existe GameUserSettings.ini: abre Fortnite una vez, cierralo y repite'
    } elseif (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) {
        Warn 'Fortnite esta abierto: cierralo y vuelve a ejecutar este modulo'
    } else {
        $fnBytes = [IO.File]::ReadAllBytes($ini)
        $hasBom = (($fnBytes.Length -ge 2) -and ((($fnBytes[0] -eq 0xFF) -and ($fnBytes[1] -eq 0xFE)) -or (($fnBytes[0] -eq 0xFE) -and ($fnBytes[1] -eq 0xFF)))) -or (($fnBytes.Length -ge 3) -and ($fnBytes[0] -eq 0xEF) -and ($fnBytes[1] -eq 0xBB) -and ($fnBytes[2] -eq 0xBF))
        $sr = New-Object System.IO.StreamReader($ini, $true)
        $iniText = $sr.ReadToEnd()
        $iniEnc = $sr.CurrentEncoding
        $sr.Close()
        if (-not $hasBom) { $iniEnc = New-Object System.Text.UTF8Encoding($false) }

        $bak = $ini + '.boss.bak'
        if (-not (Test-Path -LiteralPath $bak)) { Copy-Item -LiteralPath $ini -Destination $bak -Force }
        if ($bkDir) { Copy-Item -LiteralPath $ini -Destination (Join-Path $bkDir 'GameUserSettings.ini') -Force }

        $want = [ordered]@{
            'bDisableMouseAcceleration' = 'True'
            'bEnableMouseSmoothing'     = 'False'
            'bViewAccelerationEnabled'  = 'False'
        }
        $newText = $iniText
        $found = @()
        $absent = @()
        foreach ($key in $want.Keys) {
            $rx = '(?mi)^(\s*' + [regex]::Escape($key) + '\s*=\s*)\S+'
            if ([regex]::IsMatch($newText, $rx)) {
                $newText = [regex]::Replace($newText, $rx, ('${1}' + $want[$key]))
                $found += $key
            } else {
                $absent += $key
            }
        }

        if ($found.Count -eq 0) {
            Warn 'No hay ninguna de las claves de raton en el ini: abre Fortnite, entra a Ajustes y cierralo, luego repite'
        } else {
            if ($newText -ne $iniText) {
                $wasRo = (Get-Item -LiteralPath $ini).IsReadOnly
                if ($wasRo) { Set-ItemProperty -LiteralPath $ini -Name IsReadOnly -Value $false }
                try {
                    [IO.File]::WriteAllText($ini, $newText, $iniEnc)
                    Ok ('Claves ajustadas: ' + ($found -join ', '))
                } catch {
                    Warn 'No se pudo escribir el ini'
                }
                if ($wasRo) { Set-ItemProperty -LiteralPath $ini -Name IsReadOnly -Value $true }
            } else {
                Ok ('Ya estaba correcto: ' + ($found -join ', '))
            }
            if ($absent.Count -gt 0) { Say ('  (no presentes en tu ini, no se crean: ' + ($absent -join ', ') + ')') 'DarkGray' }
            Say ('  Copia original: ' + $bak) 'DarkGray'
        }
    }
} else {
    Say '  (desactivado)'
}

# ------------------------------------------------------------------
Head 'Aplicando ajustes de usuario'
try { Start-Process rundll32.exe -ArgumentList 'user32.dll,UpdatePerUserSystemParameters 1, True' -WindowStyle Hidden -Wait } catch { }

Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
if ($bkDir) { Say ('  Copia de seguridad (.reg): ' + $bkDir) 'Gray' }
Say '  Reinicia el PC para aplicar todo (USB, idioma, tecla Windows).' 'Gray'
Say '==================================================================' 'Green'
Say ''
Say 'Lo que NO se puede hacer desde un bat (revisalo a mano):' 'Cyan'
Say '  - Raton: DPI 800 (400 a 1600) y polling 1000 a 2000 Hz; 8000 Hz solo si no te da tirones.' 'Gray'
Say '  - Raton y teclado en puertos USB traseros de la placa, sin hubs ni alargadores.' 'Gray'
Say '  - Software del raton: aceleracion, angle snapping y suavizado desactivados.' 'Gray'
Say '  - Fortnite, Ajustes, Entrada: sensibilidad X igual a Y y sin suavizado ni aceleracion si aparecen.' 'Gray'
Say '  - Fortnite, Video: NVIDIA Reflex en On + Boost si tu GPU es NVIDIA.' 'Gray'
#PS_MODULE:SYS:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0
$mode = $env:BOSS_MODE
if (-not $mode) { $mode = 'apply' }

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

$cfgRestore = Flag 'RESTORE_POINT' 1
$cfgTel     = Flag 'TELEMETRY' 1
$cfgAcc     = Flag 'ACCESSIBILITY' 1
$cfgSvc     = Flag 'SERVICES' 1
$cfgPerf    = Flag 'PERF_TWEAKS' 1
$cfgGpu     = Flag 'GPU_TWEAKS' 1
$cfgHz      = Flag 'DISPLAY_HZ' 1
$cfgFn      = Flag 'FORTNITE' 1
$cfgFnFs    = Flag 'FORTNITE_FULLSCREEN' 1
$cfgVbs     = Flag 'DISABLE_VBS' 0

$dataDir  = Join-Path $env:ProgramData 'BOSS'
$undoFile = Join-Path $dataDir 'sys_undo.json'
$global:undo = New-Object System.Collections.ArrayList
$global:ids = @{}

# ---------------------- Pantalla (API nativa) ----------------------
$apiDisp = $true
try {
    Add-Type -ErrorAction Stop -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
public static class BossDisplay {
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi)]
    public struct DEVMODE {
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmDeviceName;
        public short dmSpecVersion; public short dmDriverVersion; public short dmSize; public short dmDriverExtra;
        public int dmFields;
        public int dmPositionX; public int dmPositionY; public int dmDisplayOrientation; public int dmDisplayFixedOutput;
        public short dmColor; public short dmDuplex; public short dmYResolution; public short dmTTOption; public short dmCollate;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmFormName;
        public short dmLogPixels;
        public int dmBitsPerPel; public int dmPelsWidth; public int dmPelsHeight; public int dmDisplayFlags; public int dmDisplayFrequency;
        public int dmICMMethod; public int dmICMIntent; public int dmMediaType; public int dmDitherType;
        public int dmReserved1; public int dmReserved2; public int dmPanningWidth; public int dmPanningHeight;
    }
    [DllImport("user32.dll", CharSet = CharSet.Ansi)]
    public static extern bool EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);
    [DllImport("user32.dll", CharSet = CharSet.Ansi)]
    public static extern int ChangeDisplaySettingsEx(string deviceName, ref DEVMODE devMode, IntPtr hwnd, int flags, IntPtr lParam);
    public static DEVMODE NewMode() {
        DEVMODE d = new DEVMODE();
        d.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));
        return d;
    }
}
'@
} catch {
    $apiDisp = $false
}

function GetMaxHz($cur) {
    $max = 0
    $i = 0
    $m = [BossDisplay]::NewMode()
    while ([BossDisplay]::EnumDisplaySettings($null, $i, [ref]$m)) {
        if (($m.dmPelsWidth -eq $cur.dmPelsWidth) -and ($m.dmPelsHeight -eq $cur.dmPelsHeight) -and ($m.dmBitsPerPel -eq $cur.dmBitsPerPel) -and ($m.dmDisplayOrientation -eq $cur.dmDisplayOrientation) -and (($m.dmDisplayFlags -band 2) -eq 0)) {
            if ($m.dmDisplayFrequency -gt $max) { $max = $m.dmDisplayFrequency }
        }
        $i++
        if ($i -gt 5000) { break }
    }
    return $max
}

function SetRefresh($w, $h, $hz) {
    try {
        $m = [BossDisplay]::NewMode()
        if (-not [BossDisplay]::EnumDisplaySettings($null, -1, [ref]$m)) { return $false }
        if (($w -gt 0) -and (($m.dmPelsWidth -ne $w) -or ($m.dmPelsHeight -ne $h))) { return $false }
        $m.dmDisplayFrequency = $hz
        $m.dmFields = ($m.dmFields -bor 0x400000)
        $test = [BossDisplay]::ChangeDisplaySettingsEx($null, [ref]$m, [IntPtr]::Zero, 2, [IntPtr]::Zero)
        if ($test -ne 0) { return $false }
        $res = [BossDisplay]::ChangeDisplaySettingsEx($null, [ref]$m, [IntPtr]::Zero, 1, [IntPtr]::Zero)
        return ($res -eq 0)
    } catch {
        return $false
    }
}

# ---------------------- Archivos .ini ----------------------
function ReadIniFile($path) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $bom = (($bytes.Length -ge 2) -and ((($bytes[0] -eq 0xFF) -and ($bytes[1] -eq 0xFE)) -or (($bytes[0] -eq 0xFE) -and ($bytes[1] -eq 0xFF)))) -or (($bytes.Length -ge 3) -and ($bytes[0] -eq 0xEF) -and ($bytes[1] -eq 0xBB) -and ($bytes[2] -eq 0xBF))
    $sr = New-Object System.IO.StreamReader($path, $true)
    $text = $sr.ReadToEnd()
    $enc = $sr.CurrentEncoding
    $sr.Close()
    if (-not $bom) { $enc = New-Object System.Text.UTF8Encoding($false) }
    return [pscustomobject]@{ Text = $text; Enc = $enc }
}

function WriteIniFile($path, $text, $enc) {
    $ro = (Get-Item -LiteralPath $path).IsReadOnly
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $false }
    $okw = $true
    try { [IO.File]::WriteAllText($path, $text, $enc) } catch { $okw = $false }
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $true }
    return $okw
}

function IniGetSet($text, $key, $value) {
    $rx = '(?mi)^(\s*' + [regex]::Escape($key) + '\s*=\s*)(\S+)'
    $m = [regex]::Match($text, $rx)
    if (-not $m.Success) { return $null }
    $old = $m.Groups[2].Value
    $new = [regex]::Replace($text, $rx, ('${1}' + $value))
    return [pscustomobject]@{ Text = $new; Old = $old }
}

# ---------------------- Registro de cambios (deshacer) ----------------------
function UndoId($r) { return ([string]$r.t + '|' + [string]$r.a + '|' + [string]$r.b) }

function LoadUndo {
    if (Test-Path -LiteralPath $undoFile) {
        try {
            $raw = [IO.File]::ReadAllText($undoFile)
            $obj = $raw | ConvertFrom-Json
            foreach ($o in @($obj)) {
                [void]$global:undo.Add($o)
                $global:ids[(UndoId $o)] = $true
            }
        } catch { }
    }
}

function AddUndo($rec) {
    $id = UndoId $rec
    if (-not $global:ids.ContainsKey($id)) {
        [void]$global:undo.Add($rec)
        $global:ids[$id] = $true
    }
}

function SetReg($path, $name, $value, $type) {
    try {
        if (-not (Test-Path -LiteralPath $path)) { New-Item -Path $path -Force -ErrorAction Stop | Out-Null }
        New-ItemProperty -LiteralPath $path -Name $name -Value $value -PropertyType $type -Force -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

function RegQuiet($path, $name, $value, $type) {
    $rec = @{ t = 'reg'; a = $path; b = $name; old = $null; x = $false; y = $type }
    try {
        if (Test-Path -LiteralPath $path) {
            $key = Get-Item -LiteralPath $path -ErrorAction Stop
            $cur = $key.GetValue($name, $null)
            if ($null -ne $cur) {
                $rec.x = $true
                $rec.old = $cur
                $rec.y = [string]$key.GetValueKind($name)
                if ([string]$cur -eq [string]$value) { return 'same' }
            }
        }
    } catch { }
    if (SetReg $path $name $value $type) {
        AddUndo $rec
        return 'changed'
    }
    return 'fail'
}

function RegBatch($title, $items) {
    $chg = 0
    $same = 0
    $fail = 0
    foreach ($it in $items) {
        $r = RegQuiet $it[0] $it[1] $it[2] $it[3]
        if ($r -eq 'changed') { $chg++ } elseif ($r -eq 'same') { $same++ } else { $fail++ }
    }
    $txt = $title + ' [cambiados ' + $chg + ', ya estaban ' + $same + ', fallos ' + $fail + ']'
    if ($fail -eq 0) { Ok $txt } else { Warn $txt }
}

function ClearAccFlags($sub, $default) {
    $p = 'HKCU:\Control Panel\Accessibility\' + $sub
    $cur = (Get-ItemProperty -LiteralPath $p -Name Flags -ErrorAction SilentlyContinue).Flags
    if (-not $cur) {
        if ($default) { $cur = $default } else { return 'skip' }
    }
    $new = [string](([int64]$cur -bor 5) - 5)
    return (RegQuiet $p 'Flags' $new 'String')
}

function MergeDx($path, $name, $pairs) {
    $cur = ''
    try { $cur = [string](Get-ItemProperty -LiteralPath $path -Name $name -ErrorAction Stop).$name } catch { }
    $map = [ordered]@{}
    foreach ($tok in ($cur -split ';')) {
        if ($tok -match '^\s*([^=]+)=(.*)$') { $map[$Matches[1].Trim()] = $Matches[2].Trim() }
    }
    foreach ($k in $pairs.Keys) { $map[$k] = $pairs[$k] }
    $out = ''
    foreach ($k in $map.Keys) { $out += ($k + '=' + $map[$k] + ';') }
    return (RegQuiet $path $name $out 'String')
}

function SvcStep($name, $want, $label) {
    $key = 'HKLM:\SYSTEM\CurrentControlSet\Services\' + $name
    if (-not (Test-Path -LiteralPath $key)) { return }
    $start = (Get-ItemProperty -LiteralPath $key -Name Start -ErrorAction SilentlyContinue).Start
    $delayed = (Get-ItemProperty -LiteralPath $key -Name DelayedAutostart -ErrorAction SilentlyContinue).DelayedAutostart
    if ($null -eq $start) { return }
    $target = 3
    $scMode = 'demand'
    if ($want -eq 'disabled') {
        $target = 4
        $scMode = 'disabled'
    }
    if ([int]$start -eq $target) {
        Say ('  ' + $name + ': ya estaba en ' + $scMode) 'DarkGray'
        return
    }
    $oldMode = ''
    if ([int]$start -eq 2) {
        if ($delayed -eq 1) { $oldMode = 'delayed-auto' } else { $oldMode = 'auto' }
    } elseif ([int]$start -eq 3) {
        $oldMode = 'demand'
    } elseif ([int]$start -eq 4) {
        $oldMode = 'disabled'
    }
    if (-not $oldMode) {
        Warn ($name + ': tipo de inicio especial, no se toca')
        return
    }
    & sc.exe config $name start= $scMode *> $null
    if ($LASTEXITCODE -eq 0) {
        AddUndo @{ t = 'svc'; a = $name; b = ''; old = $oldMode }
        if ($scMode -eq 'disabled') { Stop-Service -Name $name -Force -ErrorAction SilentlyContinue }
        Ok ($label + ' (' + $name + ': ' + $oldMode + ' -> ' + $scMode + ')')
    } else {
        Warn ($name + ': Windows no permite cambiarlo, se omite')
    }
}

$global:taskCnt = 0
$global:taskFail = 0
function TaskStep($path, $name) {
    $found = @(Get-ScheduledTask -TaskPath $path -TaskName $name -ErrorAction SilentlyContinue)
    foreach ($tk in $found) {
        if ([string]$tk.State -eq 'Disabled') { continue }
        try {
            Disable-ScheduledTask -TaskPath $tk.TaskPath -TaskName $tk.TaskName -ErrorAction Stop | Out-Null
            AddUndo @{ t = 'task'; a = [string]$tk.TaskPath; b = [string]$tk.TaskName; old = 'enabled' }
            $global:taskCnt++
        } catch {
            $global:taskFail++
        }
    }
}

function RevertOne($r) {
    switch ([string]$r.t) {
        'reg' {
            if ($r.x) {
                if ([string]$r.y -eq 'DWord') { return (SetReg $r.a $r.b ([int]$r.old) 'DWord') }
                return (SetReg $r.a $r.b ([string]$r.old) 'String')
            }
            Remove-ItemProperty -LiteralPath $r.a -Name $r.b -ErrorAction SilentlyContinue
            return $true
        }
        'svc' {
            & sc.exe config ([string]$r.a) start= ([string]$r.old) *> $null
            return ($LASTEXITCODE -eq 0)
        }
        'task' {
            try {
                Enable-ScheduledTask -TaskPath ([string]$r.a) -TaskName ([string]$r.b) -ErrorAction Stop | Out-Null
                return $true
            } catch { return $false }
        }
        'display' {
            if (-not $apiDisp) { return $false }
            $parts = ([string]$r.b).Split('x')
            return (SetRefresh ([int]$parts[0]) ([int]$parts[1]) ([int]$r.old))
        }
        'ini' {
            try {
                if (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) { return $false }
                if (-not (Test-Path -LiteralPath ([string]$r.a))) { return $false }
                $ini = ReadIniFile ([string]$r.a)
                $res = IniGetSet $ini.Text ([string]$r.b) ([string]$r.old)
                if ($null -eq $res) { return $false }
                return (WriteIniFile ([string]$r.a) $res.Text $ini.Enc)
            } catch { return $false }
        }
    }
    return $false
}

function RunRevert($list) {
    $arr = @($list)
    [array]::Reverse($arr)
    $n = 0
    foreach ($r in $arr) {
        if (RevertOne $r) { $n++ }
    }
    return $n
}

# ====================== MODO RESTAURAR ======================
if ($mode -eq 'restore') {
    Head 'Restaurar los valores originales del sistema'
    if (-not (Test-Path -LiteralPath $undoFile)) {
        Warn 'No hay ningun estado guardado para restaurar'
        exit 0
    }
    $items = @([IO.File]::ReadAllText($undoFile) | ConvertFrom-Json)
    $done = RunRevert $items
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    Move-Item -LiteralPath $undoFile -Destination (Join-Path $dataDir ('sys_undo_restaurado_' + $stamp + '.json')) -Force
    Ok ('Cambios revertidos: ' + $done + ' de ' + $items.Count)
    if ($done -lt $items.Count) { Say '  Los que faltan suelen ser claves del ini de Fortnite (cierra el juego) o la pantalla (cambiala a mano).' 'DarkGray' }
    Say ''
    Say '  Reinicia el PC para completar la restauracion.' 'Gray'
    exit 0
}

# ====================== MODO APLICAR ======================
LoadUndo
$prevJson = $null
if (Test-Path -LiteralPath $undoFile) { $prevJson = [IO.File]::ReadAllText($undoFile) }

# ------------------------------------------------------------------
Head 'Tu equipo'
$os = Get-CimInstance Win32_OperatingSystem -ErrorAction SilentlyContinue
$cv = Get-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -ErrorAction SilentlyContinue
$edition = [string]$cv.EditionID
$build = [int]$cv.CurrentBuildNumber
$isLtsc = ($edition -match 'EnterpriseS|IoTEnterpriseS')
Say ('  Windows: ' + $os.Caption + '   build ' + $cv.CurrentBuildNumber + '.' + $cv.UBR + '   ' + $cv.DisplayVersion + '   edicion ' + $edition)
if ($isLtsc -and ($build -ge 26200)) {
    Say '  Nota: Microsoft solo publica LTSC 24H2 (build 26100). Tu build 26200 con LTSC es una version actualizada o modificada: el script comprueba cada cosa antes de tocarla.' 'DarkGray'
}
if (-not $isLtsc) { Warn 'No es una edicion LTSC/Enterprise: la telemetria no baja de Required (nivel 1), el resto funciona igual' }
$cpu = Get-CimInstance Win32_Processor -ErrorAction SilentlyContinue | Select-Object -First 1
$ram = [Math]::Round((Get-CimInstance Win32_ComputerSystem -ErrorAction SilentlyContinue).TotalPhysicalMemory / 1GB, 0)
Say ('  CPU: ' + $cpu.Name + '   RAM: ' + $ram + ' GB')
if (Get-CimInstance Win32_Battery -ErrorAction SilentlyContinue) { Warn 'Es un portatil: la pantalla y el plan de energia tambien dependen de la bateria' }

$gpus = @(Get-CimInstance Win32_VideoController -ErrorAction SilentlyContinue | Where-Object { [string]$_.PNPDeviceID -like 'PCI\*' })
$hasNv = $false
$hasAmdDis = $false
$hasIntel = $false
$mainGpuName = ''
foreach ($g in $gpus) {
    $ven = 'otra'
    if ([string]$g.PNPDeviceID -match 'VEN_10DE') {
        $ven = 'NVIDIA'
        $hasNv = $true
        $mainGpuName = [string]$g.Name
    } elseif ([string]$g.PNPDeviceID -match 'VEN_1002') {
        $ven = 'AMD'
        if ([string]$g.Name -match 'RX|PRO W|Radeon VII') { $hasAmdDis = $true; if (-not $mainGpuName) { $mainGpuName = [string]$g.Name } }
    } elseif ([string]$g.PNPDeviceID -match 'VEN_8086') {
        $ven = 'Intel'
        $hasIntel = $true
    }
    $dv = ([string]$g.DriverVersion).Replace('.', '')
    $drv = [string]$g.DriverVersion
    if (($ven -eq 'NVIDIA') -and ($dv.Length -ge 5)) {
        $tail = $dv.Substring($dv.Length - 5)
        $drv = $tail.Substring(0, 3) + '.' + $tail.Substring(3) + '  (' + $g.DriverVersion + ')'
    }
    Say ('  GPU: ' + $g.Name + '  [' + $ven + ']  driver ' + $drv)
}
if ($gpus.Count -eq 0) { Warn 'No se detecto ninguna GPU por PCI' }

$sysIsSsd = $false
try {
    $part = Get-Partition -DriveLetter ($env:SystemDrive.Substring(0, 1)) -ErrorAction Stop
    $pd = Get-PhysicalDisk -ErrorAction Stop | Where-Object { [string]$_.DeviceId -eq [string]$part.DiskNumber } | Select-Object -First 1
    if ($pd -and (([string]$pd.MediaType -eq 'SSD') -or ([string]$pd.BusType -eq 'NVMe'))) { $sysIsSsd = $true }
    Say ('  Disco del sistema: ' + $pd.FriendlyName + '  (' + $pd.MediaType + ', ' + $pd.BusType + ')')
} catch { }

# ------------------------------------------------------------------
if ($cfgRestore -eq 1) {
    Head 'Punto de restauracion de Windows'
    try {
        Enable-ComputerRestore -Drive ($env:SystemDrive + '\') -ErrorAction Stop
        $srKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore'
        $oldFreq = (Get-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue).SystemRestorePointCreationFrequency
        Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value 0 -Type DWord -Force
        Checkpoint-Computer -Description 'BOSS Sistema (antes de optimizar)' -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
        if ($null -ne $oldFreq) { Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value $oldFreq -Type DWord -Force } else { Remove-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue }
        Ok 'Punto de restauracion creado'
    } catch {
        Warn 'No se pudo crear el punto de restauracion (se sigue: todo queda guardado para deshacer)'
    }
}

# ------------------------------------------------------------------
if ($cfgTel -eq 1) {
    Head 'Telemetria, publicidad y sugerencias'
    $pol = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows'
    RegBatch 'Telemetria al minimo, sin envio de volcados ni notificaciones de opinion' @(
        @(($pol + '\DataCollection'), 'AllowTelemetry', 0, 'DWord'),
        @(($pol + '\DataCollection'), 'DoNotShowFeedbackNotifications', 1, 'DWord'),
        @(($pol + '\DataCollection'), 'LimitDiagnosticLogCollection', 1, 'DWord'),
        @(($pol + '\DataCollection'), 'LimitDumpCollection', 1, 'DWord'),
        @(($pol + '\DataCollection'), 'DisableOneSettingsDownloads', 1, 'DWord'),
        @(($pol + '\DataCollection'), 'AllowDeviceNameInTelemetry', 0, 'DWord'),
        @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection', 'AllowTelemetry', 0, 'DWord'),
        @(($pol + '\AppCompat'), 'AITEnable', 0, 'DWord'),
        @(($pol + '\AppCompat'), 'DisableInventory', 1, 'DWord'),
        @(($pol + '\AppCompat'), 'DisableUAR', 1, 'DWord'),
        @('HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows', 'CEIPEnable', 0, 'DWord'),
        @('HKLM:\SOFTWARE\Microsoft\SQMClient\Windows', 'CEIPEnable', 0, 'DWord'),
        @(($pol + '\Windows Error Reporting'), 'Disabled', 1, 'DWord')
    )
    RegBatch 'Historial de actividad, publicidad, IA de analisis y sincronizacion de ajustes' @(
        @(($pol + '\System'), 'EnableActivityFeed', 0, 'DWord'),
        @(($pol + '\System'), 'PublishUserActivities', 0, 'DWord'),
        @(($pol + '\System'), 'UploadUserActivities', 0, 'DWord'),
        @(($pol + '\AdvertisingInfo'), 'DisabledByGroupPolicy', 1, 'DWord'),
        @(($pol + '\CloudContent'), 'DisableWindowsConsumerFeatures', 1, 'DWord'),
        @(($pol + '\CloudContent'), 'DisableCloudOptimizedContent', 1, 'DWord'),
        @(($pol + '\WindowsAI'), 'DisableAIDataAnalysis', 1, 'DWord'),
        @('HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization', 'AllowInputPersonalization', 0, 'DWord'),
        @('HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync', 'DisableSettingSync', 2, 'DWord'),
        @('HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync', 'DisableSettingSyncUserOverride', 1, 'DWord')
    )
    $cdm = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
    RegBatch 'Usuario: publicidad, apps sugeridas, personalizacion y comentarios' @(
        @('HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo', 'Enabled', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy', 'TailoredExperiencesWithDiagnosticDataEnabled', 0, 'DWord'),
        @($cdm, 'ContentDeliveryAllowed', 0, 'DWord'),
        @($cdm, 'OemPreInstalledAppsEnabled', 0, 'DWord'),
        @($cdm, 'PreInstalledAppsEnabled', 0, 'DWord'),
        @($cdm, 'SilentInstalledAppsEnabled', 0, 'DWord'),
        @($cdm, 'SoftLandingEnabled', 0, 'DWord'),
        @($cdm, 'SystemPaneSuggestionsEnabled', 0, 'DWord'),
        @($cdm, 'RotatingLockScreenEnabled', 0, 'DWord'),
        @($cdm, 'SubscribedContent-310093Enabled', 0, 'DWord'),
        @($cdm, 'SubscribedContent-338387Enabled', 0, 'DWord'),
        @($cdm, 'SubscribedContent-338388Enabled', 0, 'DWord'),
        @($cdm, 'SubscribedContent-338389Enabled', 0, 'DWord'),
        @($cdm, 'SubscribedContent-353694Enabled', 0, 'DWord'),
        @($cdm, 'SubscribedContent-353696Enabled', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'Start_TrackProgs', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\Siuf\Rules', 'NumberOfSIUFInPeriod', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\InputPersonalization', 'RestrictImplicitInkCollection', 1, 'DWord'),
        @('HKCU:\Software\Microsoft\InputPersonalization', 'RestrictImplicitTextCollection', 1, 'DWord'),
        @('HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore', 'HarvestContacts', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\Personalization\Settings', 'AcceptedPrivacyPolicy', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\Input\TIPC', 'Enabled', 0, 'DWord')
    )

    SvcStep 'DiagTrack' 'disabled' 'Servicio de telemetria desactivado'
    SvcStep 'dmwappushservice' 'disabled' 'Enrutador de mensajes push de telemetria desactivado'
    SvcStep 'diagnosticshub.standardcollector.service' 'disabled' 'Recolector de diagnosticos desactivado'

    $global:taskCnt = 0
    $global:taskFail = 0
    TaskStep '\Microsoft\Windows\Application Experience\' 'Microsoft Compatibility Appraiser'
    TaskStep '\Microsoft\Windows\Application Experience\' 'ProgramDataUpdater'
    TaskStep '\Microsoft\Windows\Application Experience\' 'StartupAppTask'
    TaskStep '\Microsoft\Windows\Customer Experience Improvement Program\' 'Consolidator'
    TaskStep '\Microsoft\Windows\Customer Experience Improvement Program\' 'UsbCeip'
    TaskStep '\Microsoft\Windows\Customer Experience Improvement Program\' 'KernelCeipTask'
    TaskStep '\Microsoft\Windows\Customer Experience Improvement Program\' 'BthSQM'
    TaskStep '\Microsoft\Windows\Autochk\' 'Proxy'
    TaskStep '\Microsoft\Windows\DiskDiagnostic\' 'Microsoft-Windows-DiskDiagnosticDataCollector'
    TaskStep '\Microsoft\Windows\Feedback\Siuf\' 'DmClient'
    TaskStep '\Microsoft\Windows\Feedback\Siuf\' 'DmClientOnScenarioDownload'
    TaskStep '\Microsoft\Windows\Windows Error Reporting\' 'QueueReporting'
    TaskStep '\Microsoft\Windows\Device Information\' 'Device'
    TaskStep '\Microsoft\Windows\Device Information\' 'Device User'
    TaskStep '\Microsoft\Windows\NetTrace\' 'GatherNetworkInfo'
    TaskStep '\Microsoft\Windows\Maps\' 'MapsToastTask'
    TaskStep '\Microsoft\Windows\Maps\' 'MapsUpdateTask'
    if ($global:taskFail -eq 0) { Ok ('Tareas programadas de telemetria desactivadas: ' + $global:taskCnt) } else { Warn ('Tareas desactivadas: ' + $global:taskCnt + ', con fallo: ' + $global:taskFail) }
}

# ------------------------------------------------------------------
if ($cfgAcc -eq 1) {
    Head 'Accesibilidad que no sirve en juego (narrador y atajos)'
    RegBatch 'Narrador: sin atajo Win+Ctrl+Intro' @(
        @('HKCU:\Software\Microsoft\Narrator\NoRoam', 'WinEnterLaunchEnabled', 0, 'DWord')
    )
    $cfgp = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Accessibility'
    $conf = [string](Get-ItemProperty -LiteralPath $cfgp -Name Configuration -ErrorAction SilentlyContinue).Configuration
    if ($conf -match 'narrator') {
        $cleaned = (($conf -split ',') | Where-Object { $_ -and ($_ -notmatch 'narrator') }) -join ','
        $r0 = RegQuiet $cfgp 'Configuration' $cleaned 'String'
        if ($r0 -eq 'changed') { Ok 'Narrador quitado del inicio automatico' } else { Warn 'No se pudo quitar el Narrador del inicio' }
    } else {
        Say '  Narrador: no esta en el inicio automatico' 'DarkGray'
    }
    $accOk = 0
    $accFail = 0
    foreach ($ac in @(@('StickyKeys', '510'), @('Keyboard Response', '126'), @('ToggleKeys', '62'), @('HighContrast', '126'), @('MouseKeys', ''))) {
        $res = ClearAccFlags $ac[0] $ac[1]
        if ($res -eq 'fail') { $accFail++ } else { $accOk++ }
    }
    if ($accFail -eq 0) { Ok 'Atajos de teclas especiales, filtro, alternancia, alto contraste y teclas del raton desactivados' } else { Warn ('Atajos de accesibilidad con fallo: ' + $accFail) }
}

# ------------------------------------------------------------------
if ($cfgSvc -eq 1) {
    Head 'Servicios innecesarios (solo los seguros)'
    SvcStep 'MapsBroker' 'disabled' 'Mapas descargados'
    SvcStep 'WMPNetworkSvc' 'disabled' 'Uso compartido de Windows Media Player'
    SvcStep 'RemoteRegistry' 'disabled' 'Registro remoto (tambien mas seguro)'
    SvcStep 'Fax' 'disabled' 'Fax'
    SvcStep 'RetailDemo' 'disabled' 'Modo demo de tienda'
    if ($sysIsSsd) {
        SvcStep 'SysMain' 'disabled' 'SysMain (Superfetch) sin uso en SSD'
    } else {
        Say '  SysMain: se deja porque el disco del sistema no es SSD' 'DarkGray'
    }
    Say '  Se dejan intactos Xbox, Windows Update, Search, Spooler, Bluetooth y Wi-Fi para no perder compatibilidad.' 'DarkGray'
}

# ------------------------------------------------------------------
if ($cfgPerf -eq 1) {
    Head 'Ajustes de Windows para FPS y latencia'
    RegBatch 'Game Mode activo, grabacion en segundo plano (Game DVR) apagada' @(
        @('HKCU:\Software\Microsoft\GameBar', 'AutoGameModeEnabled', 1, 'DWord'),
        @('HKCU:\Software\Microsoft\GameBar', 'AllowAutoGameMode', 1, 'DWord'),
        @('HKCU:\System\GameConfigStore', 'GameDVR_Enabled', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR', 'AppCaptureEnabled', 0, 'DWord'),
        @('HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR', 'AllowGameDVR', 0, 'DWord')
    )
    RegBatch 'Planificador: sin power throttling, timer global, prioridad de juegos (MMCSS)' @(
        @('HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling', 'PowerThrottlingOff', 1, 'DWord'),
        @('HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel', 'GlobalTimerResolutionRequests', 1, 'DWord'),
        @('HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile', 'SystemResponsiveness', 0, 'DWord'),
        @('HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games', 'GPU Priority', 8, 'DWord'),
        @('HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games', 'Priority', 6, 'DWord'),
        @('HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games', 'Scheduling Category', 'High', 'String'),
        @('HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games', 'SFIO Priority', 'High', 'String')
    )
    RegBatch 'Interfaz: sin transparencia ni animaciones, menus instantaneos, sin apps en segundo plano' @(
        @('HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize', 'EnableTransparency', 0, 'DWord'),
        @('HKCU:\Control Panel\Desktop\WindowMetrics', 'MinAnimate', '0', 'String'),
        @('HKCU:\Control Panel\Desktop', 'MenuShowDelay', '0', 'String'),
        @('HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'TaskbarAnimations', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize', 'StartupDelayInMSec', 0, 'DWord'),
        @('HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications', 'GlobalUserDisabled', 1, 'DWord')
    )
    RegBatch 'Disco: sin escritura de ultimo acceso (NTFS)' @(
        @('HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem', 'NtfsDisableLastAccessUpdate', -2147483647, 'DWord')
    )
    RegBatch 'Edge: sin arranque anticipado ni ejecucion en segundo plano' @(
        @('HKLM:\SOFTWARE\Policies\Microsoft\Edge', 'StartupBoostEnabled', 0, 'DWord'),
        @('HKLM:\SOFTWARE\Policies\Microsoft\Edge', 'BackgroundModeEnabled', 0, 'DWord'),
        @('HKLM:\SOFTWARE\Policies\Microsoft\Edge', 'MetricsReportingEnabled', 0, 'DWord')
    )
    $dxr = MergeDx 'HKCU:\Software\Microsoft\DirectX\UserGpuPreferences' 'DirectXUserGlobalSettings' ([ordered]@{ SwapEffectUpgradeEnable = '1'; VRROptimizeEnable = '1' })
    if ($dxr -eq 'fail') { Warn 'No se pudo activar la optimizacion de juegos en ventana ni VRR' } else { Ok 'Optimizaciones para juegos en ventana y VRR activadas (DirectX)' }

    $hw = (Get-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Name HwSchMode -ErrorAction SilentlyContinue).HwSchMode
    if ($hw -eq 2) { Say '  Planificacion de GPU acelerada por hardware (HAGS): activada (no se toca)' 'DarkGray' } elseif ($hw -eq 1) { Say '  HAGS: desactivada. Activala en Configuracion, Pantalla, Grafico si tu GPU es RTX o RX 6000 o superior.' 'DarkGray' } else { Say '  HAGS: sin valor propio (Windows decide con el driver)' 'DarkGray' }
}

# ------------------------------------------------------------------
if ($cfgGpu -eq 1) {
    Head 'Grafica: ajustes seguros segun lo detectado'
    if ($hasNv) {
        Say ('  Se detecto NVIDIA: ' + $mainGpuName) 'Gray'
        RegBatch 'NVIDIA: telemetria desactivada en el registro' @(
            @('HKLM:\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client', 'OptInOrOutPreference', 0, 'DWord'),
            @('HKLM:\SOFTWARE\NVIDIA Corporation\Global\FTS', 'EnableRID44231', 0, 'DWord'),
            @('HKLM:\SOFTWARE\NVIDIA Corporation\Global\FTS', 'EnableRID64640', 0, 'DWord'),
            @('HKLM:\SOFTWARE\NVIDIA Corporation\Global\FTS', 'EnableRID66610', 0, 'DWord')
        )
        SvcStep 'NvTelemetryContainer' 'disabled' 'NVIDIA Telemetry Container'
        $global:taskCnt = 0
        $global:taskFail = 0
        TaskStep '\' 'NvTmRep*'
        TaskStep '\' 'NvTmMon*'
        TaskStep '\' 'NvTmRepOnLogon*'
        if ($global:taskCnt -gt 0) { Ok ('Tareas de telemetria de NVIDIA desactivadas: ' + $global:taskCnt) } else { Say '  Tareas NvTm*: no hay ninguna activa' 'DarkGray' }
        Say '  No se toca el driver ni los servicios de pantalla: NVDisplay.ContainerLocalSystem sigue activo.' 'DarkGray'
        if (Get-Process -Name 'NVIDIA Overlay', 'nvsphelper64', 'NVIDIA app' -ErrorAction SilentlyContinue) {
            Warn 'El overlay de NVIDIA esta en ejecucion: desactivalo si no lo usas, anade latencia'
        }
    } elseif ($hasAmdDis) {
        Say ('  Se detecto AMD: ' + $mainGpuName) 'Gray'
        Say '  Sin ajustes de registro seguros para AMD: usa Adrenalin (ver la lista del final).' 'DarkGray'
    } elseif ($hasIntel) {
        Say '  Solo se detecto graficos Intel: sin ajustes especificos.' 'DarkGray'
    } else {
        Say '  No se detecto una grafica dedicada.' 'DarkGray'
    }
}

# ------------------------------------------------------------------
if ($cfgHz -eq 1) {
    Head 'Pantalla principal: frecuencia'
    if (-not $apiDisp) {
        Warn 'No se pudo cargar la API de pantalla: se omite'
    } else {
        $dm = [BossDisplay]::NewMode()
        if (-not [BossDisplay]::EnumDisplaySettings($null, -1, [ref]$dm)) {
            Warn 'No se pudo leer el modo actual de la pantalla'
        } else {
            $curHz = $dm.dmDisplayFrequency
            $maxHz = GetMaxHz $dm
            Say ('  Ahora: ' + $dm.dmPelsWidth + 'x' + $dm.dmPelsHeight + ' a ' + $curHz + ' Hz   (maximo a esa resolucion: ' + $maxHz + ' Hz)')
            if ($maxHz -gt $curHz) {
                $w0 = $dm.dmPelsWidth
                $h0 = $dm.dmPelsHeight
                if (SetRefresh $w0 $h0 $maxHz) {
                    AddUndo @{ t = 'display'; a = 'primary'; b = ([string]$w0 + 'x' + [string]$h0); old = $curHz }
                    Ok ('Pantalla subida de ' + $curHz + ' a ' + $maxHz + ' Hz')
                } else {
                    Warn ('No se pudo subir a ' + $maxHz + ' Hz desde aqui: ponlo en Configuracion, Pantalla, Pantalla avanzada')
                }
            } else {
                Ok 'La pantalla ya va a su frecuencia maxima'
            }
        }
        $mons = @(Get-CimInstance -Namespace 'root\wmi' -ClassName WmiMonitorID -ErrorAction SilentlyContinue)
        if ($mons.Count -gt 1) { Warn ('Hay ' + $mons.Count + ' monitores: uno mas lento puede meter tirones en el escritorio. Revisa que todos esten a su frecuencia maxima.') }
    }
}

# ------------------------------------------------------------------
if ($cfgFn -eq 1) {
    Head 'Fortnite'
    $fnExe = $null
    $dat = Join-Path $env:ProgramData 'Epic\UnrealEngineLauncher\LauncherInstalled.dat'
    if (Test-Path -LiteralPath $dat) {
        try {
            $jd = [IO.File]::ReadAllText($dat) | ConvertFrom-Json
            foreach ($li in @($jd.InstallationList)) {
                if ([string]$li.AppName -eq 'Fortnite') {
                    $cand = Join-Path ([string]$li.InstallLocation) 'FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe'
                    if (Test-Path -LiteralPath $cand) { $fnExe = $cand }
                }
            }
        } catch { }
    }
    if (-not $fnExe) {
        $def = 'C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe'
        if (Test-Path -LiteralPath $def) { $fnExe = $def }
    }
    if ($fnExe) {
        Say ('  Instalacion: ' + $fnExe) 'DarkGray'
        if ($hasNv -or $hasAmdDis) {
            $gp = RegQuiet 'HKCU:\Software\Microsoft\DirectX\UserGpuPreferences' $fnExe 'GpuPreference=2;' 'String'
            if ($gp -eq 'fail') { Warn 'No se pudo fijar la GPU de alto rendimiento para Fortnite' } else { Ok 'Fortnite usara siempre la GPU de alto rendimiento (no la integrada)' }
        }
    } else {
        Warn 'No se encontro la instalacion de Fortnite (se omite la preferencia de GPU)'
    }

    $ini = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'
    if (-not (Test-Path -LiteralPath $ini)) {
        Warn 'No existe GameUserSettings.ini: abre Fortnite una vez, cierralo y repite'
    } elseif (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) {
        Warn 'Fortnite esta abierto: cierralo y vuelve a ejecutar para tocar GameUserSettings.ini'
    } else {
        $bak = $ini + '.boss_sys.bak'
        if (-not (Test-Path -LiteralPath $bak)) { Copy-Item -LiteralPath $ini -Destination $bak -Force }
        $want = [ordered]@{ 'bUseVSync' = 'False'; 'bAllowMultithreadedRendering' = 'True' }
        if ($cfgFnFs -eq 1) {
            $want['FullscreenMode'] = '0'
            $want['LastConfirmedFullscreenMode'] = '0'
            $want['PreferredFullscreenMode'] = '0'
        }
        $file = ReadIniFile $ini
        $newText = $file.Text
        $changed = @()
        $same = @()
        $absent = @()
        foreach ($key in $want.Keys) {
            $res = IniGetSet $newText $key $want[$key]
            if ($null -eq $res) {
                $absent += $key
            } elseif ($res.Old -eq $want[$key]) {
                $same += $key
            } else {
                $newText = $res.Text
                $changed += $key
                AddUndo @{ t = 'ini'; a = $ini; b = $key; old = $res.Old }
            }
        }
        if ($changed.Count -gt 0) {
            if (WriteIniFile $ini $newText $file.Enc) {
                Ok ('GameUserSettings.ini ajustado: ' + ($changed -join ', '))
            } else {
                Warn 'No se pudo escribir GameUserSettings.ini'
            }
        } elseif ($same.Count -gt 0) {
            Ok ('GameUserSettings.ini ya estaba correcto: ' + ($same -join ', '))
        } else {
            Warn 'Ninguna de las claves esta en tu ini: abre Fortnite, entra a Ajustes y cierralo, luego repite'
        }
        if ($absent.Count -gt 0) { Say ('  (no presentes en tu ini, no se crean: ' + ($absent -join ', ') + ')') 'DarkGray' }
        Say ('  Copia del original: ' + $bak) 'DarkGray'
    }
}

# ------------------------------------------------------------------
Head 'Seguridad basada en virtualizacion (VBS e integridad de memoria)'
$dg = Get-CimInstance -Namespace 'root\Microsoft\Windows\DeviceGuard' -ClassName Win32_DeviceGuard -ErrorAction SilentlyContinue
$vbsRunning = ($dg -and ([int]$dg.VirtualizationBasedSecurityStatus -eq 2))
$hvciRunning = ($dg -and (@($dg.SecurityServicesRunning) -contains 2))
if (-not $dg) {
    Say '  No se pudo consultar el estado de VBS' 'DarkGray'
} elseif (-not $vbsRunning) {
    Ok 'VBS no esta en ejecucion: no te cuesta FPS'
} else {
    if ($hvciRunning) { Say '  VBS e integridad de memoria (HVCI) estan activos: cuestan algunos FPS.' 'Yellow' } else { Say '  VBS esta activo: cuesta algunos FPS.' 'Yellow' }
    if ($cfgVbs -eq 1) {
        RegBatch 'VBS y HVCI desactivados (necesita reiniciar)' @(
            @('HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard', 'EnableVirtualizationBasedSecurity', 0, 'DWord'),
            @('HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity', 'Enabled', 0, 'DWord')
        )
    } else {
        Say '  No se toca por defecto (es una proteccion). Para quitarlo pon DISABLE_VBS=1 al principio del archivo.' 'DarkGray'
    }
}

# ------------------------------------------------------------------
Head 'Programas que arrancan con Windows (solo informe)'
$startup = @(Get-CimInstance Win32_StartupCommand -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name -Unique)
if ($startup.Count -eq 0) {
    Say '  Ninguno registrado' 'DarkGray'
} else {
    Say ('  ' + $startup.Count + ' entradas: ' + (($startup | Select-Object -First 15) -join ', ')) 'DarkGray'
    Say '  Quita los que no uses en el Administrador de tareas, Aplicaciones de inicio.' 'DarkGray'
}

# ------------------------------------------------------------------
Head 'Guardando el estado para poder deshacer'
try {
    New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
    if ($global:undo.Count -gt 0) {
        $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
        [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
    }
    $self = $env:BOSS_SELF
    $dst = Join-Path $dataDir 'BOSSTWK.bat'
    if ($self -and ($self -ne $dst)) { Copy-Item -LiteralPath $self -Destination $dst -Force }
    $launcher = Join-Path ((Join-Path $env:ProgramData 'BOSS')) 'BOSS_Sistema_RESTAURAR.bat'
    $lines = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" restore sys')
    [IO.File]::WriteAllText($launcher, (($lines -join "`r`n") + "`r`n"), (New-Object System.Text.ASCIIEncoding))
    Ok 'Estado guardado: usa COMPROBAR y RESTAURAR del menu de BOSSTWK'
} catch {
    Warn 'No se pudo guardar el estado de restauracion'
}

# ------------------------------------------------------------------
Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
Say '  Reinicia el PC para completar los cambios.' 'Gray'
Say '==================================================================' 'Green'
Say ''
Say 'Lo que ya no se puede hacer desde un bat (haz esto a mano):' 'Cyan'
if ($hasNv) {
    Say '  NVIDIA, Panel de control o app, Configuracion 3D, para FortniteClient-Win64-Shipping.exe:' 'Gray'
    Say '    - Administracion de energia: Preferir maximo rendimiento' 'Gray'
    Say '    - Sincronizacion vertical: Desactivada. Frecuencia maxima de fotogramas: Desactivada' 'Gray'
    Say '    - Modo de baja latencia: el Reflex del juego manda; si un juego no lo tiene, On' 'Gray'
    Say '    - Tecnologia de monitor: G-SYNC compatible si tu monitor lo soporta' 'Gray'
    Say '    - Desactiva el overlay de NVIDIA y los filtros de juego si no los usas' 'Gray'
} elseif ($hasAmdDis) {
    Say '  AMD Adrenalin: Anti-Lag activado, FreeSync activado, Radeon Chill y Enhanced Sync desactivados.' 'Gray'
}
Say '  Fortnite, Ajustes, Video: NVIDIA Reflex en On + Boost si tu GPU es NVIDIA, VSync apagado.' 'Gray'
Say '  Fortnite, modo de renderizado: el modo Rendimiento da la menor latencia; DirectX 12 da mas calidad visual.' 'Gray'
Say '  Monitor (menu OSD): frecuencia maxima, VRR activado, Overdrive en medio, sin suavizado de movimiento.' 'Gray'
Say '  Cable de pantalla: DisplayPort mejor que HDMI si el monitor llega a muchos Hz.' 'Gray'
#PS_MODULE:NET:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0
$mode = $env:BOSS_MODE
if (-not $mode) { $mode = 'apply' }

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

$cfgLoad   = Flag 'LOAD_TEST' 1
$cfgRegion = Flag 'REGION_TEST' 1
$cfgQos    = Flag 'FORTNITE_QOS' 1
$cfgNic    = Flag 'NIC_TWEAKS' 1
$cfgDo     = Flag 'DELIVERY_OPT' 1

$dataDir  = Join-Path $env:ProgramData 'BOSS'
$undoFile = Join-Path $dataDir 'net_undo.json'
$global:undo = New-Object System.Collections.ArrayList
$global:runUndo = New-Object System.Collections.ArrayList
$global:ids = @{}

# ---------------------- Registro de cambios (deshacer) ----------------------
function UndoId($r) { return ([string]$r.t + '|' + [string]$r.a + '|' + [string]$r.b) }

function LoadUndo {
    if (Test-Path -LiteralPath $undoFile) {
        try {
            $raw = [IO.File]::ReadAllText($undoFile)
            $obj = $raw | ConvertFrom-Json
            foreach ($o in @($obj)) {
                [void]$global:undo.Add($o)
                $global:ids[(UndoId $o)] = $true
            }
        } catch { }
    }
}

function AddUndo($rec) {
    [void]$global:runUndo.Add($rec)
    $id = UndoId $rec
    if (-not $global:ids.ContainsKey($id)) {
        [void]$global:undo.Add($rec)
        $global:ids[$id] = $true
    }
}

function SetReg($path, $name, $value, $type) {
    try {
        if (-not (Test-Path -LiteralPath $path)) { New-Item -Path $path -Force -ErrorAction Stop | Out-Null }
        New-ItemProperty -LiteralPath $path -Name $name -Value $value -PropertyType $type -Force -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

function RegStep($label, $path, $name, $value, $type) {
    $rec = @{ t = 'reg'; a = $path; b = $name; old = $null; x = $false; y = $type }
    try {
        if (Test-Path -LiteralPath $path) {
            $key = Get-Item -LiteralPath $path -ErrorAction Stop
            $cur = $key.GetValue($name, $null)
            if ($null -ne $cur) {
                $rec.x = $true
                $rec.old = $cur
                $rec.y = [string]$key.GetValueKind($name)
                if ([string]$cur -eq [string]$value) {
                    Say ('  ' + $label + ': ya estaba asi') 'DarkGray'
                    return
                }
            }
        }
    } catch { }
    if (SetReg $path $name $value $type) {
        AddUndo $rec
        Ok $label
    } else {
        Warn ($label + ': no se pudo escribir')
    }
}

function RevertOne($r) {
    switch ([string]$r.t) {
        'reg' {
            if ($r.x) {
                if ([string]$r.y -eq 'DWord') { return (SetReg $r.a $r.b ([int]$r.old) 'DWord') }
                return (SetReg $r.a $r.b ([string]$r.old) 'String')
            }
            Remove-ItemProperty -LiteralPath $r.a -Name $r.b -ErrorAction SilentlyContinue
            return $true
        }
        'nic' {
            try {
                Set-NetAdapterAdvancedProperty -Name $r.a -RegistryKeyword $r.b -RegistryValue ([string]$r.old) -NoRestart -ErrorAction Stop
                return $true
            } catch { return $false }
        }
        'rsc' {
            try {
                $parts = ([string]$r.old).Split(',')
                if ($parts[0] -eq '1') { Enable-NetAdapterRsc -Name $r.a -IPv4 -ErrorAction Stop }
                if ($parts[1] -eq '1') { Enable-NetAdapterRsc -Name $r.a -IPv6 -ErrorAction Stop }
                return $true
            } catch { return $false }
        }
        'offload' {
            try {
                Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing ([string]$r.old) -ErrorAction Stop
                return $true
            } catch { return $false }
        }
        'tcpset' {
            try {
                Set-NetTCPSetting -SettingName $r.a -AutoTuningLevelLocal ([string]$r.old) -ErrorAction Stop
                return $true
            } catch { return $false }
        }
        'netsh' {
            & netsh.exe int udp set global ('uro=' + [string]$r.old) *> $null
            return ($LASTEXITCODE -eq 0)
        }
        'qos' {
            try {
                if ([string]$r.b) {
                    Remove-NetQosPolicy -Name $r.a -PolicyStore ([string]$r.b) -Confirm:$false -ErrorAction Stop
                } else {
                    Remove-NetQosPolicy -Name $r.a -Confirm:$false -ErrorAction Stop
                }
                return $true
            } catch { return $false }
        }
        'wmipwr' {
            try {
                $w = Get-WmiObject -Namespace 'root\wmi' -Class MSPower_DeviceEnable -ErrorAction Stop | Where-Object { $_.InstanceName -eq [string]$r.a } | Select-Object -First 1
                if ($w) { $w.Enable = [bool]$r.old; $w.Put() | Out-Null }
                return $true
            } catch { return $false }
        }
    }
    return $false
}

function RunRevert($list) {
    $arr = @($list)
    [array]::Reverse($arr)
    $n = 0
    foreach ($r in $arr) {
        if (RevertOne $r) { $n++ }
    }
    return $n
}

function RestartNics($list) {
    $names = @($list | Where-Object { ([string]$_.t -eq 'nic') -or ([string]$_.t -eq 'rsc') } | ForEach-Object { [string]$_.a } | Select-Object -Unique)
    foreach ($nm in $names) {
        try { Restart-NetAdapter -Name $nm -ErrorAction Stop } catch { }
    }
    return $names.Count
}

# ---------------------- Medicion de red ----------------------
function PingOnce($target, $timeout) {
    try {
        $p = New-Object System.Net.NetworkInformation.Ping
        $r = $p.Send($target, $timeout)
        if ($r.Status -eq 'Success') { return [double]$r.RoundtripTime }
    } catch { }
    return $null
}

function TcpOk($h, $port, $ms) {
    try {
        $c = New-Object System.Net.Sockets.TcpClient
        $a = $c.BeginConnect($h, $port, $null, $null)
        $done = $a.AsyncWaitHandle.WaitOne($ms, $false)
        $up = ($done -and $c.Connected)
        $c.Close()
        return $up
    } catch { }
    return $false
}

function InternetOk {
    if ($null -ne (PingOnce '1.1.1.1' 1200)) { return $true }
    if ($null -ne (PingOnce '8.8.8.8' 1200)) { return $true }
    return (TcpOk '1.1.1.1' 443 2000)
}

function DnsOk {
    try {
        $a = [System.Net.Dns]::GetHostAddresses('epicgames.com')
        return ($a.Count -gt 0)
    } catch { }
    return $false
}

function PingSamples($target, $ms, $intervalMs) {
    $p = New-Object System.Net.NetworkInformation.Ping
    $sw = [Diagnostics.Stopwatch]::StartNew()
    $rtts = New-Object System.Collections.Generic.List[double]
    $sent = 0
    $lost = 0
    while ($sw.ElapsedMilliseconds -lt $ms) {
        $sent++
        try {
            $r = $p.Send($target, 800)
            if ($r.Status -eq 'Success') { [void]$rtts.Add([double]$r.RoundtripTime) } else { $lost++ }
        } catch { $lost++ }
        Start-Sleep -Milliseconds $intervalMs
    }
    return [pscustomobject]@{ Sent = $sent; Lost = $lost; Rtts = $rtts }
}

function GetStat($s) {
    if ($null -eq $s) { return $null }
    if ($s.Rtts.Count -eq 0) { return $null }
    $a = $s.Rtts.ToArray()
    [Array]::Sort($a)
    $avg = ($a | Measure-Object -Average).Average
    $idx = [Math]::Min($a.Length - 1, [int][Math]::Floor($a.Length * 0.95))
    $loss = [Math]::Round(100.0 * $s.Lost / [Math]::Max(1, $s.Sent), 1)
    return [pscustomobject]@{ Min = $a[0]; Avg = [Math]::Round($avg, 1); P95 = $a[$idx]; Max = $a[$a.Length - 1]; Loss = $loss }
}

function ShowStat($label, $s) {
    if ($null -eq $s) {
        Say ('  ' + $label + ': sin respuesta') 'Yellow'
        return
    }
    Say ('  {0,-18} min {1,4} | media {2,6} | p95 {3,5} | max {4,5} | perdidos {5}%' -f $label, $s.Min, $s.Avg, $s.P95, $s.Max, $s.Loss)
}

function LoadTest($dir, $secs) {
    $jobs = @()
    for ($k = 0; $k -lt 3; $k++) {
        $jobs += Start-Job -ArgumentList $dir, ($secs + 6) -ScriptBlock {
            param($m, $s)
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            $end = (Get-Date).AddSeconds($s)
            $wc = New-Object System.Net.WebClient
            $buf = $null
            if ($m -eq 'up') { $buf = New-Object byte[] 8000000 }
            while ((Get-Date) -lt $end) {
                try {
                    if ($m -eq 'down') {
                        [void]$wc.DownloadData('https://speed.cloudflare.com/__down?bytes=50000000')
                    } else {
                        [void]$wc.UploadData('https://speed.cloudflare.com/__up', 'POST', $buf)
                    }
                } catch {
                    Start-Sleep -Milliseconds 300
                }
            }
        }
    }
    Start-Sleep -Milliseconds 3000
    $st = GetStat (PingSamples '1.1.1.1' ($secs * 1000) 100)
    foreach ($j in $jobs) {
        Stop-Job -Job $j -ErrorAction SilentlyContinue
        Remove-Job -Job $j -Force -ErrorAction SilentlyContinue
    }
    return $st
}

function Grade($delta) {
    if ($delta -lt 5) { return 'A+' }
    if ($delta -lt 30) { return 'A' }
    if ($delta -lt 60) { return 'B' }
    if ($delta -lt 200) { return 'C' }
    if ($delta -lt 400) { return 'D' }
    return 'F'
}

function GradeColor($g) {
    if ($g -eq 'A+' -or $g -eq 'A') { return 'Green' }
    if ($g -eq 'B' -or $g -eq 'C') { return 'Yellow' }
    return 'Red'
}

# ====================== MODO RESTAURAR ======================
if ($mode -eq 'restore') {
    Head 'Restaurar los valores originales de red'
    if (-not (Test-Path -LiteralPath $undoFile)) {
        Warn 'No hay ningun estado guardado para restaurar'
        exit 0
    }
    $items = @([IO.File]::ReadAllText($undoFile) | ConvertFrom-Json)
    $done = RunRevert $items
    $nr = RestartNics $items
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    Move-Item -LiteralPath $undoFile -Destination (Join-Path $dataDir ('net_undo_restaurado_' + $stamp + '.json')) -Force
    Ok ('Cambios revertidos: ' + $done + ' de ' + $items.Count)
    if ($nr -gt 0) { Say '  Adaptadores reiniciados (corte de unos segundos)' 'DarkGray' }
    Say ''
    Say '  Reinicia el PC para completar la restauracion.' 'Gray'
    exit 0
}

# ====================== MODO APLICAR ======================
LoadUndo
$prevJson = $null
if (Test-Path -LiteralPath $undoFile) { $prevJson = [IO.File]::ReadAllText($undoFile) }

Head 'Estado inicial'
$route = Get-NetRoute -DestinationPrefix '0.0.0.0/0' -ErrorAction SilentlyContinue | Where-Object { $_.NextHop -ne '0.0.0.0' } | Sort-Object RouteMetric | Select-Object -First 1
$gw = $null
$ad = $null
if ($route) {
    $gw = $route.NextHop
    $ad = Get-NetAdapter -InterfaceIndex $route.ifIndex -ErrorAction SilentlyContinue
}
$isWifi = $false
if ($ad) {
    $isWifi = (([string]$ad.PhysicalMediaType -match '802\.11') -or ([string]$ad.InterfaceDescription -match 'Wi-?Fi|Wireless|802\.11'))
    Say ('  Adaptador: ' + $ad.Name + ' (' + $ad.InterfaceDescription + ')')
    Say ('  Enlace: ' + $ad.LinkSpeed + '   Puerta de enlace: ' + $gw)
} else {
    Warn 'No se detecto la ruta por defecto'
}
if ($isWifi) { Warn 'Estas por Wi-Fi: el cable Ethernet mejora el ping mas que cualquier ajuste del PC' }

$netBase = InternetOk
$dnsBase = DnsOk
if (-not $netBase) {
    Warn 'Sin conexion a Internet al empezar. No toco nada para no empeorarlo: conectate y vuelve a ejecutar.'
    exit 1
}
if (-not $dnsBase) { Warn 'El DNS no resuelve al empezar (no se usara como criterio de verificacion)' }
if ($gw) { ShowStat 'Router (LAN)' (GetStat (PingSamples $gw 3000 100)) }
ShowStat 'Internet 1.1.1.1' (GetStat (PingSamples '1.1.1.1' 3000 100))

# ------------------------------------------------------------------
if ($cfgRegion -eq 1) {
    Head 'Latencia a los servidores de Fortnite (puntos de ping oficiales de Epic)'
    $regionNames = [ordered]@{ eu = 'Europa'; nae = 'NA-Este'; nac = 'NA-Centro'; naw = 'NA-Oeste'; oce = 'Oceania'; br = 'Brasil'; asia = 'Asia'; me = 'Oriente Medio' }
    $rows = @()
    foreach ($key in $regionNames.Keys) {
        $h = 'ping-' + $key + '.ds.on.epicgames.com'
        $vals = @()
        for ($k = 0; $k -lt 5; $k++) {
            $v = PingOnce $h 1000
            if ($null -ne $v) { $vals += $v }
            Start-Sleep -Milliseconds 100
        }
        $avg = $null
        if ($vals.Count -gt 0) { $avg = [Math]::Round((($vals | Measure-Object -Average).Average), 0) }
        $rows += [pscustomobject]@{ Name = $regionNames[$key]; Avg = $avg; Got = $vals.Count }
    }
    $good = @($rows | Where-Object { $_.Got -gt 0 } | Sort-Object Avg)
    foreach ($row in $good) { Say ('  {0,-14} {1,5} ms   ({2}/5 respuestas)' -f $row.Name, $row.Avg, $row.Got) }
    foreach ($row in @($rows | Where-Object { $_.Got -eq 0 })) { Say ('  {0,-14} sin respuesta' -f $row.Name) 'DarkGray' }
    if ($good.Count -gt 0) { Ok ('Region con menor latencia: ' + $good[0].Name + ' (' + $good[0].Avg + ' ms)') } else { Warn 'No respondio ningun punto de ping de Epic' }
}

# ------------------------------------------------------------------
$bloatGrade = $null
if ($cfgLoad -eq 1) {
    Head 'Bufferbloat: latencia en reposo frente a latencia bajo carga'
    Say '  Midiendo (unos 30 s, descarga y sube datos de Cloudflare) ...' 'DarkGray'
    $idle = GetStat (PingSamples '1.1.1.1' 5000 100)
    ShowStat 'Reposo' $idle
    if ($null -eq $idle) {
        Warn 'Sin respuesta ICMP de 1.1.1.1: se omite la medicion de bufferbloat'
    } else {
        $dn = LoadTest 'down' 5
        ShowStat 'Bajando (carga)' $dn
        $upl = LoadTest 'up' 5
        ShowStat 'Subiendo (carga)' $upl
        foreach ($dd in @(@('Bajada', $dn), @('Subida', $upl))) {
            if ($null -ne $dd[1]) {
                $delta = [Math]::Round($dd[1].Avg - $idle.Avg, 0)
                $g = Grade $delta
                Say ('  Bufferbloat de ' + $dd[0] + ': +' + $delta + ' ms  -> nota ' + $g) (GradeColor $g)
                if ($null -eq $bloatGrade -or $delta -gt $bloatDelta) { $bloatGrade = $g; $bloatDelta = $delta }
            } else {
                Warn ('Bufferbloat de ' + $dd[0] + ': la linea se saturo y no hubo respuestas (muy mala nota)')
                $bloatGrade = 'F'
                $bloatDelta = 9999
            }
        }
    }
}

# ------------------------------------------------------------------
Head 'Pila TCP/UDP: menos coalescing, sin tocar el autotuning'
try {
    $og = Get-NetOffloadGlobalSetting -ErrorAction Stop
    if ([string]$og.ReceiveSegmentCoalescing -ne 'Disabled') {
        $oldRsc = [string]$og.ReceiveSegmentCoalescing
        Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing Disabled -ErrorAction Stop
        AddUndo @{ t = 'offload'; a = 'rsc'; b = ''; old = $oldRsc }
        Ok 'RSC global desactivado (los paquetes TCP ya no esperan para agruparse)'
    } else {
        Say '  RSC global: ya estaba desactivado' 'DarkGray'
    }
} catch {
    Warn 'No se pudo cambiar RSC global'
}

& netsh.exe int udp set global uro=disabled *> $null
if ($LASTEXITCODE -eq 0) {
    AddUndo @{ t = 'netsh'; a = 'udp-uro'; b = ''; old = 'default' }
    Ok 'URO desactivado (los datagramas UDP del juego no se agrupan)'
} else {
    Say '  URO: esta version de Windows no lo tiene, se omite' 'DarkGray'
}

$tcp = Get-NetTCPSetting -SettingName InternetCustom -ErrorAction SilentlyContinue
if ($tcp) {
    $lvl = [string]$tcp.AutoTuningLevelLocal
    if ($lvl -eq 'Disabled') {
        try {
            Set-NetTCPSetting -SettingName InternetCustom -AutoTuningLevelLocal Normal -ErrorAction Stop
            AddUndo @{ t = 'tcpset'; a = 'InternetCustom'; b = 'AutoTuningLevelLocal'; old = 'Disabled' }
            Ok 'Autotuning estaba desactivado (limita la velocidad): vuelto a Normal'
        } catch {
            Warn 'No se pudo restaurar el autotuning a Normal'
        }
    } else {
        Say ('  Autotuning: ' + $lvl + ' (no se toca)') 'DarkGray'
    }
}

# ------------------------------------------------------------------
Head 'Adaptador Ethernet principal'
$nicChanged = 0
if ($cfgNic -ne 1) {
    Say '  (desactivado)'
} elseif ((-not $ad) -or (-not $ad.HardwareInterface)) {
    Warn 'La ruta por defecto no pasa por un adaptador fisico (VPN u otro): se omite'
} elseif ($isWifi) {
    Warn 'Adaptador Wi-Fi: se omiten los ajustes del driver para no arriesgar la conexion'
} else {
    $nn = $ad.Name
    $kws = @('*InterruptModeration', '*EEE', 'EEELinkAdvertisement', 'EnableGreenEthernet', 'AdvancedEEE', 'GigaLite', 'PowerSavingMode', 'ULPMode')
    $props = @(Get-NetAdapterAdvancedProperty -Name $nn -ErrorAction SilentlyContinue)
    foreach ($kw in $kws) {
        $p = $props | Where-Object { $_.RegistryKeyword -eq $kw } | Select-Object -First 1
        if (-not $p) { continue }
        $cur = [string]($p.RegistryValue | Select-Object -First 1)
        $valid = @($p.ValidRegistryValues)
        if ($cur -eq '0') {
            Say ('  ' + $kw + ': ya estaba en 0') 'DarkGray'
            continue
        }
        if (($valid.Count -gt 0) -and ($valid -notcontains '0')) {
            Warn ($kw + ': el driver no admite el valor 0, se omite')
            continue
        }
        try {
            Set-NetAdapterAdvancedProperty -Name $nn -RegistryKeyword $kw -RegistryValue '0' -NoRestart -ErrorAction Stop
            AddUndo @{ t = 'nic'; a = $nn; b = $kw; old = $cur }
            $nicChanged++
            Ok ($kw + ': ' + $cur + ' -> 0   (' + $p.DisplayName + ')')
        } catch {
            Warn ($kw + ': no se pudo cambiar')
        }
    }

    $rsc = Get-NetAdapterRsc -Name $nn -ErrorAction SilentlyContinue
    if ($rsc -and ($rsc.IPv4Enabled -or $rsc.IPv6Enabled)) {
        try {
            $oldNicRsc = ([string][int][bool]$rsc.IPv4Enabled) + ',' + ([string][int][bool]$rsc.IPv6Enabled)
            Disable-NetAdapterRsc -Name $nn -ErrorAction Stop
            AddUndo @{ t = 'rsc'; a = $nn; b = ''; old = $oldNicRsc }
            $nicChanged++
            Ok 'RSC del adaptador desactivado'
        } catch {
            Warn 'No se pudo desactivar el RSC del adaptador'
        }
    }

    $pnp = [string]$ad.PnPDeviceID
    if ($pnp) {
        $w = Get-WmiObject -Namespace 'root\wmi' -Class MSPower_DeviceEnable -ErrorAction SilentlyContinue | Where-Object { $_.InstanceName.StartsWith($pnp, [StringComparison]::OrdinalIgnoreCase) } | Select-Object -First 1
        if ($w) {
            if ($w.Enable) {
                try {
                    $iname = [string]$w.InstanceName
                    $w.Enable = $false
                    $w.Put() | Out-Null
                    AddUndo @{ t = 'wmipwr'; a = $iname; b = ''; old = $true }
                    Ok 'Windows ya no apaga el adaptador para ahorrar energia'
                } catch {
                    Warn 'No se pudo cambiar el ahorro de energia del adaptador'
                }
            } else {
                Say '  Ahorro de energia del adaptador: ya estaba desactivado' 'DarkGray'
            }
        }
    }

    if ($nicChanged -gt 0) {
        try {
            Restart-NetAdapter -Name $nn -ErrorAction Stop
            Say '  Adaptador reiniciado para aplicar los cambios (corte de 2 a 5 s)' 'DarkGray'
        } catch {
            Warn 'No se pudo reiniciar el adaptador: los cambios se aplicaran al reiniciar el PC'
        }
    }
}

# ------------------------------------------------------------------
Head 'Trafico en segundo plano que satura la subida'
if ($cfgDo -eq 1) {
    RegStep 'Delivery Optimization sin P2P (Windows deja de subir actualizaciones a otros PCs)' 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' 'DODownloadMode' 0 'DWord'
} else {
    Say '  (desactivado)'
}

# ------------------------------------------------------------------
Head 'Fortnite: prioridad de red (DSCP 46 en su trafico UDP)'
if ($cfgQos -eq 1) {
    $qn = 'BOSS-Fortnite-DSCP46'
    $qpath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\QoS\' + $qn
    if (Test-Path -LiteralPath $qpath) {
        Say '  La politica ya existe' 'DarkGray'
    } else {
        try {
            New-NetQosPolicy -Name $qn -AppPathNameMatchCondition 'FortniteClient-Win64-Shipping.exe' -IPProtocolMatchCondition UDP -DSCPAction 46 -NetworkProfile All -ErrorAction Stop | Out-Null
            AddUndo @{ t = 'qos'; a = $qn; b = '' }
            if (Test-Path -LiteralPath $qpath) {
                Ok 'Politica QoS creada y persistente'
            } else {
                Warn 'Politica QoS creada pero no persistente: puede perderse al reiniciar'
            }
        } catch {
            Warn 'No se pudo crear la politica QoS'
        }
    }
    RegStep 'QoS tambien en redes sin dominio (Do not use NLA)' 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\QoS' 'Do not use NLA' '1' 'String'
    Say '  Solo marca los paquetes de salida: ayuda si tu router o tu Wi-Fi respetan DSCP y no hace dano si lo ignoran.' 'DarkGray'
} else {
    Say '  (desactivado)'
}

ipconfig /flushdns | Out-Null

# ------------------------------------------------------------------
Head 'Guardando el estado para poder deshacer'
try {
    New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
    if ($global:undo.Count -gt 0) {
        $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
        [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
    }
    $self = $env:BOSS_SELF
    $dst = Join-Path $dataDir 'BOSSTWK.bat'
    if ($self -and ($self -ne $dst)) { Copy-Item -LiteralPath $self -Destination $dst -Force }
    $launcher = Join-Path ((Join-Path $env:ProgramData 'BOSS')) 'BOSS_Red_RESTAURAR.bat'
    $lines = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" restore net')
    [IO.File]::WriteAllText($launcher, (($lines -join "`r`n") + "`r`n"), (New-Object System.Text.ASCIIEncoding))
    Ok 'Estado guardado: usa COMPROBAR y RESTAURAR del menu de BOSSTWK'
} catch {
    Warn 'No se pudo guardar el estado de restauracion'
}

# ------------------------------------------------------------------
Head 'Verificacion: la red tiene que seguir funcionando'
$alive = $false
for ($t = 0; $t -lt 15; $t++) {
    if ($ad) {
        $curAd = Get-NetAdapter -Name $ad.Name -ErrorAction SilentlyContinue
        if ($curAd -and ([string]$curAd.Status -ne 'Up')) {
            Start-Sleep -Seconds 2
            continue
        }
    }
    if ((InternetOk) -and ((-not $dnsBase) -or (DnsOk))) {
        $alive = $true
        break
    }
    Start-Sleep -Seconds 2
}

if ($alive) {
    Ok 'Conexion verificada despues de los cambios'
    ShowStat 'Internet 1.1.1.1' (GetStat (PingSamples '1.1.1.1' 3000 100))
} else {
    Warn 'Se perdio la conexion tras los cambios: restaurando automaticamente'
    $rv = RunRevert $global:runUndo
    $null = RestartNics $global:runUndo
    if ($null -ne $prevJson) {
        [IO.File]::WriteAllText($undoFile, $prevJson, (New-Object System.Text.UTF8Encoding($false)))
    } else {
        Remove-Item -LiteralPath $undoFile -Force -ErrorAction SilentlyContinue
    }
    Start-Sleep -Seconds 5
    if (InternetOk) { Ok ('Cambios revertidos (' + $rv + '). La conexion ha vuelto.') } else { Warn 'Revertido, pero la conexion no responde: reinicia el router y el PC' }
    exit 1
}

# ------------------------------------------------------------------
Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
Say '  Reinicia el PC para completar los ajustes de red.' 'Gray'
Say '==================================================================' 'Green'
Say ''
Say 'Lo que decide el bufferbloat esta en el router, no en el PC:' 'Cyan'
if ($bloatGrade -and ($bloatGrade -ne 'A+') -and ($bloatGrade -ne 'A')) {
    Say ('  Tu nota medida es ' + $bloatGrade + ': activar SQM en el router es lo que mas va a mejorar el ping bajo carga.') 'Yellow'
}
Say '  - Router: activa SQM / Smart Queue (CAKE o fq_codel) o el QoS inteligente que tenga.' 'Gray'
Say '    Limita bajada y subida al 90-95 por ciento de tu velocidad real medida.' 'Gray'
Say '  - Mide con waveform.com/tools/bufferbloat y repite despues de cada cambio.' 'Gray'
Say '  - Fortnite, Ajustes, Game UI, HUD: activa Net Debug Stat y vigila perdida de paquetes y ping.' 'Gray'
Say '  - Fortnite, Ajustes, Juego, Idioma y region: Matchmaking Region en Auto o la de menor latencia.' 'Gray'
Say '  - Solo si ves perdida de paquetes: Epic Games Launcher, Ajustes, Fortnite, argumentos: -limitclientticks' 'Gray'
Say '  - Usa cable: en Wi-Fi manda el jitter, no los ajustes del PC.' 'Gray'
#PS_MODULE:AFF:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0
$mode = $env:BOSS_MODE
if (-not $mode) { $mode = 'apply' }

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

$cfgRestore = Flag 'RESTORE_POINT' 1
$cfgAff     = Flag 'AFFINITY' 1
$cfgRss     = Flag 'RSS_NIC' 1
$cfgMsi     = Flag 'FORCE_MSI' 1
$cfgTimer   = Flag 'TIMER_RES' 1
$cfgPaging  = Flag 'PAGING_EXEC' 1
$cfgWifi    = Flag 'DISABLE_UNUSED_WIFI' 0
$cfgSecs    = Flag 'CHECK_SECONDS' 15

$dataDir  = Join-Path $env:ProgramData 'BOSS'
$undoFile = Join-Path $dataDir 'aff_undo.json'
$baseFile = Join-Path $dataDir 'aff_baseline.txt'
$holderExe = Join-Path $dataDir 'BossTimerHolder.exe'
$taskName = 'BOSS_TimerResolution'
$global:undo = New-Object System.Collections.ArrayList
$global:ids = @{}

# ---------------------- API nativa: topologia y timer ----------------------
$apiOk = $true
try {
    Add-Type -ErrorAction Stop -TypeDefinition @'
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;

public static class BossTopo {
    [DllImport("kernel32.dll", SetLastError = true)]
    static extern bool GetLogicalProcessorInformationEx(int relationship, IntPtr buffer, ref int returnedLength);

    public static string Dump() {
        int len = 0;
        GetLogicalProcessorInformationEx(0xFFFF, IntPtr.Zero, ref len);
        if (len <= 0) return "ERR";
        IntPtr buf = Marshal.AllocHGlobal(len);
        try {
            if (!GetLogicalProcessorInformationEx(0xFFFF, buf, ref len)) return "ERR";
            StringBuilder sb = new StringBuilder();
            int off = 0;
            while (off < len) {
                int rel = Marshal.ReadInt32(buf, off);
                int size = Marshal.ReadInt32(buf, off + 4);
                if (size <= 0) break;
                if (rel == 0) {
                    byte flags = Marshal.ReadByte(buf, off + 8);
                    byte eff = Marshal.ReadByte(buf, off + 9);
                    short groupCount = Marshal.ReadInt16(buf, off + 8 + 22);
                    long mask = Marshal.ReadInt64(buf, off + 8 + 24);
                    short group = Marshal.ReadInt16(buf, off + 8 + 24 + 8);
                    sb.AppendLine("CORE," + mask.ToString("X") + "," + eff + "," + (flags & 1) + "," + group + "," + groupCount);
                } else if (rel == 2) {
                    byte level = Marshal.ReadByte(buf, off + 8);
                    int cacheSize = Marshal.ReadInt32(buf, off + 8 + 4);
                    long mask = Marshal.ReadInt64(buf, off + 8 + 32);
                    sb.AppendLine("CACHE," + level + "," + cacheSize + ",0," + mask.ToString("X"));
                }
                off += size;
            }
            return sb.ToString();
        } finally {
            Marshal.FreeHGlobal(buf);
        }
    }
}

public static class BossTime {
    [DllImport("ntdll.dll")]
    public static extern int NtQueryTimerResolution(out uint min, out uint max, out uint cur);
    [DllImport("ntdll.dll")]
    public static extern int NtSetTimerResolution(uint desired, bool set, out uint cur);

    public static double[] MeasureSleep1(int samples) {
        double[] r = new double[samples];
        double f = 1000.0 / Stopwatch.Frequency;
        for (int i = 0; i < samples; i++) {
            long t0 = Stopwatch.GetTimestamp();
            Thread.Sleep(1);
            r[i] = (Stopwatch.GetTimestamp() - t0) * f;
        }
        return r;
    }
}
'@
} catch {
    $apiOk = $false
}

# ---------------------- Registro de cambios (deshacer) ----------------------
function UndoId($r) { return ([string]$r.t + '|' + [string]$r.a + '|' + [string]$r.b) }

function LoadUndo {
    if (Test-Path -LiteralPath $undoFile) {
        try {
            $raw = [IO.File]::ReadAllText($undoFile)
            $obj = $raw | ConvertFrom-Json
            foreach ($o in @($obj)) {
                [void]$global:undo.Add($o)
                $global:ids[(UndoId $o)] = $true
            }
        } catch { }
    }
}

function AddUndo($rec) {
    $id = UndoId $rec
    if (-not $global:ids.ContainsKey($id)) {
        [void]$global:undo.Add($rec)
        $global:ids[$id] = $true
    }
}

function SetReg($path, $name, $value, $type) {
    try {
        if (-not (Test-Path -LiteralPath $path)) { New-Item -Path $path -Force -ErrorAction Stop | Out-Null }
        New-ItemProperty -LiteralPath $path -Name $name -Value $value -PropertyType $type -Force -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

function RegQuiet($path, $name, $value, $type) {
    $rec = @{ t = 'reg'; a = $path; b = $name; old = $null; x = $false; y = $type }
    try {
        if (Test-Path -LiteralPath $path) {
            $key = Get-Item -LiteralPath $path -ErrorAction Stop
            $cur = $key.GetValue($name, $null)
            if ($null -ne $cur) {
                $rec.x = $true
                $rec.old = $cur
                $rec.y = [string]$key.GetValueKind($name)
                if (($cur -is [byte[]]) -or ($value -is [byte[]])) {
                    if (($cur -join ',') -eq ($value -join ',')) { return 'same' }
                } elseif ([string]$cur -eq [string]$value) {
                    return 'same'
                }
            }
        }
    } catch { }
    if (SetReg $path $name $value $type) {
        AddUndo $rec
        return 'changed'
    }
    return 'fail'
}

function RevertOne($r) {
    switch ([string]$r.t) {
        'reg' {
            if ($r.x) {
                if ([string]$r.y -eq 'DWord') { return (SetReg $r.a $r.b ([int]$r.old) 'DWord') }
                if ([string]$r.y -eq 'Binary') { return (SetReg $r.a $r.b ([byte[]]@($r.old)) 'Binary') }
                return (SetReg $r.a $r.b ([string]$r.old) 'String')
            }
            Remove-ItemProperty -LiteralPath $r.a -Name $r.b -ErrorAction SilentlyContinue
            return $true
        }
        'rss' {
            try {
                $p = ([string]$r.old).Split(',')
                Set-NetAdapterRss -Name ([string]$r.a) -BaseProcessorNumber ([int]$p[0]) -MaxProcessors ([int]$p[1]) -MaxProcessorNumber ([int]$p[2]) -NumberOfReceiveQueues ([int]$p[3]) -Profile ([string]$p[4]) -ErrorAction Stop
                return $true
            } catch { return $false }
        }
        'timer' {
            try {
                Stop-ScheduledTask -TaskName ([string]$r.a) -ErrorAction SilentlyContinue
                Unregister-ScheduledTask -TaskName ([string]$r.a) -Confirm:$false -ErrorAction SilentlyContinue
                Stop-Process -Name 'BossTimerHolder' -Force -ErrorAction SilentlyContinue
                Start-Sleep -Milliseconds 300
                Remove-Item -LiteralPath ([string]$r.b) -Force -ErrorAction SilentlyContinue
                return $true
            } catch { return $false }
        }
        'nicoff' {
            try {
                Enable-NetAdapter -Name ([string]$r.a) -Confirm:$false -ErrorAction Stop
                return $true
            } catch { return $false }
        }
    }
    return $false
}

function RunRevert($list) {
    $arr = @($list)
    [array]::Reverse($arr)
    $n = 0
    foreach ($r in $arr) {
        if (RevertOne $r) { $n++ }
    }
    return $n
}

# ---------------------- Utilidades de lectura ----------------------
function PingOnce($target, $timeout) {
    try {
        $p = New-Object System.Net.NetworkInformation.Ping
        $r = $p.Send($target, $timeout)
        if ($r.Status -eq 'Success') { return [double]$r.RoundtripTime }
    } catch { }
    return $null
}

function InternetOk {
    if ($null -ne (PingOnce '1.1.1.1' 1200)) { return $true }
    if ($null -ne (PingOnce '8.8.8.8' 1200)) { return $true }
    return $false
}

function LowBit($m) {
    for ($i = 0; $i -lt 64; $i++) {
        if (($m -band ([UInt64]1 -shl $i)) -ne 0) { return $i }
    }
    return -1
}

function BitList($m) {
    $out = @()
    for ($i = 0; $i -lt 64; $i++) {
        if (($m -band ([UInt64]1 -shl $i)) -ne 0) { $out += $i }
    }
    return $out
}

function GetParentId($id) {
    $p = Get-PnpDeviceProperty -InstanceId $id -KeyName 'DEVPKEY_Device_Parent' -ErrorAction SilentlyContinue
    if ($p -and $p.Data) { return [string]$p.Data }
    return $null
}

function FindPciAncestor($id) {
    $cur = $id
    for ($i = 0; $i -lt 12; $i++) {
        if ($cur -like 'PCI\*') { return $cur }
        $cur = GetParentId $cur
        if (-not $cur) { return $null }
    }
    return $null
}

function GetIrqKind($id) {
    try {
        $esc = $id.Replace('\', '\\')
        $res = @(Get-CimInstance -Query ("ASSOCIATORS OF {Win32_PnPEntity.DeviceID='" + $esc + "'} WHERE ResultClass=Win32_IRQResource") -ErrorAction Stop)
        if ($res.Count -eq 0) { return 'sin IRQ' }
        $msi = 0
        $leg = 0
        foreach ($q in $res) {
            if ([uint32]$q.IRQNumber -ge 2147483648) { $msi++ } else { $leg++ }
        }
        if (($msi -gt 0) -and ($leg -eq 0)) { return 'MSI' }
        if (($leg -gt 0) -and ($msi -eq 0)) { return 'LEGACY' }
        return 'mixto'
    } catch {
        return '?'
    }
}

function GetPolicy($id) {
    $p = 'HKLM:\SYSTEM\CurrentControlSet\Enum\' + $id + '\Device Parameters\Interrupt Management\Affinity Policy'
    $k = Get-Item -LiteralPath $p -ErrorAction SilentlyContinue
    if (-not $k) { return $null }
    $pol = $k.GetValue('DevicePolicy', $null)
    $mv = $k.GetValue('AssignmentSetOverride', $null)
    $mask = $null
    if ($mv -is [byte[]]) {
        $b = New-Object byte[] 8
        for ($i = 0; ($i -lt 8) -and ($i -lt $mv.Length); $i++) { $b[$i] = $mv[$i] }
        $mask = [BitConverter]::ToUInt64($b, 0)
    } elseif ($null -ne $mv) {
        $mask = [UInt64]$mv
    }
    return [pscustomobject]@{ Policy = $pol; Mask = $mask }
}

function SetAffinity($id, $cpu) {
    $p = 'HKLM:\SYSTEM\CurrentControlSet\Enum\' + $id + '\Device Parameters\Interrupt Management\Affinity Policy'
    $mask = ([UInt64]1 -shl $cpu)
    $bytes = [BitConverter]::GetBytes($mask)
    $r1 = RegQuiet $p 'DevicePolicy' 4 'DWord'
    $r2 = RegQuiet $p 'AssignmentSetOverride' $bytes 'Binary'
    if (($r1 -eq 'fail') -or ($r2 -eq 'fail')) { return 'fail' }
    if (($r1 -eq 'same') -and ($r2 -eq 'same')) { return 'same' }
    return 'changed'
}

function EnsureMsi($id, $label) {
    $kind = GetIrqKind $id
    if ($kind -eq 'MSI') {
        Say ('  ' + $label + ': ya usa MSI') 'DarkGray'
        return
    }
    if ($kind -ne 'LEGACY') {
        Say ('  ' + $label + ': modo de interrupcion ' + $kind + ' (no se toca)') 'DarkGray'
        return
    }
    $p = 'HKLM:\SYSTEM\CurrentControlSet\Enum\' + $id + '\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties'
    $r = RegQuiet $p 'MSISupported' 1 'DWord'
    if ($r -eq 'changed') { Ok ($label + ': estaba en modo legacy, MSI activado (necesita reiniciar)') } elseif ($r -eq 'same') { Say ('  ' + $label + ': MSISupported ya estaba en 1') 'DarkGray' } else { Warn ($label + ': no se pudo activar MSI') }
}

function GetStats($arr) {
    $n = $arr.Count
    $sum = 0.0
    foreach ($v in $arr) { $sum += $v }
    $avg = $sum / $n
    $sq = 0.0
    foreach ($v in $arr) { $sq += ($v - $avg) * ($v - $avg) }
    $sd = [Math]::Sqrt($sq / $n)
    $sorted = [double[]]$arr.Clone()
    [Array]::Sort($sorted)
    $p99 = $sorted[[Math]::Min($n - 1, [int][Math]::Floor($n * 0.99))]
    return [pscustomobject]@{ Avg = $avg; Sd = $sd; P99 = $p99; Max = $sorted[$n - 1] }
}

function FmtStats($s) {
    return ('media {0:N3} ms | desv {1:N3} | p99 {2:N2} | max {3:N2}' -f $s.Avg, $s.Sd, $s.P99, $s.Max)
}

function SampleCpu($secs) {
    $acc = @{}
    for ($i = 0; $i -lt ($secs + 1); $i++) {
        $rows = @(Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation -ErrorAction SilentlyContinue | Where-Object { [string]$_.Name -match '^\d+,\d+$' })
        if ($i -gt 0) {
            foreach ($r in $rows) {
                $k = [int]($r.Name.Split(',')[1])
                if (-not $acc.ContainsKey($k)) { $acc[$k] = @{ n = 0; pint = 0.0; pdpc = 0.0; ips = 0.0 } }
                $acc[$k].n++
                $acc[$k].pint += [double]$r.PercentInterruptTime
                $acc[$k].pdpc += [double]$r.PercentDPCTime
                $acc[$k].ips += [double]$r.InterruptsPersec
            }
        }
        Start-Sleep -Seconds 1
    }
    return $acc
}

function FormatCpuTable($acc) {
    $lines = @()
    foreach ($k in ($acc.Keys | Sort-Object)) {
        $n = [Math]::Max(1, $acc[$k].n)
        $lines += ('  CPU {0,2}   interrupciones/s {1,7:N0}   %int {2,5:N2}   %dpc {3,5:N2}' -f $k, ($acc[$k].ips / $n), ($acc[$k].pint / $n), ($acc[$k].pdpc / $n))
    }
    return $lines
}

# ====================== MODO RESTAURAR ======================
if ($mode -eq 'restore') {
    Head 'Restaurar los valores originales'
    if (-not (Test-Path -LiteralPath $undoFile)) {
        Warn 'No hay ningun estado guardado para restaurar'
        exit 0
    }
    $items = @([IO.File]::ReadAllText($undoFile) | ConvertFrom-Json)
    $done = RunRevert $items
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    Move-Item -LiteralPath $undoFile -Destination (Join-Path $dataDir ('aff_undo_restaurado_' + $stamp + '.json')) -Force
    Ok ('Cambios revertidos: ' + $done + ' de ' + $items.Count)
    Say ''
    Say '  Reinicia el PC para que Windows vuelva a repartir las interrupciones por defecto.' 'Gray'
    exit 0
}

# ====================== LECTURA DEL SISTEMA ======================
Head 'Tu CPU: topologia real'
$cpuInfo = Get-CimInstance Win32_Processor -ErrorAction SilentlyContinue | Select-Object -First 1
Say ('  ' + $cpuInfo.Name)
$topoRaw = ''
if ($apiOk) { $topoRaw = [BossTopo]::Dump() }
$cores = @()
$l3 = @()
foreach ($line in ($topoRaw -split "`n")) {
    $p = $line.Trim().Split(',')
    if ($p[0] -eq 'CORE') {
        $mk = [Convert]::ToUInt64($p[1], 16)
        $cores += [pscustomobject]@{ Mask = $mk; Eff = [int]$p[2]; Smt = ([int]$p[3] -eq 1); Group = [int]$p[4]; First = (LowBit $mk) }
    } elseif (($p[0] -eq 'CACHE') -and ([int]$p[1] -eq 3)) {
        $l3 += [pscustomobject]@{ SizeMB = [Math]::Round([int64]$p[2] / 1MB, 0); Mask = [Convert]::ToUInt64($p[4], 16) }
    }
}
$canPin = $true
$why = ''
if ($cores.Count -eq 0) {
    $canPin = $false
    $why = 'no se pudo leer la topologia'
}
$pool = @()
$hybrid = $false
if ($cores.Count -gt 0) {
    $maxEff = ($cores | Measure-Object -Property Eff -Maximum).Maximum
    $minEff = ($cores | Measure-Object -Property Eff -Minimum).Minimum
    $hybrid = ($maxEff -ne $minEff)
    $pool = @($cores | Where-Object { $_.Eff -eq $maxEff } | Sort-Object First)
    $nGroups = @($cores | Select-Object -ExpandProperty Group -Unique).Count
    $logical = 0
    foreach ($c in $cores) { $logical += (BitList $c.Mask).Count }
    $smtTxt = 'sin SMT'
    if (@($cores | Where-Object { $_.Smt }).Count -gt 0) { $smtTxt = 'con SMT' }
    Say ('  ' + $cores.Count + ' nucleos / ' + $logical + ' hilos (' + $smtTxt + ')' + $(if ($hybrid) { ', hibrido: se usan solo los nucleos rapidos' } else { '' }))
    foreach ($x in $l3) { Say ('  Cache L3: ' + $x.SizeMB + ' MB compartida por CPU ' + ((BitList $x.Mask) -join ',')) 'DarkGray' }
    if ($nGroups -gt 1) {
        $canPin = $false
        $why = 'mas de 64 procesadores logicos (varios grupos)'
    } elseif ($l3.Count -gt 1) {
        $canPin = $false
        $why = 'varios dominios de cache L3 (CPU de 2 CCD): el driver de V-Cache y el planificador gestionan los nucleos'
    } elseif ($pool.Count -lt 6) {
        $canPin = $false
        $why = 'menos de 6 nucleos utiles: no compensa dedicar nucleos'
    }
}

$cOs = $null
$cGpu = $null
$cUsb = $null
$cNic = $null
if ($canPin) {
    $cOs = $pool[0]
    $cGpu = $pool[1]
    $cUsb = $pool[2]
    $cNic = $pool[3]
    Say '  Plan de reparto (primer hilo de cada nucleo, el hermano SMT queda libre):' 'Gray'
    Say ('    Nucleo 0 = CPU ' + $cOs.First + '   sistema y audio') 'DarkGray'
    Say ('    Nucleo 1 = CPU ' + $cGpu.First + '   interrupciones de la GPU') 'DarkGray'
    Say ('    Nucleo 2 = CPU ' + $cUsb.First + '   USB de teclado, raton y mando') 'DarkGray'
    Say ('    Nucleo 3 = CPU ' + $cNic.First + '   red (RSS)') 'DarkGray'
    Say ('    Nucleos 4 a ' + ($pool.Count - 1) + '   limpios para el juego') 'DarkGray'
} else {
    Warn ('No se fijan afinidades: ' + $why)
}

# ------------------------------------------------------------------
Head 'Componentes del sistema con interrupciones'
$pci = @(Get-PnpDevice -PresentOnly -ErrorAction SilentlyContinue | Where-Object { [string]$_.InstanceId -like 'PCI\*' })
$gpuDevs = @()
$usbCtrls = @()
$audioDevs = @()
foreach ($d in $pci) {
    $cls = [string]$d.Class
    $nm = [string]$d.FriendlyName
    $id = [string]$d.InstanceId
    $kind = ''
    if ($cls -eq 'Display') {
        $kind = 'GPU'
        $disc = $false
        if ($id -match 'VEN_10DE') { $disc = $true } elseif (($id -match 'VEN_1002') -and ($nm -match 'RX|PRO W|Radeon VII')) { $disc = $true } elseif (($id -match 'VEN_8086') -and ($nm -match 'Arc')) { $disc = $true }
        if ($disc) { $gpuDevs += $d }
    } elseif ($cls -eq 'Net') {
        $kind = 'Red'
    } elseif (($cls -eq 'USB') -and ($nm -match 'xHCI|Host Controller|eXtensible')) {
        $kind = 'USB'
        $usbCtrls += $d
    } elseif ($cls -eq 'MEDIA') {
        $kind = 'Audio'
        $audioDevs += $d
    } elseif (($cls -eq 'SCSIAdapter') -or ($cls -eq 'HDC')) {
        $kind = 'Almacenamiento'
    }
    if ($kind) {
        $irq = GetIrqKind $id
        $pol = GetPolicy $id
        $polTxt = 'por defecto'
        if ($pol -and ($null -ne $pol.Policy) -and ([int]$pol.Policy -ne 0)) {
            $polTxt = 'politica ' + $pol.Policy
            if ($null -ne $pol.Mask) { $polTxt += ' CPU ' + ((BitList ([UInt64]$pol.Mask)) -join ',') }
        }
        Say ('  {0,-14} {1,-6} {2}   [{3}]' -f $kind, $irq, $nm, $polTxt)
    }
}
$gpuVen = @()
foreach ($g in $gpuDevs) { if ([string]$g.InstanceId -match 'VEN_([0-9A-F]{4})') { $gpuVen += $Matches[1] } }

$inputIds = @()
foreach ($cl in @('Mouse', 'Keyboard')) {
    $inputIds += @(Get-PnpDevice -Class $cl -PresentOnly -ErrorAction SilentlyContinue | ForEach-Object { [string]$_.InstanceId })
}
$inputIds += @(Get-PnpDevice -Class HIDClass -PresentOnly -ErrorAction SilentlyContinue | Where-Object { [string]$_.FriendlyName -match 'game controller|gamepad|joystick|Xbox|DualSense|DualShock|Wireless Controller' } | ForEach-Object { [string]$_.InstanceId })
$inputCtrls = @{}
foreach ($iid in ($inputIds | Select-Object -Unique)) {
    $anc = FindPciAncestor $iid
    if ($anc) { $inputCtrls[$anc] = $true }
}
if ($inputCtrls.Count -gt 0) {
    foreach ($ic in $inputCtrls.Keys) {
        $dn = ($pci | Where-Object { [string]$_.InstanceId -eq $ic } | Select-Object -First 1).FriendlyName
        Say ('  Entrada conectada a: ' + $dn) 'DarkGray'
    }
} else {
    Say '  No se pudo ver a que controlador USB estan conectados tu teclado y tu raton' 'DarkGray'
}

$route = Get-NetRoute -DestinationPrefix '0.0.0.0/0' -ErrorAction SilentlyContinue | Where-Object { $_.NextHop -ne '0.0.0.0' } | Sort-Object RouteMetric | Select-Object -First 1
$ad = $null
if ($route) { $ad = Get-NetAdapter -InterfaceIndex $route.ifIndex -ErrorAction SilentlyContinue }
$isWifi = $false
if ($ad) {
    $isWifi = (([string]$ad.PhysicalMediaType -match '802\.11') -or ([string]$ad.InterfaceDescription -match 'Wi-?Fi|Wireless|802\.11'))
    Say ('  Red en uso: ' + $ad.Name + ' (' + $ad.InterfaceDescription + ')  ' + $ad.LinkSpeed)
}

# ====================== MODO COMPROBAR ======================
if ($mode -eq 'check') {
    Head 'Comprobacion: lo que hay configurado'
    if ($canPin) {
        foreach ($g in $gpuDevs) {
            $pol = GetPolicy ([string]$g.InstanceId)
            $cpus = ''
            if ($pol -and ($null -ne $pol.Mask)) { $cpus = (BitList ([UInt64]$pol.Mask)) -join ',' }
            Say ('  GPU ' + $g.FriendlyName + ': CPU ' + $cpus + '   (esperado ' + $cGpu.First + ')')
        }
        foreach ($ic in $inputCtrls.Keys) {
            $pol = GetPolicy $ic
            $cpus = ''
            if ($pol -and ($null -ne $pol.Mask)) { $cpus = (BitList ([UInt64]$pol.Mask)) -join ',' }
            Say ('  USB de entrada: CPU ' + $cpus + '   (esperado ' + $cUsb.First + ')')
        }
    }
    if ($ad) {
        $rss = Get-NetAdapterRss -Name $ad.Name -ErrorAction SilentlyContinue
        if ($rss) { Say ('  RSS de ' + $ad.Name + ': base ' + $rss.BaseProcessorNumber + ', colas ' + $rss.NumberOfReceiveQueues + ', procesadores ' + (($rss.RssProcessorArray | ForEach-Object { $_.ProcessorNumber }) -join ',')) }
    }

    Head ('Interrupciones y DPC por CPU durante ' + $cfgSecs + ' s (haz algo pesado mientras, por ejemplo Fortnite en segundo plano)')
    $acc = SampleCpu $cfgSecs
    foreach ($l in (FormatCpuTable $acc)) { Say $l }
    if (Test-Path -LiteralPath $baseFile) {
        Say ''
        Say '  Para comparar, el muestreo de antes de aplicar (en reposo):' 'DarkGray'
        foreach ($l in [IO.File]::ReadAllLines($baseFile)) { Say $l 'DarkGray' }
    }

    Head 'Timer: precision de Sleep(1) con y sin el mantenedor'
    if ($apiOk) {
        $mn = [uint32]0
        $mx = [uint32]0
        $cu = [uint32]0
        [void][BossTime]::NtQueryTimerResolution([ref]$mn, [ref]$mx, [ref]$cu)
        Say ('  Resolucion actual del sistema: ' + ($cu / 10000.0) + ' ms   (mejor posible: ' + ($mx / 10000.0) + ' ms)')
        $w = FmtStats (GetStats ([BossTime]::MeasureSleep1(400)))
        Say ('  Con el mantenedor activo:  ' + $w)
        $holder = Get-Process -Name 'BossTimerHolder' -ErrorAction SilentlyContinue
        if ($holder) {
            Stop-Process -Name 'BossTimerHolder' -Force -ErrorAction SilentlyContinue
            Start-Sleep -Milliseconds 1500
            $wo = FmtStats (GetStats ([BossTime]::MeasureSleep1(400)))
            Say ('  Sin el mantenedor:         ' + $wo)
            Start-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
            Say '  Mantenedor reiniciado.' 'DarkGray'
        } else {
            Say '  El mantenedor no esta en ejecucion (cierra sesion y vuelve a entrar o reinicia).' 'DarkGray'
        }
    }
    exit 0
}

# ====================== MODO APLICAR ======================
LoadUndo

if ($cfgRestore -eq 1) {
    Head 'Punto de restauracion de Windows'
    try {
        Enable-ComputerRestore -Drive ($env:SystemDrive + '\') -ErrorAction Stop
        $srKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore'
        $oldFreq = (Get-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue).SystemRestorePointCreationFrequency
        Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value 0 -Type DWord -Force
        Checkpoint-Computer -Description 'BOSS Afinidad (antes de aplicar)' -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
        if ($null -ne $oldFreq) { Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value $oldFreq -Type DWord -Force } else { Remove-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue }
        Ok 'Punto de restauracion creado'
    } catch {
        Warn 'No se pudo crear el punto de restauracion (se sigue: todo queda guardado para deshacer)'
    }
}

Head 'Muestreo de interrupciones antes de cambiar nada (8 s, en reposo)'
New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
$accBefore = SampleCpu 8
$beforeLines = FormatCpuTable $accBefore
foreach ($l in $beforeLines) { Say $l 'DarkGray' }
try { [IO.File]::WriteAllLines($baseFile, [string[]]$beforeLines) } catch { }

# ------------------------------------------------------------------
if ($cfgAff -eq 1) {
    Head 'Afinidad de interrupciones'
    if (-not $canPin) {
        Say ('  Se omite: ' + $why) 'DarkGray'
    } else {
        foreach ($g in $gpuDevs) {
            $r = SetAffinity ([string]$g.InstanceId) $cGpu.First
            if ($r -eq 'fail') { Warn ('GPU ' + $g.FriendlyName + ': no se pudo escribir la politica') } elseif ($r -eq 'same') { Say ('  GPU ' + $g.FriendlyName + ': ya estaba en la CPU ' + $cGpu.First) 'DarkGray' } else { Ok ('GPU ' + $g.FriendlyName + ' -> CPU ' + $cGpu.First) }
        }
        if ($gpuDevs.Count -eq 0) { Say '  No hay GPU dedicada: no se toca la grafica integrada' 'DarkGray' }
        $usbDone = 0
        foreach ($ic in $inputCtrls.Keys) {
            $r = SetAffinity $ic $cUsb.First
            $dn = ($pci | Where-Object { [string]$_.InstanceId -eq $ic } | Select-Object -First 1).FriendlyName
            if ($r -eq 'fail') { Warn ('USB ' + $dn + ': no se pudo escribir la politica') } elseif ($r -eq 'same') { Say ('  USB ' + $dn + ': ya estaba en la CPU ' + $cUsb.First) 'DarkGray' } else { Ok ('USB de entrada ' + $dn + ' -> CPU ' + $cUsb.First); $usbDone++ }
        }
        if ($inputCtrls.Count -eq 0) { Warn 'No se pudo identificar el controlador USB de entrada: se deja por defecto' }
        foreach ($a in $audioDevs) {
            $aid = [string]$a.InstanceId
            $isGpuAudio = $false
            if ($aid -match 'VEN_([0-9A-F]{4})') { if ($gpuVen -contains $Matches[1]) { $isGpuAudio = $true } }
            if ($isGpuAudio) { continue }
            $r = SetAffinity $aid $cOs.First
            if ($r -eq 'changed') { Ok ('Audio ' + $a.FriendlyName + ' -> CPU ' + $cOs.First) } elseif ($r -eq 'fail') { Warn ('Audio ' + $a.FriendlyName + ': no se pudo escribir la politica') }
        }
        Say '  Almacenamiento (NVMe/SATA) y chipset se dejan con el reparto de Windows: tienen una cola por nucleo y fijarlos empeora.' 'DarkGray'
    }
} else {
    Head 'Afinidad de interrupciones'
    Say '  (desactivado)'
}

# ------------------------------------------------------------------
if ($cfgMsi -eq 1) {
    Head 'Modo de interrupcion (MSI) solo donde siga en legacy'
    foreach ($g in $gpuDevs) { EnsureMsi ([string]$g.InstanceId) ('GPU ' + $g.FriendlyName) }
    foreach ($u in $usbCtrls) { EnsureMsi ([string]$u.InstanceId) ('USB ' + $u.FriendlyName) }
    foreach ($a in $audioDevs) { EnsureMsi ([string]$a.InstanceId) ('Audio ' + $a.FriendlyName) }
    if ($ad -and ([string]$ad.PnPDeviceID -like 'PCI\*')) { EnsureMsi ([string]$ad.PnPDeviceID) ('Red ' + $ad.InterfaceDescription) }
}

# ------------------------------------------------------------------
Head 'Red: colas RSS en un nucleo concreto'
if ($cfgRss -ne 1) {
    Say '  (desactivado)'
} elseif (-not $canPin) {
    Say ('  Se omite: ' + $why) 'DarkGray'
} elseif ((-not $ad) -or (-not $ad.HardwareInterface)) {
    Say '  La ruta por defecto no pasa por un adaptador fisico: se omite' 'DarkGray'
} elseif ($isWifi) {
    Say '  Adaptador Wi-Fi: se omite (el cable mejora mas que cualquier ajuste)' 'DarkGray'
} else {
    $nn = $ad.Name
    $rss = Get-NetAdapterRss -Name $nn -ErrorAction SilentlyContinue
    if ((-not $rss) -or (-not $rss.Enabled)) {
        Say '  Esta tarjeta no tiene RSS activo: se omite' 'DarkGray'
    } else {
        $step = 1
        if (@($cores | Where-Object { $_.Smt }).Count -gt 0) { $step = 2 }
        $queues = 1
        if ([uint64]$ad.Speed -ge 2500000000) { $queues = 2 }
        $base = [int]$cNic.First
        $maxn = $base + ($step * ($queues - 1))
        $oldRss = ([string]$rss.BaseProcessorNumber + ',' + [string]$rss.MaxProcessors + ',' + [string]$rss.MaxProcessorNumber + ',' + [string]$rss.NumberOfReceiveQueues + ',' + [string]$rss.Profile)
        if (([int]$rss.BaseProcessorNumber -eq $base) -and ([int]$rss.MaxProcessors -eq $queues)) {
            Say ('  RSS ya estaba en la CPU ' + $base + ' con ' + $queues + ' cola(s)') 'DarkGray'
        } else {
            $preNet = InternetOk
            try {
                Set-NetAdapterRss -Name $nn -BaseProcessorNumber $base -MaxProcessors $queues -MaxProcessorNumber $maxn -NumberOfReceiveQueues $queues -Profile ClosestStatic -ErrorAction Stop
                $rssRec = @{ t = 'rss'; a = $nn; b = ''; old = $oldRss }
                $alive = $false
                for ($t = 0; $t -lt 15; $t++) {
                    $cur = Get-NetAdapter -Name $nn -ErrorAction SilentlyContinue
                    if ($cur -and ([string]$cur.Status -ne 'Up')) {
                        Start-Sleep -Seconds 2
                        continue
                    }
                    if ((-not $preNet) -or (InternetOk)) {
                        $alive = $true
                        break
                    }
                    Start-Sleep -Seconds 2
                }
                if ($alive) {
                    AddUndo $rssRec
                    $after = Get-NetAdapterRss -Name $nn -ErrorAction SilentlyContinue
                    Ok ('RSS de ' + $nn + ' -> base CPU ' + $base + ', ' + $queues + ' cola(s)  (procesadores: ' + (($after.RssProcessorArray | ForEach-Object { $_.ProcessorNumber }) -join ',') + ')')
                } else {
                    Warn 'Se perdio la conexion tras cambiar RSS: restaurando'
                    $null = RevertOne $rssRec
                }
            } catch {
                Warn 'No se pudo cambiar RSS en esta tarjeta'
            }
        }
    }
}

# ------------------------------------------------------------------
if ($cfgTimer -eq 1) {
    Head 'Timer: resolucion calibrada (con medicion real)'
    $gt = RegQuiet 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel' 'GlobalTimerResolutionRequests' 1 'DWord'
    if ($gt -eq 'fail') { Warn 'No se pudo activar GlobalTimerResolutionRequests' } else { Ok 'GlobalTimerResolutionRequests activo (la peticion vale para todo el sistema, tras reiniciar)' }
    $pt = RegQuiet 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' 'PowerThrottlingOff' 1 'DWord'
    if ($pt -eq 'fail') { Warn 'No se pudo desactivar el power throttling' }
    if (-not $apiOk) {
        Warn 'No se pudo cargar la API del timer: se omite la calibracion'
    } else {
        $mn = [uint32]0
        $mx = [uint32]0
        $cu = [uint32]0
        [void][BossTime]::NtQueryTimerResolution([ref]$mn, [ref]$mx, [ref]$cu)
        Say ('  Hardware: mejor resolucion posible ' + ($mx / 10000.0) + ' ms, la de Windows ahora ' + ($cu / 10000.0) + ' ms') 'DarkGray'
        Say '  Calibrando: Sleep(1) con distintas resoluciones (unos 15 s) ...' 'DarkGray'
        $baseS = GetStats ([BossTime]::MeasureSleep1(250))
        $baseScore = $baseS.Avg + (2 * $baseS.Sd)
        Say ('  Sin peticion:  ' + (FmtStats $baseS))
        $bestRes = 0
        $bestScore = [double]::MaxValue
        $bestS = $null
        $lastRes = [int]$mx
        for ($res = [int]$mx; $res -le ([int]$mx + 200); $res += 10) {
            $c2 = [uint32]0
            [void][BossTime]::NtSetTimerResolution([uint32]$res, $true, [ref]$c2)
            $lastRes = $res
            Start-Sleep -Milliseconds 30
            $s = GetStats ([BossTime]::MeasureSleep1(250))
            $score = $s.Avg + (2 * $s.Sd)
            if ($score -lt $bestScore) {
                $bestScore = $score
                $bestRes = $res
                $bestS = $s
            }
        }
        $c3 = [uint32]0
        [void][BossTime]::NtSetTimerResolution([uint32]$lastRes, $false, [ref]$c3)
        Say ('  Mejor:         ' + ($bestRes / 10000.0) + ' ms -> ' + (FmtStats $bestS))
        if ($bestScore -lt ($baseScore * 0.85)) {
            $holderSrc = @'
using System;
using System.Runtime.InteropServices;
using System.Threading;

public static class BossTimerHolder {
    [DllImport("ntdll.dll")]
    static extern int NtQueryTimerResolution(out uint min, out uint max, out uint cur);
    [DllImport("ntdll.dll")]
    static extern int NtSetTimerResolution(uint desired, bool set, out uint cur);

    [StructLayout(LayoutKind.Sequential)]
    struct PROCESS_POWER_THROTTLING_STATE { public uint Version; public uint ControlMask; public uint StateMask; }

    [DllImport("kernel32.dll", SetLastError = true)]
    static extern bool SetProcessInformation(IntPtr hProcess, int infoClass, ref PROCESS_POWER_THROTTLING_STATE info, int size);
    [DllImport("kernel32.dll")]
    static extern IntPtr GetCurrentProcess();

    public static int Main(string[] args) {
        uint want = 5000;
        if (args.Length > 0) {
            uint v;
            if (uint.TryParse(args[0], out v) && v >= 1000 && v <= 20000) want = v;
        }
        try {
            PROCESS_POWER_THROTTLING_STATE s = new PROCESS_POWER_THROTTLING_STATE();
            s.Version = 1;
            s.ControlMask = 0x4;
            s.StateMask = 0;
            SetProcessInformation(GetCurrentProcess(), 4, ref s, 12);
        } catch { }
        uint min, max, cur;
        NtQueryTimerResolution(out min, out max, out cur);
        if (want < max) want = max;
        while (true) {
            NtSetTimerResolution(want, true, out cur);
            Thread.Sleep(60000);
        }
    }
}
'@
            try {
                Stop-Process -Name 'BossTimerHolder' -Force -ErrorAction SilentlyContinue
                Start-Sleep -Milliseconds 300
                Add-Type -TypeDefinition $holderSrc -OutputAssembly $holderExe -OutputType WindowsApplication -ErrorAction Stop
                $who = $env:USERDOMAIN + '\' + $env:USERNAME
                $act = New-ScheduledTaskAction -Execute $holderExe -Argument ([string]$bestRes)
                $trg = New-ScheduledTaskTrigger -AtLogOn -User $who
                $set = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -ExecutionTimeLimit ([TimeSpan]::Zero) -MultipleInstances IgnoreNew
                $prn = New-ScheduledTaskPrincipal -UserId $who -LogonType Interactive -RunLevel Limited
                Register-ScheduledTask -TaskName $taskName -Action $act -Trigger $trg -Settings $set -Principal $prn -Force -ErrorAction Stop | Out-Null
                Start-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
                AddUndo @{ t = 'timer'; a = $taskName; b = $holderExe; old = '' }
                Ok ('Mantenedor del timer instalado a ' + ($bestRes / 10000.0) + ' ms (tarea al iniciar sesion, sin ventana)')
            } catch {
                Warn 'No se pudo instalar el mantenedor del timer'
            }
        } else {
            Say '  La mejora no es clara en tu sistema: no se instala el mantenedor (no hay que forzar nada).' 'DarkGray'
        }
    }
}

# ------------------------------------------------------------------
if ($cfgPaging -eq 1) {
    Head 'Memoria: kernel y drivers siempre en RAM'
    $ramGb = [Math]::Round((Get-CimInstance Win32_ComputerSystem -ErrorAction SilentlyContinue).TotalPhysicalMemory / 1GB, 0)
    if ($ramGb -ge 16) {
        $dp = RegQuiet 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' 'DisablePagingExecutive' 1 'DWord'
        if ($dp -eq 'fail') { Warn 'No se pudo cambiar DisablePagingExecutive' } elseif ($dp -eq 'same') { Say '  Ya estaba activo' 'DarkGray' } else { Ok ('DisablePagingExecutive activado (' + $ramGb + ' GB de RAM)') }
    } else {
        Say ('  Solo con 16 GB o mas de RAM; tienes ' + $ramGb + ' GB: se omite') 'DarkGray'
    }
}

# ------------------------------------------------------------------
Head 'Adaptadores de red que no usas'
$otherWifi = @(Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Where-Object { ([string]$_.Status -eq 'Up') -and ($_.ifIndex -ne $route.ifIndex) -and (([string]$_.PhysicalMediaType -match '802\.11') -or ([string]$_.InterfaceDescription -match 'Wi-?Fi|Wireless')) })
if ($isWifi -or $otherWifi.Count -eq 0) {
    Say '  No hay un Wi-Fi activo sobrante' 'DarkGray'
} elseif ($cfgWifi -eq 1) {
    foreach ($w in $otherWifi) {
        try {
            Disable-NetAdapter -Name $w.Name -Confirm:$false -ErrorAction Stop
            AddUndo @{ t = 'nicoff'; a = [string]$w.Name; b = ''; old = '' }
            Ok ('Wi-Fi desactivado: ' + $w.Name + ' (el Bluetooth no se toca)')
        } catch {
            Warn ('No se pudo desactivar ' + $w.Name)
        }
    }
} else {
    foreach ($w in $otherWifi) { Say ('  Wi-Fi activo sin usar: ' + $w.Name + '. Pon DISABLE_UNUSED_WIFI=1 si quieres quitarle sus interrupciones.') 'DarkGray' }
}

# ------------------------------------------------------------------
Head 'Guardando el estado para poder deshacer'
try {
    if ($global:undo.Count -gt 0) {
        $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
        [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
    }
    $self = $env:BOSS_SELF
    $dst = Join-Path $dataDir 'BOSSTWK.bat'
    if ($self -and ($self -ne $dst)) { Copy-Item -LiteralPath $self -Destination $dst -Force }
    $desk = (Join-Path $env:ProgramData 'BOSS')
    $crlf = "`r`n"
    $l1 = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" restore aff')
    $l2 = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" check aff')
    [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Afinidad_RESTAURAR.bat'), (($l1 -join $crlf) + $crlf), (New-Object System.Text.ASCIIEncoding))
    [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Afinidad_COMPROBAR.bat'), (($l2 -join $crlf) + $crlf), (New-Object System.Text.ASCIIEncoding))
    Ok 'Estado guardado: usa COMPROBAR y RESTAURAR del menu de BOSSTWK'
} catch {
    Warn 'No se pudo guardar el estado de restauracion'
}

# ------------------------------------------------------------------
Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
Say '  REINICIA el PC: las afinidades y MSI solo se aplican al arrancar.' 'Gray'
Say '  Despues ejecuta COMPROBAR del menu de BOSSTWK para ver las interrupciones por CPU y el timer.' 'Gray'
Say '==================================================================' 'Green'
Say ''
Say 'Honestidad sobre el efecto:' 'Cyan'
Say '  - Microsoft recomienda la politica por defecto; esto aisla ruido, no multiplica FPS.' 'Gray'
Say '  - Se nota sobre todo en el jitter y los picos de DPC, no en la media de FPS.' 'Gray'
Say '  - Si algo va peor, RESTAURAR del menu de BOSSTWK y reinicia.' 'Gray'
#PS_MODULE:AUDIO:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0
$mode = $env:BOSS_MODE
if (-not $mode) { $mode = 'apply' }

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

$cfgRestore = Flag 'RESTORE_POINT' 1
$cfgDuck    = Flag 'DUCKING' 1
$cfgMmcss   = Flag 'MMCSS_AUDIO' 1
$cfgPower   = Flag 'AUDIO_POWER' 1
$cfgIni     = Flag 'FORTNITE_INI' 1
$cfgEng     = Flag 'FORTNITE_ENGINE_AUDIO' 1
$cfgFrames  = Flag 'AUDIO_FRAMES' 512
$cfgDsp     = Flag 'DISABLE_AUDIO_DSP' 0
if (($cfgFrames -lt 128) -or ($cfgFrames -gt 2048)) { $cfgFrames = 512 }

$dataDir  = Join-Path $env:ProgramData 'BOSS'
$undoFile = Join-Path $dataDir 'audio_undo.json'
$global:undo = New-Object System.Collections.ArrayList
$global:ids = @{}
$engBegin = '; BOSS-AUDIO-BEGIN'
$engEnd = '; BOSS-AUDIO-END'

# ---------------------- Archivos .ini ----------------------
function ReadIniFile($path) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $bom = (($bytes.Length -ge 2) -and ((($bytes[0] -eq 0xFF) -and ($bytes[1] -eq 0xFE)) -or (($bytes[0] -eq 0xFE) -and ($bytes[1] -eq 0xFF)))) -or (($bytes.Length -ge 3) -and ($bytes[0] -eq 0xEF) -and ($bytes[1] -eq 0xBB) -and ($bytes[2] -eq 0xBF))
    $sr = New-Object System.IO.StreamReader($path, $true)
    $text = $sr.ReadToEnd()
    $enc = $sr.CurrentEncoding
    $sr.Close()
    if (-not $bom) { $enc = New-Object System.Text.UTF8Encoding($false) }
    return [pscustomobject]@{ Text = $text; Enc = $enc }
}

function WriteIniFile($path, $text, $enc) {
    $ro = $false
    if (Test-Path -LiteralPath $path) {
        $ro = (Get-Item -LiteralPath $path).IsReadOnly
        if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $false }
    }
    $okw = $true
    try { [IO.File]::WriteAllText($path, $text, $enc) } catch { $okw = $false }
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $true }
    return $okw
}

function IniGetSet($text, $key, $value) {
    $rx = '(?mi)^(\s*' + [regex]::Escape($key) + '\s*=\s*)(\S+)'
    $m = [regex]::Match($text, $rx)
    if (-not $m.Success) { return $null }
    $old = $m.Groups[2].Value
    $new = [regex]::Replace($text, $rx, ('${1}' + $value))
    return [pscustomobject]@{ Text = $new; Old = $old }
}

# ---------------------- Registro de cambios (deshacer) ----------------------
function UndoId($r) { return ([string]$r.t + '|' + [string]$r.a + '|' + [string]$r.b) }

function LoadUndo {
    if (Test-Path -LiteralPath $undoFile) {
        try {
            $raw = [IO.File]::ReadAllText($undoFile)
            $obj = $raw | ConvertFrom-Json
            foreach ($o in @($obj)) {
                [void]$global:undo.Add($o)
                $global:ids[(UndoId $o)] = $true
            }
        } catch { }
    }
}

function AddUndo($rec) {
    $id = UndoId $rec
    if (-not $global:ids.ContainsKey($id)) {
        [void]$global:undo.Add($rec)
        $global:ids[$id] = $true
    }
}

function SetReg($path, $name, $value, $type) {
    try {
        if (-not (Test-Path -LiteralPath $path)) { New-Item -Path $path -Force -ErrorAction Stop | Out-Null }
        New-ItemProperty -LiteralPath $path -Name $name -Value $value -PropertyType $type -Force -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

function RegQuiet($path, $name, $value, $type) {
    $rec = @{ t = 'reg'; a = $path; b = $name; old = $null; x = $false; y = $type }
    try {
        if (Test-Path -LiteralPath $path) {
            $key = Get-Item -LiteralPath $path -ErrorAction Stop
            $cur = $key.GetValue($name, $null)
            if ($null -ne $cur) {
                $rec.x = $true
                $rec.old = $cur
                $rec.y = [string]$key.GetValueKind($name)
                if (($cur -is [byte[]]) -or ($value -is [byte[]])) {
                    if (($cur -join ',') -eq ($value -join ',')) { return 'same' }
                } elseif ([string]$cur -eq [string]$value) {
                    return 'same'
                }
            }
        }
    } catch { }
    if (SetReg $path $name $value $type) {
        AddUndo $rec
        return 'changed'
    }
    return 'fail'
}

function SvcStep($name, $label) {
    $key = 'HKLM:\SYSTEM\CurrentControlSet\Services\' + $name
    if (-not (Test-Path -LiteralPath $key)) { return }
    $start = (Get-ItemProperty -LiteralPath $key -Name Start -ErrorAction SilentlyContinue).Start
    $delayed = (Get-ItemProperty -LiteralPath $key -Name DelayedAutostart -ErrorAction SilentlyContinue).DelayedAutostart
    if ($null -eq $start) { return }
    if ([int]$start -eq 4) {
        Say ('  ' + $name + ': ya estaba desactivado') 'DarkGray'
        return
    }
    $oldMode = ''
    if ([int]$start -eq 2) {
        if ($delayed -eq 1) { $oldMode = 'delayed-auto' } else { $oldMode = 'auto' }
    } elseif ([int]$start -eq 3) {
        $oldMode = 'demand'
    }
    if (-not $oldMode) {
        Warn ($name + ': tipo de inicio especial, no se toca')
        return
    }
    & sc.exe config $name start= disabled *> $null
    if ($LASTEXITCODE -eq 0) {
        AddUndo @{ t = 'svc'; a = $name; b = ''; old = $oldMode }
        Stop-Service -Name $name -Force -ErrorAction SilentlyContinue
        Ok ($label + ' (' + $name + ' desactivado)')
    } else {
        Warn ($name + ': Windows no permite cambiarlo, se omite')
    }
}

function RemoveEngBlock($text) {
    $rx = '(?s)\r?\n?' + [regex]::Escape($engBegin) + '.*?' + [regex]::Escape($engEnd) + '\r?\n?'
    return [regex]::Replace($text, $rx, '')
}

function RevertOne($r) {
    switch ([string]$r.t) {
        'reg' {
            if ($r.x) {
                if ([string]$r.y -eq 'DWord') { return (SetReg $r.a $r.b ([int]$r.old) 'DWord') }
                if ([string]$r.y -eq 'Binary') { return (SetReg $r.a $r.b ([byte[]]@($r.old)) 'Binary') }
                return (SetReg $r.a $r.b ([string]$r.old) 'String')
            }
            Remove-ItemProperty -LiteralPath $r.a -Name $r.b -ErrorAction SilentlyContinue
            return $true
        }
        'svc' {
            & sc.exe config ([string]$r.a) start= ([string]$r.old) *> $null
            return ($LASTEXITCODE -eq 0)
        }
        'wmipwr' {
            try {
                $w = Get-WmiObject -Namespace 'root\wmi' -Class MSPower_DeviceEnable -ErrorAction Stop | Where-Object { $_.InstanceName -eq [string]$r.a } | Select-Object -First 1
                if ($w) { $w.Enable = [bool]$r.old; $w.Put() | Out-Null }
                return $true
            } catch { return $false }
        }
        'ini' {
            try {
                if (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) { return $false }
                if (-not (Test-Path -LiteralPath ([string]$r.a))) { return $false }
                $ini = ReadIniFile ([string]$r.a)
                $res = IniGetSet $ini.Text ([string]$r.b) ([string]$r.old)
                if ($null -eq $res) { return $false }
                return (WriteIniFile ([string]$r.a) $res.Text $ini.Enc)
            } catch { return $false }
        }
        'engblock' {
            try {
                if (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) { return $false }
                if (-not (Test-Path -LiteralPath ([string]$r.a))) { return $true }
                $f = ReadIniFile ([string]$r.a)
                $clean = RemoveEngBlock $f.Text
                if (([string]$r.old -eq '1') -and ($clean.Trim().Length -eq 0)) {
                    Remove-Item -LiteralPath ([string]$r.a) -Force -ErrorAction SilentlyContinue
                    return $true
                }
                return (WriteIniFile ([string]$r.a) $clean $f.Enc)
            } catch { return $false }
        }
    }
    return $false
}

function RunRevert($list) {
    $arr = @($list)
    [array]::Reverse($arr)
    $n = 0
    foreach ($r in $arr) {
        if (RevertOne $r) { $n++ }
    }
    return $n
}

# ---------------------- Sonda de audio (aislada en un job) ----------------------
$audioSrc = @'
using System;
using System.Runtime.InteropServices;

[ComImport, Guid("BCDE0395-E52F-467C-8E3D-C4579291692E")]
class MMDeviceEnumeratorCom { }

[ComImport, Guid("A95664D2-9614-4F35-A746-DE8DB63617E6"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDeviceEnumerator {
    [PreserveSig] int EnumAudioEndpoints(int dataFlow, int stateMask, out IntPtr devices);
    [PreserveSig] int GetDefaultAudioEndpoint(int dataFlow, int role, out IMMDevice endpoint);
}

[ComImport, Guid("D666063F-1587-4E43-81F1-B948E807363F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDevice {
    [PreserveSig] int Activate(ref Guid iid, int clsCtx, IntPtr activationParams, [MarshalAs(UnmanagedType.IUnknown)] out object iface);
    [PreserveSig] int OpenPropertyStore(int access, out IntPtr props);
    [PreserveSig] int GetId([MarshalAs(UnmanagedType.LPWStr)] out string id);
}

[ComImport, Guid("7ED4EE07-8E67-4CD4-8C1A-2B7A5987AD42"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IAudioClient3 {
    [PreserveSig] int Initialize(int shareMode, int streamFlags, long hnsBufferDuration, long hnsPeriodicity, IntPtr pFormat, IntPtr audioSessionGuid);
    [PreserveSig] int GetBufferSize(out uint bufferFrameCount);
    [PreserveSig] int GetStreamLatency(out long latency);
    [PreserveSig] int GetCurrentPadding(out uint padding);
    [PreserveSig] int IsFormatSupported(int shareMode, IntPtr pFormat, out IntPtr closest);
    [PreserveSig] int GetMixFormat(out IntPtr ppFormat);
    [PreserveSig] int GetDevicePeriod(out long defaultPeriod, out long minimumPeriod);
    [PreserveSig] int Start();
    [PreserveSig] int Stop();
    [PreserveSig] int Reset();
    [PreserveSig] int SetEventHandle(IntPtr h);
    [PreserveSig] int GetService(ref Guid riid, out IntPtr ppv);
    [PreserveSig] int IsOffloadCapable(int category, out int capable);
    [PreserveSig] int SetClientProperties(IntPtr props);
    [PreserveSig] int GetBufferSizeLimits(IntPtr pFormat, int eventDriven, out long minDur, out long maxDur);
    [PreserveSig] int GetSharedModeEnginePeriod(IntPtr pFormat, out uint defaultPeriod, out uint fundamentalPeriod, out uint minPeriod, out uint maxPeriod);
    [PreserveSig] int GetCurrentSharedModeEnginePeriod(out IntPtr ppFormat, out uint currentPeriod);
    [PreserveSig] int InitializeSharedAudioStream(int streamFlags, uint periodInFrames, IntPtr pFormat, IntPtr audioSessionGuid);
}

public static class BossAudio {
    public static string Describe(int flow, int role) {
        try {
            IMMDeviceEnumerator en = (IMMDeviceEnumerator)new MMDeviceEnumeratorCom();
            IMMDevice dev;
            if (en.GetDefaultAudioEndpoint(flow, role, out dev) != 0 || dev == null) return "ERR|sin dispositivo por defecto";
            string id;
            dev.GetId(out id);
            Guid iid3 = new Guid("7ED4EE07-8E67-4CD4-8C1A-2B7A5987AD42");
            object o;
            int hr = dev.Activate(ref iid3, 23, IntPtr.Zero, out o);
            if (hr != 0 || o == null) return "OK|" + id + "|0|0|0|0|0|0|0|" + hr;
            IAudioClient3 ac = (IAudioClient3)o;
            IntPtr pf;
            if (ac.GetMixFormat(out pf) != 0 || pf == IntPtr.Zero) return "OK|" + id + "|0|0|0|0|0|0|0|mix";
            int ch = Marshal.ReadInt16(pf, 2);
            int rate = Marshal.ReadInt32(pf, 4);
            int bits = Marshal.ReadInt16(pf, 14);
            uint d, f, mn, mx;
            int hr2 = ac.GetSharedModeEnginePeriod(pf, out d, out f, out mn, out mx);
            Marshal.FreeCoTaskMem(pf);
            return "OK|" + id + "|" + rate + "|" + bits + "|" + ch + "|" + d + "|" + f + "|" + mn + "|" + mx + "|" + hr2;
        } catch (Exception ex) {
            return "ERR|" + ex.Message;
        }
    }
}
'@

function ProbeAudio {
    $res = @()
    try {
        $job = Start-Job -ScriptBlock {
            param($src)
            Add-Type -TypeDefinition $src
            [BossAudio]::Describe(0, 0)
            [BossAudio]::Describe(1, 0)
        } -ArgumentList $audioSrc
        if (Wait-Job -Job $job -Timeout 45) { $res = @(Receive-Job -Job $job) }
        Remove-Job -Job $job -Force -ErrorAction SilentlyContinue
    } catch { }
    return $res
}

$ffNames = @{ 0 = 'red remota'; 1 = 'altavoces'; 2 = 'linea'; 3 = 'auriculares'; 4 = 'microfono'; 5 = 'auriculares con microfono'; 6 = 'telefono'; 7 = 'digital'; 8 = 'S/PDIF'; 9 = 'pantalla HDMI o DisplayPort'; 10 = 'desconocido' }

function ShowDefault($label, $flowName, $desc) {
    if ((-not $desc) -or (-not ([string]$desc).StartsWith('OK|'))) {
        Say ('  ' + $label + ': no se pudo leer (' + $desc + ')') 'DarkGray'
        return $null
    }
    $p = ([string]$desc).Split('|')
    $guid = ''
    if ($p[1] -match '(\{[0-9a-fA-F\-]{36}\})$') { $guid = $Matches[1] }
    $name = '?'
    $ff = -1
    $sysfx = $null
    if ($guid) {
        $base = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\' + $flowName + '\' + $guid
        $pk = Get-Item -LiteralPath ($base + '\Properties') -ErrorAction SilentlyContinue
        if ($pk) {
            $dsc = [string]$pk.GetValue('{a45c254e-df1c-4efd-8020-67d146a850e0},2', '')
            $adp = [string]$pk.GetValue('{b3f8fa53-0004-438e-9003-51a46e139bfc},6', '')
            $name = $dsc + ' (' + $adp + ')'
            $f = $pk.GetValue('{1da5d803-d492-4edd-8c23-e0c0ffee7f0e},0', $null)
            if ($null -ne $f) { $ff = [int]$f }
        }
        $fx = Get-Item -LiteralPath ($base + '\FxProperties') -ErrorAction SilentlyContinue
        if ($fx) {
            $v = $fx.GetValue('{1da5d803-d492-4edd-8c23-e0c0ffee7f0e},5', $null)
            if ($null -ne $v) { $sysfx = [int]$v }
        }
    }
    $ffTxt = 'tipo no identificado'
    if ($ffNames.ContainsKey($ff)) { $ffTxt = $ffNames[$ff] }
    Say ('  ' + $label + ': ' + $name + '   [' + $ffTxt + ']')
    $rate = [int]$p[2]
    $ch = [int]$p[4]
    if ($rate -gt 0) {
        Say ('    Formato del motor: ' + $rate + ' Hz, ' + $ch + ' canales') 'DarkGray'
        if ($flowName -eq 'Render') {
            if ($rate -ne 48000) { Warn ('Tu dispositivo mezcla a ' + $rate + ' Hz y Fortnite trabaja a 48000 Hz: Windows remuestrea y gasta latencia y CPU. Ponlo en 48000 Hz (ver la lista del final)') } else { Ok 'El dispositivo esta a 48000 Hz, igual que Fortnite: sin remuestreo' }
        }
        $def = [double][uint32]$p[5]
        $mn = [double][uint32]$p[7]
        if ($def -gt 0) {
            $defMs = [Math]::Round(($def * 1000.0) / $rate, 2)
            $minMs = [Math]::Round(($mn * 1000.0) / $rate, 2)
            Say ('    Periodo del motor de Windows: ' + $defMs + ' ms por defecto, ' + $minMs + ' ms como minimo') 'DarkGray'
            if ($mn -lt $def) { Say '    Tu driver admite baja latencia en modo compartido (las apps que lo piden bajan a ese minimo).' 'DarkGray' } else { Say '    Tu driver no ofrece un periodo menor en modo compartido.' 'DarkGray' }
        }
    }
    if ($null -ne $sysfx) {
        if ($sysfx -eq 1) { Ok 'Mejoras de audio (efectos del driver) desactivadas en este dispositivo' } else { Warn 'Las mejoras de audio estan activas en este dispositivo: anaden procesado y latencia (ver la lista del final)' }
    } else {
        Say '    Mejoras de audio: no se pudo determinar (miralo en Sonido, Propiedades, Mejoras)' 'DarkGray'
    }
    if ($name -match 'Bluetooth|Hands-?Free|BT ') { Warn 'Es un dispositivo Bluetooth: anade de 100 a 250 ms. Para jugar usa cable o un receptor 2,4 GHz' }
    return [pscustomobject]@{ Name = $name; FormFactor = $ff; Rate = $rate }
}

function AudioReport {
    Head 'Audio: dispositivos y driver'
    $eps = @(Get-PnpDevice -Class AudioEndpoint -PresentOnly -ErrorAction SilentlyContinue)
    foreach ($e in $eps) { Say ('  Dispositivo: ' + $e.FriendlyName + '   (' + $e.Status + ')') 'DarkGray' }
    $drv = @(Get-CimInstance Win32_PnPSignedDriver -ErrorAction SilentlyContinue | Where-Object { [string]$_.DeviceClass -eq 'MEDIA' -and [string]$_.DeviceName })
    foreach ($d in $drv) {
        $dd = ''
        if ($d.DriverDate) { $dd = ([datetime]$d.DriverDate).ToString('yyyy-MM-dd') }
        Say ('  Driver: ' + $d.DeviceName + ' | ' + $d.DriverProviderName + ' ' + $d.DriverVersion + ' | ' + $dd) 'DarkGray'
        if ([string]$d.DriverProviderName -eq 'Microsoft') { Say '    Es el driver generico de Windows: si hay problemas de sonido, usa el de tu placa o fabricante.' 'DarkGray' }
    }
    $svcOk = $true
    foreach ($sn in @('Audiosrv', 'AudioEndpointBuilder')) {
        $sv = Get-Service -Name $sn -ErrorAction SilentlyContinue
        if ((-not $sv) -or ([string]$sv.Status -ne 'Running')) { $svcOk = $false; Warn ('El servicio ' + $sn + ' no esta en ejecucion') }
    }
    if ($svcOk) { Ok 'Servicios de audio de Windows en ejecucion' }

    Head 'Audio: dispositivo por defecto (lectura real del motor de audio)'
    $probe = @(ProbeAudio)
    $out = $null
    if ($probe.Count -ge 1) { $out = ShowDefault 'Salida por defecto' 'Render' $probe[0] } else { Say '  No se pudo consultar el motor de audio' 'DarkGray' }
    if ($probe.Count -ge 2) { $null = ShowDefault 'Entrada por defecto' 'Capture' $probe[1] }

    Head 'Software de efectos de audio instalado'
    $dspRx = 'Nahimic|A-Volute|SonicStudio|Sonic Studio|SonicSuite|DolbyDAX|Dolby Access|MaxxAudio|WavesSys|DtsApo|DTS Sound|Voicemeeter|SteelSeries Sonar'
    $dsp = @(Get-Service -ErrorAction SilentlyContinue | Where-Object { ($_.Name -match $dspRx) -or ($_.DisplayName -match $dspRx) })
    $dspProc = @(Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.ProcessName -match $dspRx })
    if (Test-Path -LiteralPath 'HKLM:\SOFTWARE\EqualizerAPO') { Say '  Equalizer APO instalado (procesa el audio de todo el sistema)' 'DarkGray' }
    if (($dsp.Count -eq 0) -and ($dspProc.Count -eq 0)) {
        Ok 'No hay servicios de efectos de terceros en el camino del audio'
    } else {
        foreach ($s in $dsp) { Warn ('Servicio de efectos: ' + $s.DisplayName + ' (' + $s.Name + ', ' + $s.Status + '): mete procesado y latencia. Desactivalo si no lo necesitas.') }
        foreach ($pr in $dspProc) { Say ('  Proceso de efectos en ejecucion: ' + $pr.ProcessName) 'DarkGray' }
    }
    return $out
}

function ShowFortniteAudioKeys($ini) {
    $file = ReadIniFile $ini
    $found = @()
    foreach ($line in ($file.Text -split "`n")) {
        $t = $line.Trim()
        if ($t -match '^([^\s=\[;]+)\s*=\s*(.*)$') {
            $kName = $Matches[1]
            $kVal = $Matches[2]
            if ($kName -match '(?i)audio|volume|headphone|sound|voice|music|sfx|mute|speaker|output') { $found += ($kName + ' = ' + $kVal) }
        }
    }
    return $found
}

# ====================== MODO RESTAURAR ======================
if ($mode -eq 'restore') {
    Head 'Restaurar los valores originales de audio'
    if (-not (Test-Path -LiteralPath $undoFile)) {
        Warn 'No hay ningun estado guardado para restaurar'
        exit 0
    }
    $items = @([IO.File]::ReadAllText($undoFile) | ConvertFrom-Json)
    $done = RunRevert $items
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    Move-Item -LiteralPath $undoFile -Destination (Join-Path $dataDir ('audio_undo_restaurado_' + $stamp + '.json')) -Force
    Ok ('Cambios revertidos: ' + $done + ' de ' + $items.Count)
    if ($done -lt $items.Count) { Say '  Si faltan, suele ser Fortnite abierto: cierralo y vuelve a restaurar.' 'DarkGray' }
    Say ''
    Say '  Reinicia el PC para completar la restauracion.' 'Gray'
    exit 0
}

# ====================== MODO COMPROBAR ======================
if ($mode -eq 'check') {
    $outInfo = AudioReport
    Head 'Estado de los ajustes de este modulo'
    $du = (Get-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Multimedia\Audio' -Name UserDuckingPreference -ErrorAction SilentlyContinue).UserDuckingPreference
    if ($du -eq 3) { Ok 'Ducking de comunicaciones: no hacer nada' } else { Say '  Ducking de comunicaciones: valor por defecto de Windows' 'DarkGray' }
    $tk = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio'
    Say ('  MMCSS Audio: categoria ' + (Get-ItemProperty -LiteralPath $tk -ErrorAction SilentlyContinue).'Scheduling Category' + ', SFIO ' + (Get-ItemProperty -LiteralPath $tk -ErrorAction SilentlyContinue).'SFIO Priority') 'DarkGray'
    $eng = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\Engine.ini'
    if (Test-Path -LiteralPath $eng) {
        $ef = ReadIniFile $eng
        if ($ef.Text.Contains($engBegin)) { Ok 'Bloque de audio presente en el Engine.ini de Fortnite' } else { Say '  Engine.ini existe pero sin el bloque de audio de este modulo' 'DarkGray' }
    } else {
        Say '  No hay Engine.ini de Fortnite' 'DarkGray'
    }
    $ini = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'
    if (Test-Path -LiteralPath $ini) {
        Say '  Claves de audio en GameUserSettings.ini:' 'DarkGray'
        foreach ($l in (ShowFortniteAudioKeys $ini)) { Say ('    ' + $l) 'DarkGray' }
    }
    exit 0
}

# ====================== MODO APLICAR ======================
LoadUndo
New-Item -ItemType Directory -Path $dataDir -Force | Out-Null

if ($cfgRestore -eq 1) {
    Head 'Punto de restauracion de Windows'
    try {
        Enable-ComputerRestore -Drive ($env:SystemDrive + '\') -ErrorAction Stop
        $srKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore'
        $oldFreq = (Get-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue).SystemRestorePointCreationFrequency
        Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value 0 -Type DWord -Force
        Checkpoint-Computer -Description 'BOSS Audio (antes de aplicar)' -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
        if ($null -ne $oldFreq) { Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value $oldFreq -Type DWord -Force } else { Remove-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue }
        Ok 'Punto de restauracion creado'
    } catch {
        Warn 'No se pudo crear el punto de restauracion (se sigue: todo queda guardado para deshacer)'
    }
}

$outInfo = AudioReport

# ------------------------------------------------------------------
if ($cfgDuck -eq 1) {
    Head 'Chat de voz: Windows no baja el volumen del juego'
    $r = RegQuiet 'HKCU:\Software\Microsoft\Multimedia\Audio' 'UserDuckingPreference' 3 'DWord'
    if ($r -eq 'fail') { Warn 'No se pudo cambiar la preferencia de ducking' } elseif ($r -eq 'same') { Say '  Ya estaba en no hacer nada' 'DarkGray' } else { Ok 'Ducking desactivado: el volumen del juego se mantiene durante llamadas y chat de voz' }
}

# ------------------------------------------------------------------
if ($cfgMmcss -eq 1) {
    Head 'Prioridad de las tareas multimedia de audio (MMCSS)'
    $tasks = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks'
    $mm = @(
        @(($tasks + '\Audio'), 'Scheduling Category', 'High', 'String'),
        @(($tasks + '\Audio'), 'SFIO Priority', 'High', 'String'),
        @(($tasks + '\Pro Audio'), 'Scheduling Category', 'High', 'String'),
        @(($tasks + '\Pro Audio'), 'SFIO Priority', 'High', 'String')
    )
    $chg = 0
    $bad = 0
    foreach ($it in $mm) {
        $r = RegQuiet $it[0] $it[1] $it[2] $it[3]
        if ($r -eq 'changed') { $chg++ } elseif ($r -eq 'fail') { $bad++ }
    }
    if ($bad -eq 0) { Ok ('Tareas Audio y Pro Audio con prioridad alta (cambios: ' + $chg + ')') } else { Warn ('Algun valor de MMCSS no se pudo escribir (fallos: ' + $bad + ')') }
}

# ------------------------------------------------------------------
if ($cfgPower -eq 1) {
    Head 'El audio nunca se duerme'
    $aIds = @(Get-PnpDevice -Class MEDIA -PresentOnly -ErrorAction SilentlyContinue | ForEach-Object { [string]$_.InstanceId })
    $wmiAll = @(Get-WmiObject -Namespace 'root\wmi' -Class MSPower_DeviceEnable -ErrorAction SilentlyContinue)
    $pw = 0
    foreach ($w in $wmiAll) {
        foreach ($aid in $aIds) {
            if ($w.InstanceName.StartsWith($aid, [StringComparison]::OrdinalIgnoreCase)) {
                if ($w.Enable) {
                    try {
                        $iname = [string]$w.InstanceName
                        $w.Enable = $false
                        $w.Put() | Out-Null
                        AddUndo @{ t = 'wmipwr'; a = $iname; b = ''; old = $true }
                        $pw++
                    } catch { }
                }
            }
        }
    }
    if ($pw -gt 0) { Ok ('Windows ya no apaga ' + $pw + ' dispositivo(s) de audio para ahorrar energia') } else { Say '  Ahorro de energia de los dispositivos de audio: ya estaba desactivado o no aplica' 'DarkGray' }

    $clsRoot = 'HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}'
    $psCnt = 0
    $psFail = 0
    foreach ($sub in @(Get-ChildItem -LiteralPath $clsRoot -ErrorAction SilentlyContinue)) {
        $pp = $sub.PSPath + '\PowerSettings'
        $pk = Get-Item -LiteralPath $pp -ErrorAction SilentlyContinue
        if (-not $pk) { continue }
        foreach ($vn in @('ConservationIdleTime', 'PerformanceIdleTime', 'IdlePowerState')) {
            $cur = $pk.GetValue($vn, $null)
            if ($null -eq $cur) { continue }
            $kind = [string]$pk.GetValueKind($vn)
            if ($kind -eq 'Binary') {
                if ($vn -eq 'IdlePowerState') { $wb = [byte[]](0, 0, 0, 0) } else { $wb = [byte[]](255, 255, 255, 255) }
                $r = RegQuiet $pp $vn $wb 'Binary'
            } else {
                if ($vn -eq 'IdlePowerState') { $wd = 0 } else { $wd = -1 }
                $r = RegQuiet $pp $vn $wd 'DWord'
            }
            if ($r -eq 'changed') { $psCnt++ } elseif ($r -eq 'fail') { $psFail++ }
        }
    }
    if ($psCnt -gt 0) { Ok ('Perfil de energia del driver de audio: sin tiempos de inactividad (' + $psCnt + ' valores, tras reiniciar)') } elseif ($psFail -gt 0) { Warn 'No se pudo escribir el perfil de energia del driver de audio' } else { Say '  El driver de audio no tiene perfil de inactividad que cambiar' 'DarkGray' }
}

# ------------------------------------------------------------------
if ($cfgDsp -eq 1) {
    Head 'Servicios de efectos de audio de terceros'
    $dspRx2 = 'Nahimic|A-Volute|SonicStudio|Sonic Studio|SonicSuite|DolbyDAX|MaxxAudio|WavesSys|DtsApo'
    $dsp2 = @(Get-Service -ErrorAction SilentlyContinue | Where-Object { ($_.Name -match $dspRx2) -or ($_.DisplayName -match $dspRx2) })
    if ($dsp2.Count -eq 0) { Say '  No hay ninguno' 'DarkGray' }
    foreach ($s in $dsp2) { SvcStep ([string]$s.Name) ('Efectos de audio: ' + $s.DisplayName) }
}

# ------------------------------------------------------------------
if (($cfgIni -eq 1) -or ($cfgEng -eq 1)) {
    Head 'Fortnite: configuracion de audio'
    $cfgDir = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient'
    $ini = Join-Path $cfgDir 'GameUserSettings.ini'
    $eng = Join-Path $cfgDir 'Engine.ini'
    $fnRunning = [bool](Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue)
    if ($fnRunning) { Warn 'Fortnite esta abierto: cierralo y vuelve a ejecutar para escribir en sus ini (solo se informa)' }

    if ($cfgIni -eq 1) {
        if (-not (Test-Path -LiteralPath $ini)) {
            Warn 'No existe GameUserSettings.ini: abre Fortnite una vez, cierralo y repite'
        } else {
            $keys = @(ShowFortniteAudioKeys $ini)
            if ($keys.Count -gt 0) {
                Say '  Claves de audio que hay en tu GameUserSettings.ini:' 'DarkGray'
                foreach ($k in ($keys | Select-Object -First 30)) { Say ('    ' + $k) 'DarkGray' }
            } else {
                Say '  Tu GameUserSettings.ini no tiene claves de audio todavia' 'DarkGray'
            }
            $file = ReadIniFile $ini
            $hpKey = $null
            $visKey = $null
            foreach ($line in ($file.Text -split "`n")) {
                $t = $line.Trim()
                if ($t -match '^([^\s=\[;]+)\s*=\s*(\S+)') {
                    $kName = $Matches[1]
                    $kVal = $Matches[2]
                    if ((-not $hpKey) -and ($kName -match '(?i)headphone')) { $hpKey = $kName; $hpVal = $kVal }
                    if ((-not $visKey) -and ($kName -match '(?i)visualiz\w*sound')) { $visKey = $kName; $visVal = $kVal }
                }
            }
            $isHeadphones = ($outInfo -and (($outInfo.FormFactor -eq 3) -or ($outInfo.FormFactor -eq 5)))
            if ($hpKey) {
                Say ('  3D Headphones en tu ini: ' + $hpKey + ' = ' + $hpVal) 'DarkGray'
                if ($isHeadphones) {
                    if ($hpVal -match '(?i)^true$') {
                        Ok '3D Headphones ya esta activo y tu salida son auriculares'
                    } elseif ($visKey -and ($visVal -match '(?i)^true$')) {
                        Warn ('3D Headphones no funciona con Visualizar efectos de sonido (' + $visKey + ' = True). No lo cambio porque es una opcion de accesibilidad.')
                    } elseif ($fnRunning) {
                        Say '  3D Headphones esta apagado; se activaria con Fortnite cerrado' 'DarkGray'
                    } else {
                        $bak = $ini + '.boss_audio.bak'
                        if (-not (Test-Path -LiteralPath $bak)) { Copy-Item -LiteralPath $ini -Destination $bak -Force }
                        $res = IniGetSet $file.Text $hpKey 'True'
                        if ($res -and (WriteIniFile $ini $res.Text $file.Enc)) {
                            AddUndo @{ t = 'ini'; a = $ini; b = $hpKey; old = $res.Old }
                            Ok ('3D Headphones activado (' + $hpKey + '): tu salida son auriculares y Epic lo recomienda para estereo')
                        } else {
                            Warn 'No se pudo activar 3D Headphones en el ini'
                        }
                    }
                } else {
                    if ($hpVal -match '(?i)^true$') { Warn '3D Headphones esta activo pero tu salida no son auriculares: Epic lo recomienda solo con auriculares estereo' } else { Say '  Tu salida no son auriculares: 3D Headphones se deja apagado' 'DarkGray' }
                }
            } else {
                Say '  No hay clave de 3D Headphones en tu ini: activala dentro del juego (Ajustes, Audio) si usas auriculares estereo' 'DarkGray'
            }
        }
    }

    if ($cfgEng -eq 1) {
        if ($fnRunning) {
            Say '  Engine.ini: se deja para cuando Fortnite este cerrado' 'DarkGray'
        } else {
            $block = $engBegin + "`r`n" + '[/Script/WindowsTargetPlatform.WindowsTargetSettings]' + "`r`n" + 'AudioCallbackBufferFrameSize=' + $cfgFrames + "`r`n" + $engEnd + "`r`n"
            New-Item -ItemType Directory -Path $cfgDir -Force | Out-Null
            $existed = Test-Path -LiteralPath $eng
            $enc = New-Object System.Text.UTF8Encoding($false)
            $text = ''
            if ($existed) {
                $ef = ReadIniFile $eng
                $text = $ef.Text
                $enc = $ef.Enc
                $bak2 = $eng + '.boss_audio.bak'
                if (-not (Test-Path -LiteralPath $bak2)) { Copy-Item -LiteralPath $eng -Destination $bak2 -Force }
            }
            $clean = RemoveEngBlock $text
            if ($clean.Length -gt 0 -and (-not $clean.EndsWith("`n"))) { $clean += "`r`n" }
            $newText = $clean + $block
            if ($newText -eq $text) {
                Say '  Engine.ini ya tenia el bloque de audio' 'DarkGray'
            } elseif (WriteIniFile $eng $newText $enc) {
                $flagCreated = '0'
                if (-not $existed) { $flagCreated = '1' }
                AddUndo @{ t = 'engblock'; a = $eng; b = 'audio'; old = $flagCreated }
                Ok ('Engine.ini: buffer de audio de ' + $cfgFrames + ' frames (' + ([Math]::Round($cfgFrames * 1000.0 / 48000, 1)) + ' ms a 48 kHz). Epic no lo soporta y Fortnite puede ignorarlo.')
            } else {
                Warn 'No se pudo escribir Engine.ini'
            }
        }
    }
}

# ------------------------------------------------------------------
Head 'Guardando el estado para poder deshacer'
try {
    if ($global:undo.Count -gt 0) {
        $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
        [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
    }
    $self = $env:BOSS_SELF
    $dst = Join-Path $dataDir 'BOSSTWK.bat'
    if ($self -and ($self -ne $dst)) { Copy-Item -LiteralPath $self -Destination $dst -Force }
    $desk = (Join-Path $env:ProgramData 'BOSS')
    $crlf = "`r`n"
    $l1 = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" restore audio')
    $l2 = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" check audio')
    [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Audio_RESTAURAR.bat'), (($l1 -join $crlf) + $crlf), (New-Object System.Text.ASCIIEncoding))
    [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Audio_COMPROBAR.bat'), (($l2 -join $crlf) + $crlf), (New-Object System.Text.ASCIIEncoding))
    Ok 'Estado guardado: usa COMPROBAR y RESTAURAR del menu de BOSSTWK'
} catch {
    Warn 'No se pudo guardar el estado de restauracion'
}

# ------------------------------------------------------------------
Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
Say '  Reinicia el PC para que el perfil de energia del audio se aplique.' 'Gray'
Say '==================================================================' 'Green'
Say ''
Say 'Lo que Windows no deja cambiar a un bat (1 minuto a mano, sin instalar nada):' 'Cyan'
Say '  Sonido, Reproduccion, tu dispositivo, Propiedades:' 'Gray'
Say '    - Mejoras: desactivar todas (Epic tambien lo aconseja si hay problemas de audio)' 'Gray'
Say '    - Avanzado: formato 24 bits, 48000 Hz (el de Fortnite, evita remuestreo)' 'Gray'
Say '    - Sonido espacial: desactivado (Fortnite trae el suyo, 3D Headphones)' 'Gray'
Say '  Fortnite, Ajustes, Audio:' 'Gray'
Say '    - 3D Headphones solo con auriculares estereo, y apaga cualquier surround virtual del driver' 'Gray'
Say '    - Visualizar efectos de sonido es incompatible con 3D Headphones' 'Gray'
Say '    - Musica baja (0 a 20 por ciento) y efectos al maximo; Dispositivo de salida = el que usas' 'Gray'
Say '  Bluetooth anade latencia sea cual sea el ajuste: para jugar usa cable o receptor 2,4 GHz.' 'Gray'
#PS_MODULE:ADV:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0
$mode = $env:BOSS_MODE
if (-not $mode) { $mode = 'apply' }
$doChange = ($mode -eq 'apply')

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

$cfgRestore = Flag 'RESTORE_POINT' 1
$cfgHiccup  = Flag 'HICCUP_TEST' 1
$cfgHicMs   = Flag 'HICCUP_MS' 1500
$cfgMouse   = Flag 'MOUSE_TEST' 1
$cfgBcd     = Flag 'BCD_FIX' 1
$cfgReplay  = Flag 'FORTNITE_REPLAYS_OFF' 0
$cfgShader  = Flag 'CLEAN_SHADER_CACHE' 0
$cfgTask    = Flag 'PLAY_TASK' 1
$cfgInt     = Flag 'PLAY_INTERVAL' 10
$cfgGpu     = Flag 'PLAY_GPU' 0
if (($cfgHicMs -lt 300) -or ($cfgHicMs -gt 10000)) { $cfgHicMs = 1500 }
if (($cfgInt -lt 3) -or ($cfgInt -gt 120)) { $cfgInt = 10 }

$dataDir   = Join-Path $env:ProgramData 'BOSS'
$undoFile  = Join-Path $dataDir 'adv_undo.json'
$playFile  = Join-Path $dataDir 'play_state.json'
$hicFile   = Join-Path $dataDir 'hiccup_baseline.txt'
$bossGuid  = 'b0550000-b055-4055-8055-b05500b05500'
$taskName  = 'BOSS_Fortnite_Play'
$global:undo = New-Object System.Collections.ArrayList
$global:ids = @{}

# ---------------------- API nativa: microcortes y pausa de procesos ----------------------
$apiOk = $true
try {
    Add-Type -ErrorAction Stop -TypeDefinition @'
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading;

public static class BossHiccup {
    [DllImport("kernel32.dll")]
    static extern IntPtr GetCurrentThread();
    [DllImport("kernel32.dll")]
    static extern UIntPtr SetThreadAffinityMask(IntPtr hThread, UIntPtr mask);

    static string RunOne(int cpu, int ms, double thresholdUs) {
        SetThreadAffinityMask(GetCurrentThread(), new UIntPtr(1UL << cpu));
        Thread.CurrentThread.Priority = ThreadPriority.Highest;
        double f = 1000000.0 / Stopwatch.Frequency;
        long end = Stopwatch.GetTimestamp() + (long)(ms * (Stopwatch.Frequency / 1000.0));
        long last = Stopwatch.GetTimestamp();
        double max = 0;
        int c50 = 0, c200 = 0, c1000 = 0;
        while (true) {
            long now = Stopwatch.GetTimestamp();
            double gap = (now - last) * f;
            last = now;
            if (gap > thresholdUs) {
                c50++;
                if (gap > 200) c200++;
                if (gap > 1000) c1000++;
                if (gap > max) max = gap;
            }
            if (now >= end) break;
        }
        return cpu + "|" + Math.Round(max, 0) + "|" + c50 + "|" + c200 + "|" + c1000;
    }

    public static string Run(int cpu, int ms, double thresholdUs) {
        string result = "ERR";
        Thread t = new Thread(delegate() { result = RunOne(cpu, ms, thresholdUs); });
        t.Start();
        t.Join();
        return result;
    }
}

public static class BossProc {
    [DllImport("ntdll.dll")]
    static extern int NtSuspendProcess(IntPtr h);
    [DllImport("ntdll.dll")]
    static extern int NtResumeProcess(IntPtr h);

    public static int Suspend(int pid) {
        try {
            using (Process p = Process.GetProcessById(pid)) { return NtSuspendProcess(p.Handle); }
        } catch { return -1; }
    }

    public static int Resume(int pid) {
        try {
            using (Process p = Process.GetProcessById(pid)) { return NtResumeProcess(p.Handle); }
        } catch { return -1; }
    }
}
'@
} catch {
    $apiOk = $false
}

# ---------------------- Archivos .ini ----------------------
function ReadIniFile($path) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $bom = (($bytes.Length -ge 2) -and ((($bytes[0] -eq 0xFF) -and ($bytes[1] -eq 0xFE)) -or (($bytes[0] -eq 0xFE) -and ($bytes[1] -eq 0xFF)))) -or (($bytes.Length -ge 3) -and ($bytes[0] -eq 0xEF) -and ($bytes[1] -eq 0xBB) -and ($bytes[2] -eq 0xBF))
    $sr = New-Object System.IO.StreamReader($path, $true)
    $text = $sr.ReadToEnd()
    $enc = $sr.CurrentEncoding
    $sr.Close()
    if (-not $bom) { $enc = New-Object System.Text.UTF8Encoding($false) }
    return [pscustomobject]@{ Text = $text; Enc = $enc }
}

function WriteIniFile($path, $text, $enc) {
    $ro = (Get-Item -LiteralPath $path).IsReadOnly
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $false }
    $okw = $true
    try { [IO.File]::WriteAllText($path, $text, $enc) } catch { $okw = $false }
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $true }
    return $okw
}

function IniGetSet($text, $key, $value) {
    $rx = '(?mi)^(\s*' + [regex]::Escape($key) + '\s*=\s*)(\S+)'
    $m = [regex]::Match($text, $rx)
    if (-not $m.Success) { return $null }
    $old = $m.Groups[2].Value
    $new = [regex]::Replace($text, $rx, ('${1}' + $value))
    return [pscustomobject]@{ Text = $new; Old = $old }
}

# ---------------------- Registro de cambios (deshacer) ----------------------
function UndoId($r) { return ([string]$r.t + '|' + [string]$r.a + '|' + [string]$r.b) }

function LoadUndo {
    if (Test-Path -LiteralPath $undoFile) {
        try {
            $raw = [IO.File]::ReadAllText($undoFile)
            $obj = $raw | ConvertFrom-Json
            foreach ($o in @($obj)) {
                [void]$global:undo.Add($o)
                $global:ids[(UndoId $o)] = $true
            }
        } catch { }
    }
}

function AddUndo($rec) {
    $id = UndoId $rec
    if (-not $global:ids.ContainsKey($id)) {
        [void]$global:undo.Add($rec)
        $global:ids[$id] = $true
    }
}

function RevertOne($r) {
    switch ([string]$r.t) {
        'bcd' {
            if ([string]$r.old -eq 'none') {
                & bcdedit.exe /deletevalue ([string]$r.a) *> $null
            } else {
                & bcdedit.exe /set ([string]$r.a) ([string]$r.old) *> $null
            }
            return ($LASTEXITCODE -eq 0)
        }
        'ini' {
            try {
                if (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) { return $false }
                if (-not (Test-Path -LiteralPath ([string]$r.a))) { return $false }
                $ini = ReadIniFile ([string]$r.a)
                $res = IniGetSet $ini.Text ([string]$r.b) ([string]$r.old)
                if ($null -eq $res) { return $false }
                return (WriteIniFile ([string]$r.a) $res.Text $ini.Enc)
            } catch { return $false }
        }
        'task' {
            try {
                Unregister-ScheduledTask -TaskName ([string]$r.a) -Confirm:$false -ErrorAction Stop
                return $true
            } catch { return $false }
        }
    }
    return $false
}

function RunRevert($list) {
    $arr = @($list)
    [array]::Reverse($arr)
    $n = 0
    foreach ($r in $arr) {
        if (RevertOne $r) { $n++ }
    }
    return $n
}

# ---------------------- Estado del modo JUGAR ----------------------
function GetActiveGuid {
    $o = (& powercfg.exe -getactivescheme | Out-String)
    if ($o -match '([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})') { return $Matches[1] }
    return $null
}

function RecoverPlay {
    if (-not (Test-Path -LiteralPath $playFile)) { return }
    try {
        $st = [IO.File]::ReadAllText($playFile) | ConvertFrom-Json
        foreach ($procId in @($st.suspended)) { [void][BossProc]::Resume([int]$procId) }
        foreach ($sv in @($st.services)) { Start-Service -Name ([string]$sv) -ErrorAction SilentlyContinue }
        if ($st.plan) { & powercfg.exe -setactive ([string]$st.plan) 2>$null }
    } catch { }
    Remove-Item -LiteralPath $playFile -Force -ErrorAction SilentlyContinue
}

# ---------------------- Utilidades ----------------------
function PingOnce($target, $timeout) {
    try {
        $p = New-Object System.Net.NetworkInformation.Ping
        $r = $p.Send($target, $timeout)
        if ($r.Status -eq 'Success') { return [double]$r.RoundtripTime }
    } catch { }
    return $null
}

function BestRegionHost {
    $best = $null
    $bestMs = [double]::MaxValue
    foreach ($key in @('eu', 'nae', 'nac', 'naw', 'oce', 'br', 'asia', 'me')) {
        $vals = @()
        for ($k = 0; $k -lt 2; $k++) {
            $v = PingOnce ('ping-' + $key + '.ds.on.epicgames.com') 1000
            if ($null -ne $v) { $vals += $v }
        }
        if ($vals.Count -gt 0) {
            $avg = ($vals | Measure-Object -Average).Average
            if ($avg -lt $bestMs) {
                $bestMs = $avg
                $best = 'ping-' + $key + '.ds.on.epicgames.com'
            }
        }
    }
    return $best
}

function Pctl($arr, $p) {
    $a = @($arr | Sort-Object)
    if ($a.Count -eq 0) { return $null }
    $i = [Math]::Min($a.Count - 1, [int][Math]::Floor($a.Count * $p))
    return $a[$i]
}

function DirSizeMb($path) {
    if (-not (Test-Path -LiteralPath $path)) { return $null }
    $s = (Get-ChildItem -LiteralPath $path -Recurse -File -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
    if ($null -eq $s) { $s = 0 }
    return [Math]::Round($s / 1MB, 0)
}

function FindFortnite {
    $dat = Join-Path $env:ProgramData 'Epic\UnrealEngineLauncher\LauncherInstalled.dat'
    if (Test-Path -LiteralPath $dat) {
        try {
            $jd = [IO.File]::ReadAllText($dat) | ConvertFrom-Json
            foreach ($li in @($jd.InstallationList)) {
                if ([string]$li.AppName -eq 'Fortnite') {
                    $cand = Join-Path ([string]$li.InstallLocation) 'FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe'
                    if (Test-Path -LiteralPath $cand) { return $cand }
                }
            }
        } catch { }
    }
    $def = 'C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe'
    if (Test-Path -LiteralPath $def) { return $def }
    return $null
}

# ====================== MODO RESTAURAR ======================
if ($mode -eq 'restore') {
    Head 'Restaurar los valores originales'
    RecoverPlay
    if (-not (Test-Path -LiteralPath $undoFile)) {
        Warn 'No hay ningun estado guardado para restaurar'
        exit 0
    }
    $items = @([IO.File]::ReadAllText($undoFile) | ConvertFrom-Json)
    $done = RunRevert $items
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    Move-Item -LiteralPath $undoFile -Destination (Join-Path $dataDir ('adv_undo_restaurado_' + $stamp + '.json')) -Force
    Ok ('Cambios revertidos: ' + $done + ' de ' + $items.Count)
    Say '  Reinicia el PC para completar la restauracion.' 'Gray'
    exit 0
}

# ====================== MODO JUGAR ======================
if ($mode -eq 'play') {
    Head 'Modo JUGAR: preparando el sistema'
    RecoverPlay
    $state = @{ plan = (GetActiveGuid); suspended = @(); services = @() }
    $listOut = (& powercfg.exe -list | Out-String)
    if (($listOut -match $bossGuid) -and ($state.plan -ne $bossGuid)) {
        & powercfg.exe -setactive $bossGuid 2>$null
        Ok 'Plan de energia BOSS activado para la sesion'
    } elseif ($state.plan -eq $bossGuid) {
        Say '  Plan de energia BOSS ya activo' 'DarkGray'
    } else {
        Say '  No hay plan BOSS: se usa el actual' 'DarkGray'
    }
    if (-not (Get-Process -Name 'BossTimerHolder' -ErrorAction SilentlyContinue)) {
        if (Get-ScheduledTask -TaskName 'BOSS_TimerResolution' -ErrorAction SilentlyContinue) { Start-ScheduledTask -TaskName 'BOSS_TimerResolution' -ErrorAction SilentlyContinue }
    }
    $susNames = @()
    if ($apiOk) {
        foreach ($nm in ([string]$env:PLAY_SUSPEND -split ',')) {
            $n = $nm.Trim()
            if (-not $n) { continue }
            foreach ($pr in @(Get-Process -Name $n -ErrorAction SilentlyContinue)) {
                if ([BossProc]::Suspend($pr.Id) -eq 0) {
                    $state.suspended += $pr.Id
                    if ($susNames -notcontains $n) { $susNames += $n }
                }
            }
        }
    }
    if ($susNames.Count -gt 0) { Ok ('Pausados durante la partida: ' + ($susNames -join ', ')) } else { Say '  Ningun proceso de la lista estaba abierto' 'DarkGray' }
    $stopped = @()
    foreach ($sn in ([string]$env:PLAY_SERVICES -split ',')) {
        $s = $sn.Trim()
        if (-not $s) { continue }
        $sv = Get-Service -Name $s -ErrorAction SilentlyContinue
        if ($sv -and ([string]$sv.Status -eq 'Running')) {
            Stop-Service -Name $s -Force -ErrorAction SilentlyContinue
            $state.services += $s
            $stopped += $s
        }
    }
    if ($stopped.Count -gt 0) { Ok ('Servicios parados durante la partida: ' + ($stopped -join ', ')) }
    New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
    [IO.File]::WriteAllText($playFile, (ConvertTo-Json -InputObject $state -Depth 4), (New-Object System.Text.UTF8Encoding($false)))

    try {
        $me = [Diagnostics.Process]::GetCurrentProcess()
        $me.PriorityClass = 'BelowNormal'
        if ([Environment]::ProcessorCount -ge 4) { $me.ProcessorAffinity = [IntPtr]3 }
    } catch { }

    $region = BestRegionHost
    if ($region) { Say ('  Region para medir el ping: ' + $region) 'DarkGray' }

    $fnProc = 'FortniteClient-Win64-Shipping'
    if (Get-Process -Name $fnProc -ErrorAction SilentlyContinue) {
        Say '  Fortnite ya esta abierto: se mide esta sesion' 'DarkGray'
    } else {
        Say '  Lanzando Fortnite desde Epic Games Launcher (por el Explorador, para que no se abra con permisos de administrador) ...' 'Gray'
        Start-Process -FilePath 'explorer.exe' -ArgumentList 'com.epicgames.launcher://apps/Fortnite?action=launch&silent=true'
    }

    $pings = @()
    $lostPings = 0
    $cpuS = @()
    $ramS = @()
    $fnMem = @()
    $gpuT = @()
    $gpuClk = @()
    $thrHits = 0
    $started = $null
    $t0 = Get-Date
    $smi = Join-Path $env:SystemRoot 'System32\nvidia-smi.exe'
    if (-not (Test-Path -LiteralPath $smi)) { $smi = 'C:\Program Files\NVIDIA Corporation\NVSMI\nvidia-smi.exe' }
    try {
        for ($w = 0; $w -lt 80; $w++) {
            if (Get-Process -Name $fnProc -ErrorAction SilentlyContinue) { $started = Get-Date; break }
            Start-Sleep -Seconds 3
        }
        if (-not $started) {
            Warn 'Fortnite no arranco en 4 minutos. Se restaura todo.'
        } else {
            Ok 'Fortnite en ejecucion: midiendo la sesion (no cierres esta ventana)'
            $missing = 0
            while ($missing -lt 3) {
                $gp = Get-Process -Name $fnProc -ErrorAction SilentlyContinue
                if (-not $gp) {
                    $missing++
                    Start-Sleep -Seconds 4
                    continue
                }
                $missing = 0
                $fnMem += [Math]::Round(($gp | Measure-Object -Property WorkingSet64 -Sum).Sum / 1MB, 0)
                if ($region) {
                    for ($k = 0; $k -lt 4; $k++) {
                        $v = PingOnce $region 800
                        if ($null -ne $v) { $pings += $v } else { $lostPings++ }
                        Start-Sleep -Milliseconds 150
                    }
                }
                $cr = Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation -ErrorAction SilentlyContinue | Where-Object { [string]$_.Name -eq '_Total' } | Select-Object -First 1
                if ($cr) { $cpuS += [double]$cr.PercentProcessorUtility }
                $mr = Get-CimInstance Win32_PerfFormattedData_PerfOS_Memory -ErrorAction SilentlyContinue | Select-Object -First 1
                if ($mr) { $ramS += [double]$mr.AvailableMBytes }
                if (($cfgGpu -eq 1) -and (Test-Path -LiteralPath $smi)) {
                    $gl = (& $smi '--query-gpu=temperature.gpu,clocks.sm,clocks_throttle_reasons.active' '--format=csv,noheader,nounits' 2>$null | Select-Object -First 1)
                    if ($gl) {
                        $gf = @(([string]$gl).Split(',') | ForEach-Object { $_.Trim() })
                        if ($gf.Count -ge 3) {
                            $gpuT += [double]$gf[0]
                            $gpuClk += [double]$gf[1]
                            if ([string]$gf[2] -match '0x([0-9A-Fa-f]+)') {
                                $bits = [Convert]::ToUInt64($Matches[1], 16)
                                if (($bits -band 0x6C) -ne 0) { $thrHits++ }
                            }
                        }
                    }
                }
                Start-Sleep -Seconds $cfgInt
            }
        }
    } finally {
        RecoverPlay
    }
    Head 'Sesion terminada: todo restaurado'
    Ok 'Procesos reanudados, servicios reiniciados y plan de energia anterior restaurado'
    if ($started) {
        $mins = [Math]::Round(((Get-Date) - $started).TotalMinutes, 1)
        Say ('  Duracion de la partida: ' + $mins + ' minutos') 'Gray'
        if ($pings.Count -gt 1) {
            $avg = [Math]::Round(($pings | Measure-Object -Average).Average, 1)
            $mx = ($pings | Measure-Object -Maximum).Maximum
            $mn = ($pings | Measure-Object -Minimum).Minimum
            $p95 = Pctl $pings 0.95
            $jit = 0.0
            for ($k = 1; $k -lt $pings.Count; $k++) { $jit += [Math]::Abs($pings[$k] - $pings[$k - 1]) }
            $jit = [Math]::Round($jit / ($pings.Count - 1), 1)
            $lossPct = [Math]::Round(100.0 * $lostPings / [Math]::Max(1, $pings.Count + $lostPings), 1)
            Say ('  Ping al servidor: medio ' + $avg + ' ms | minimo ' + $mn + ' | p95 ' + $p95 + ' | maximo ' + $mx + ' | jitter ' + $jit + ' ms | perdida ' + $lossPct + ' %') 'Gray'
            if (($lossPct -gt 1) -or ($jit -gt 5) -or ($mx -gt ($avg * 3))) { Warn 'Hubo perdida, jitter o picos de ping durante la partida: usa cable y revisa el SQM del router' } else { Ok 'Ping estable durante toda la partida' }
        }
        if ($cpuS.Count -gt 0) { Say ('  CPU: media ' + [Math]::Round(($cpuS | Measure-Object -Average).Average, 0) + ' % | pico ' + [Math]::Round(($cpuS | Measure-Object -Maximum).Maximum, 0) + ' %') 'Gray' }
        if ($ramS.Count -gt 0) {
            $minFree = [Math]::Round(($ramS | Measure-Object -Minimum).Minimum, 0)
            Say ('  RAM libre minima durante la partida: ' + $minFree + ' MB') 'Gray'
            if ($minFree -lt 1500) { Warn 'La RAM libre bajo de 1,5 GB: cierra programas antes de jugar' }
        }
        if ($fnMem.Count -gt 0) { Say ('  Memoria de Fortnite: hasta ' + [Math]::Round(($fnMem | Measure-Object -Maximum).Maximum, 0) + ' MB') 'Gray' }
        if ($gpuT.Count -gt 0) {
            Say ('  GPU: temperatura maxima ' + [Math]::Round(($gpuT | Measure-Object -Maximum).Maximum, 0) + ' C | reloj medio ' + [Math]::Round(($gpuClk | Measure-Object -Average).Average, 0) + ' MHz') 'Gray'
            if ($thrHits -gt 0) { Warn ('La GPU limito su reloj por temperatura o potencia en ' + $thrHits + ' de ' + $gpuT.Count + ' muestras') } else { Ok 'La GPU no limito su reloj por temperatura ni potencia' }
        }
    }
    exit 0
}

# ====================== LECTURA Y DIAGNOSTICO ======================
LoadUndo
if ($doChange) { New-Item -ItemType Directory -Path $dataDir -Force | Out-Null }

Head 'Tu equipo'
$cv = Get-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -ErrorAction SilentlyContinue
$cpuInfo = Get-CimInstance Win32_Processor -ErrorAction SilentlyContinue | Select-Object -First 1
Say ('  Windows ' + $cv.DisplayVersion + ' build ' + $cv.CurrentBuildNumber + '.' + $cv.UBR + '   ' + $cpuInfo.Name + '   ' + [Environment]::ProcessorCount + ' hilos')

if ($doChange -and ($cfgRestore -eq 1)) {
    Head 'Punto de restauracion de Windows'
    try {
        Enable-ComputerRestore -Drive ($env:SystemDrive + '\') -ErrorAction Stop
        $srKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore'
        $oldFreq = (Get-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue).SystemRestorePointCreationFrequency
        Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value 0 -Type DWord -Force
        Checkpoint-Computer -Description 'BOSS Avanzado (antes de aplicar)' -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
        if ($null -ne $oldFreq) { Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value $oldFreq -Type DWord -Force } else { Remove-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue }
        Ok 'Punto de restauracion creado'
    } catch {
        Warn 'No se pudo crear el punto de restauracion (se sigue: todo queda guardado para deshacer)'
    }
}

# ------------------------------------------------------------------
Head 'Arranque del sistema (BCD): reloj y tick'
$bcdTxt = (& bcdedit.exe /enum '{current}' 2>&1 | Out-String)
function BcdVal($name) {
    $m = [regex]::Match($bcdTxt, ('(?im)^\s*' + [regex]::Escape($name) + '\s+(.+)$'))
    if ($m.Success) { return $m.Groups[1].Value.Trim() }
    return $null
}
$upc = BcdVal 'useplatformclock'
$ddt = BcdVal 'disabledynamictick'
$hyp = BcdVal 'hypervisorlaunchtype'
if ($null -ne $hyp) { Say ('  hypervisorlaunchtype = ' + $hyp + ' (si no usas WSL2, Docker ni maquinas virtuales, apagarlo ahorra algo de latencia, pero no se toca)') 'DarkGray' }
if ($null -ne $upc) {
    if ($doChange -and ($cfgBcd -eq 1)) {
        $bk = Join-Path $dataDir 'bcd_backup'
        if (-not (Test-Path -LiteralPath $bk)) { & bcdedit.exe /export $bk *> $null }
        $oldNorm = 'no'
        if ($upc -match '^(?i)(yes|s.|oui|ja|true|on)$') { $oldNorm = 'yes' }
        & bcdedit.exe /deletevalue useplatformclock *> $null
        if ($LASTEXITCODE -eq 0) {
            AddUndo @{ t = 'bcd'; a = 'useplatformclock'; b = ''; old = $oldNorm }
            Ok 'Reloj de plataforma forzado (HPET) eliminado: Windows usa el TSC, mas rapido y con menos latencia'
        } else {
            Warn 'No se pudo quitar useplatformclock'
        }
    } else {
        Warn 'useplatformclock esta definido: fuerza el reloj HPET y suma latencia'
    }
} else {
    Ok 'Sin reloj de plataforma forzado: Windows usa el TSC'
}
if ($null -eq $ddt) {
    if ($doChange -and ($cfgBcd -eq 1)) {
        & bcdedit.exe /set disabledynamictick yes *> $null
        if ($LASTEXITCODE -eq 0) {
            AddUndo @{ t = 'bcd'; a = 'disabledynamictick'; b = ''; old = 'none' }
            Ok 'Tick constante activado (disabledynamictick)'
        } else {
            Warn 'No se pudo activar disabledynamictick'
        }
    } else {
        Say '  disabledynamictick no esta definido (el modulo 1 (Plan de energia) o este modulo lo ponen)' 'DarkGray'
    }
} else {
    Ok 'Tick constante ya activo'
}

# ------------------------------------------------------------------
Head 'Fortnite: instalacion, disco y caches'
$fnExe = FindFortnite
if ($fnExe) {
    Say ('  Instalacion: ' + $fnExe) 'DarkGray'
    $letter = $fnExe.Substring(0, 1)
    try {
        $part = Get-Partition -DriveLetter $letter -ErrorAction Stop
        $pd = Get-PhysicalDisk -ErrorAction Stop | Where-Object { [string]$_.DeviceId -eq [string]$part.DiskNumber } | Select-Object -First 1
        if ($pd) {
            Say ('  Disco: ' + $pd.FriendlyName + '  (' + $pd.MediaType + ', ' + $pd.BusType + ', salud ' + $pd.HealthStatus + ')') 'DarkGray'
            if (([string]$pd.MediaType -eq 'HDD') -and ([string]$pd.BusType -ne 'NVMe')) { Warn 'Fortnite esta en un disco duro mecanico: mueve la instalacion a un SSD NVMe, es la mayor causa de tirones al cargar texturas' } else { Ok 'Fortnite esta en un SSD' }
            $rel = $pd | Get-StorageReliabilityCounter -ErrorAction SilentlyContinue
            if ($rel) {
                Say ('  Fiabilidad: temperatura ' + $rel.Temperature + ' C | desgaste ' + $rel.Wear + ' % | horas ' + $rel.PowerOnHours + ' | errores de lectura ' + $rel.ReadErrorsTotal) 'DarkGray'
                if (($null -ne $rel.Temperature) -and ([int]$rel.Temperature -ge 70)) { Warn 'El SSD esta muy caliente: puede bajar su velocidad (throttling). Mejora la refrigeracion.' }
                if (($null -ne $rel.Wear) -and ([int]$rel.Wear -ge 80)) { Warn 'El SSD tiene mucho desgaste: haz copia de seguridad' }
            }
        }
    } catch { }
} else {
    Say '  No se encontro la instalacion de Fortnite' 'DarkGray'
}
$cacheDirs = @(
    @('Cache de shaders NVIDIA (DX)', (Join-Path $env:LOCALAPPDATA 'NVIDIA\DXCache')),
    @('Cache de shaders NVIDIA (GL)', (Join-Path $env:LOCALAPPDATA 'NVIDIA\GLCache')),
    @('Cache de shaders de DirectX', (Join-Path $env:LOCALAPPDATA 'D3DSCache')),
    @('Datos de Fortnite', (Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved'))
)
foreach ($cd in $cacheDirs) {
    $sz = DirSizeMb $cd[1]
    if ($null -ne $sz) { Say ('  ' + $cd[0] + ': ' + $sz + ' MB') 'DarkGray' }
}
if ($doChange -and ($cfgShader -eq 1)) {
    if (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) {
        Warn 'Fortnite esta abierto: cierralo para limpiar la cache de shaders'
    } else {
        foreach ($p in @((Join-Path $env:LOCALAPPDATA 'NVIDIA\DXCache'), (Join-Path $env:LOCALAPPDATA 'NVIDIA\GLCache'), (Join-Path $env:LOCALAPPDATA 'D3DSCache'))) {
            if (Test-Path -LiteralPath $p) { Get-ChildItem -LiteralPath $p -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue }
        }
        Ok 'Caches de shaders vaciadas: se regeneran solas (las primeras partidas pueden dar algun tiron mientras se recompilan)'
    }
}

# ------------------------------------------------------------------
Head 'Software que mete latencia o microtirones'
$radar = @(
    @('ArmouryCrate|AsusCertService|ArmourySocketServer|ASUSOptimization|AsusROGLSL|LightingService|AuraService', 'ASUS Armoury Crate y Aura: servicios conocidos por picos de DPC. Si no usas la iluminacion, cierralos o quita la app'),
    @('iCUE|CorsairService|CorsairLLAccess', 'Corsair iCUE: sondea sensores y USB, puede causar tirones'),
    @('LGHUB|lghub', 'Logitech G HUB: cierralo tras configurar el raton (el perfil queda guardado en el raton)'),
    @('SignalRgb|OpenRGB|RazerCentral|Razer Synapse|RzSynapse', 'Software RGB y de perifericos: consulta el USB constantemente'),
    @('HWiNFO|MSIAfterburner|RTSS|AIDA64|CoreTemp|OpenHardwareMonitor|LibreHardwareMonitor', 'Monitores de hardware: el sondeo de sensores puede meter microtirones'),
    @('Discord', 'Discord: desactiva el overlay en juego'),
    @('GameOverlayUI|steamwebhelper', 'Steam: desactiva el overlay en juego'),
    @('Overwolf|Medal|Outplayed', 'Overlays y grabadores: anaden latencia'),
    @('NVIDIA Overlay|NVIDIA Share|nvsphelper64|NVIDIA app', 'Overlay de NVIDIA: desactivalo en su app si no lo usas'),
    @('obs64|obs32', 'OBS: la captura de juego anade latencia si esta grabando'),
    @('wallpaper32|wallpaper64', 'Wallpaper Engine: usa GPU y CPU, ponlo en pausa al jugar'),
    @('OneDrive|Dropbox|GoogleDriveFS', 'Sincronizadores: suben archivos en segundo plano (el modo JUGAR los pausa)'),
    @('Teams|Skype', 'Teams y Skype: consumen CPU y red en segundo plano (el modo JUGAR pausa Teams)')
)
$allProcs = @(Get-Process -ErrorAction SilentlyContinue | ForEach-Object { [string]$_.ProcessName })
$allSvcs = @(Get-Service -ErrorAction SilentlyContinue | Where-Object { [string]$_.Status -eq 'Running' } | ForEach-Object { [string]$_.Name + ' ' + [string]$_.DisplayName })
$radarHits = 0
foreach ($rd in $radar) {
    $hitP = @($allProcs | Where-Object { $_ -match $rd[0] } | Select-Object -Unique)
    $hitS = @($allSvcs | Where-Object { $_ -match $rd[0] } | Select-Object -First 2)
    if (($hitP.Count -gt 0) -or ($hitS.Count -gt 0)) {
        $radarHits++
        $whoList = @($hitP) + @($hitS | ForEach-Object { $_.Split(' ')[0] })
        $who = (@($whoList | Where-Object { $_ } | Select-Object -Unique | Select-Object -First 4)) -join ', '
        Warn ($who + ': ' + $rd[1])
    }
}
if ($radarHits -eq 0) { Ok 'No hay software de iluminacion, overlays ni monitores conocidos por meter latencia' }

# ------------------------------------------------------------------
if ($cfgHiccup -eq 1) {
    Head 'Microcortes por nucleo (ISR, DPC y SMI): cuanto tiempo "desaparece" cada CPU'
    $nCpu = [Environment]::ProcessorCount
    if ((-not $apiOk) -or ($nCpu -gt 63)) {
        Warn 'No se puede medir en este equipo'
    } else {
        Say ('  Midiendo ' + $nCpu + ' hilos x ' + ($cfgHicMs / 1000.0) + ' s. Deja el PC en reposo y no toques el raton.') 'DarkGray'
        $meMe = [Diagnostics.Process]::GetCurrentProcess()
        $oldPrio = $meMe.PriorityClass
        try { $meMe.PriorityClass = 'High' } catch { }
        $rows = @()
        for ($c = 0; $c -lt $nCpu; $c++) {
            $s = [BossHiccup]::Run($c, $cfgHicMs, 50.0)
            $p = $s.Split('|')
            if ($p.Count -ge 5) { $rows += [pscustomobject]@{ Cpu = [int]$p[0]; MaxUs = [int]$p[1]; N50 = [int]$p[2]; N200 = [int]$p[3]; N1000 = [int]$p[4] } }
        }
        try { $meMe.PriorityClass = $oldPrio } catch { }
        $secs = $cfgHicMs / 1000.0
        foreach ($r in ($rows | Sort-Object Cpu)) {
            Say ('  CPU {0,2}   mayor corte {1,6} us   >50 us: {2,5}/s   >200 us: {3,4}   >1 ms: {4,3}' -f $r.Cpu, $r.MaxUs, [Math]::Round($r.N50 / $secs, 0), $r.N200, $r.N1000)
        }
        if ($rows.Count -gt 0) {
            $med = Pctl ($rows | ForEach-Object { $_.MaxUs }) 0.5
            $worst = @($rows | Sort-Object MaxUs -Descending | Select-Object -First 3)
            $quiet = @($rows | Sort-Object MaxUs | Select-Object -First 3)
            Say ('  Mediana del mayor corte: ' + $med + ' us') 'DarkGray'
            Say ('  Mas ruidosas: CPU ' + (($worst | ForEach-Object { $_.Cpu }) -join ', ') + '   Mas silenciosas: CPU ' + (($quiet | ForEach-Object { $_.Cpu }) -join ', ')) 'DarkGray'
            $big = @($rows | Where-Object { $_.N1000 -gt 0 })
            if ($big.Count -eq 0) { Ok 'Ningun nucleo pierde mas de 1 ms: el sistema esta limpio' } else { Warn ('Hay cortes de mas de 1 ms en ' + $big.Count + ' nucleo(s). Si aparecen en todos a la vez suele ser una SMI de la BIOS o un driver; si solo en uno, un dispositivo anclado a ese nucleo.') }
            if (Test-Path -LiteralPath $hicFile) {
                Say '  Comparacion con la medida guardada de la primera vez:' 'DarkGray'
                $base = @{}
                foreach ($ln in [IO.File]::ReadAllLines($hicFile)) {
                    $bp = $ln.Split('|')
                    if ($bp.Count -ge 5) { $base[[int]$bp[0]] = [int]$bp[1] }
                }
                $better = 0
                $worse = 0
                foreach ($r in $rows) {
                    if ($base.ContainsKey($r.Cpu)) {
                        if ($r.MaxUs -lt ($base[$r.Cpu] * 0.8)) { $better++ } elseif ($r.MaxUs -gt ($base[$r.Cpu] * 1.25)) { $worse++ }
                    }
                }
                Say ('  Nucleos que mejoraron: ' + $better + '   que empeoraron: ' + $worse) 'DarkGray'
            } elseif ($doChange) {
                $lines = @($rows | ForEach-Object { [string]$_.Cpu + '|' + [string]$_.MaxUs + '|' + [string]$_.N50 + '|' + [string]$_.N200 + '|' + [string]$_.N1000 })
                try { [IO.File]::WriteAllLines($hicFile, [string[]]$lines) } catch { }
                Say '  Medida guardada como referencia para comparar mas adelante' 'DarkGray'
            }
        }
    }
}

# ------------------------------------------------------------------
if ($cfgMouse -eq 1) {
    Head 'Polling real del raton'
    $mouseSrc = @'
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;

public class BossRawWin : NativeWindow {
    [StructLayout(LayoutKind.Sequential)]
    struct RAWINPUTDEVICE { public ushort usUsagePage; public ushort usUsage; public uint dwFlags; public IntPtr hwndTarget; }
    [DllImport("user32.dll", SetLastError = true)]
    static extern bool RegisterRawInputDevices(RAWINPUTDEVICE[] devs, uint num, uint size);
    public List<long> Stamps = new List<long>();
    public bool Registered;
    public BossRawWin() {
        CreateParams cp = new CreateParams();
        cp.Parent = new IntPtr(-3);
        CreateHandle(cp);
        RAWINPUTDEVICE[] rid = new RAWINPUTDEVICE[1];
        rid[0].usUsagePage = 1;
        rid[0].usUsage = 2;
        rid[0].dwFlags = 0x100;
        rid[0].hwndTarget = this.Handle;
        Registered = RegisterRawInputDevices(rid, 1, (uint)Marshal.SizeOf(typeof(RAWINPUTDEVICE)));
    }
    protected override void WndProc(ref Message m) {
        if (m.Msg == 0x00FF) Stamps.Add(Stopwatch.GetTimestamp());
        base.WndProc(ref m);
    }
}

public static class BossMouse {
    static double Pct(List<double> v, double p) {
        if (v.Count == 0) return 0;
        v.Sort();
        int i = (int)Math.Floor(v.Count * p);
        if (i >= v.Count) i = v.Count - 1;
        return v[i];
    }
    public static string Measure(int seconds) {
        try {
            BossRawWin w = new BossRawWin();
            if (!w.Registered) return "ERR|registro";
            long freq = Stopwatch.Frequency;
            long end = Stopwatch.GetTimestamp() + seconds * freq;
            while (Stopwatch.GetTimestamp() < end) { Application.DoEvents(); }
            List<long> s = w.Stamps;
            w.DestroyHandle();
            int n = s.Count;
            if (n < 50) return "OK|" + n + "|0|0|0|0|0";
            long t0 = s[0];
            int bins = (int)((s[n - 1] - t0) * 10 / freq) + 1;
            int[] cnt = new int[bins];
            for (int i = 0; i < n; i++) cnt[(int)((s[i] - t0) * 10 / freq)]++;
            List<double> rates = new List<double>();
            for (int i = 0; i < bins; i++) if (cnt[i] >= 5) rates.Add(cnt[i] * 10.0);
            List<double> gaps = new List<double>();
            for (int i = 1; i < n; i++) {
                double g = (s[i] - s[i - 1]) * 1000.0 / freq;
                if (g < 50) gaps.Add(g);
            }
            double med = Pct(rates, 0.5);
            double p95 = Pct(rates, 0.95);
            double max = Pct(rates, 1.0);
            double g50 = Pct(gaps, 0.5);
            double g99 = Pct(gaps, 0.99);
            return "OK|" + n + "|" + Math.Round(med, 0) + "|" + Math.Round(p95, 0) + "|" + Math.Round(max, 0) + "|" + Math.Round(g50, 2) + "|" + Math.Round(g99, 2);
        } catch (Exception ex) {
            return "ERR|" + ex.Message;
        }
    }
}
'@
    $tmp = Join-Path $env:TEMP 'boss_mouse'
    New-Item -ItemType Directory -Path $tmp -Force | Out-Null
    $outFile = Join-Path $tmp 'result.txt'
    Remove-Item -LiteralPath $outFile -Force -ErrorAction SilentlyContinue
    $child = "`$src = @'" + "`r`n" + $mouseSrc + "`r`n" + "'@" + "`r`n" + "Add-Type -ReferencedAssemblies System.Windows.Forms -TypeDefinition `$src" + "`r`n" + "[IO.File]::WriteAllText('" + $outFile + "', [BossMouse]::Measure(10))" + "`r`n"
    $ps1 = Join-Path $tmp 'mouse.ps1'
    [IO.File]::WriteAllText($ps1, $child, (New-Object System.Text.ASCIIEncoding))
    Say '  >>> MUEVE EL RATON EN CIRCULOS RAPIDOS Y SIN PARAR durante unos 14 segundos, desde ahora <<<' 'Yellow'
    $mp = Start-Process -FilePath 'powershell.exe' -ArgumentList @('-NoProfile', '-STA', '-ExecutionPolicy', 'Bypass', '-WindowStyle', 'Hidden', '-File', $ps1) -PassThru
    if ($mp) { [void]$mp.WaitForExit(45000) }
    $mres = ''
    if (Test-Path -LiteralPath $outFile) { $mres = ([IO.File]::ReadAllText($outFile)).Trim() }
    if (-not $mres) {
        Warn 'No se pudo completar la medida del raton'
    } else {
        $mp2 = $mres.Split('|')
        if ($mp2[0] -ne 'OK') {
            Warn ('No se pudo medir el raton (' + $mres + ')')
        } elseif ([int]$mp2[1] -lt 200) {
            Warn 'No detecte suficiente movimiento del raton: repite y muevelo sin parar durante toda la medida'
        } else {
            $med = [int]$mp2[2]
            $p95r = [int]$mp2[3]
            $mxr = [int]$mp2[4]
            Say ('  Eventos recibidos: ' + $mp2[1] + '   frecuencia mediana ' + $med + ' Hz | p95 ' + $p95r + ' Hz | maxima ' + $mxr + ' Hz | separacion tipica ' + $mp2[5] + ' ms | p99 ' + $mp2[6] + ' ms') 'DarkGray'
            if ($p95r -lt 300) {
                Warn ('Tu raton va a unos 125 Hz (' + $p95r + '): es poco. Sube el polling a 1000 Hz o mas en su software o con su boton; cambia directamente la latencia de entrada.')
            } elseif ($p95r -lt 800) {
                Warn ('Tu raton va a unos 500 Hz (' + $p95r + '): sube a 1000 Hz o mas')
            } else {
                Ok ('Polling del raton de unos ' + $p95r + ' Hz')
            }
            if ($p95r -ge 1500) { Say '  Con 4000 u 8000 Hz una ventana normal de Windows puede recibir menos eventos de los reales: esta medida es un minimo.' 'DarkGray' }
            if ([double]$mp2[6] -gt 4) { Warn 'Hay huecos grandes entre eventos (p99 alto): el raton o el receptor pierden informes. Usa un puerto USB trasero directo y acerca el receptor.' }
        }
    }
    Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
}

# ------------------------------------------------------------------
Head 'Fortnite: lectura de GameUserSettings.ini'
$ini = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'
if (-not (Test-Path -LiteralPath $ini)) {
    Warn 'No existe GameUserSettings.ini: abre Fortnite una vez, cierralo y repite'
} else {
    if ((Get-Item -LiteralPath $ini).IsReadOnly) { Warn 'El ini esta en solo lectura: Fortnite no puede guardar cambios de graficos ni cambiar al modo Rendimiento. Quita el atributo si no lo pusiste a proposito.' }
    $file = ReadIniFile $ini
    foreach ($line in ($file.Text -split "`n")) {
        $tl = $line.Trim()
        if ($tl -match '^([^\s=\[;]+)\s*=\s*(\S+)') {
            $kn = $Matches[1]
            $kv = $Matches[2]
            if ($kn -match '(?i)^(PreferredRHI|PreferredFeatureLevel|FullscreenMode|FrameRateLimit|bUseVSync|ResolutionSizeX|ResolutionSizeY|CosmeticStreamingEnabled)$') { Say ('  ' + $kn + ' = ' + $kv) 'DarkGray' }
            if ($kn -match '(?i)replay') { Say ('  ' + $kn + ' = ' + $kv) 'DarkGray' }
        }
    }
    Say '  Modo de renderizado en el launcher de Epic (Ajustes, Fortnite, argumentos adicionales):' 'DarkGray'
    Say '    Rendimiento: -d3d12 -FeatureLevelEs31      Calidad DirectX 12: -d3d12 -sm6' 'DarkGray'
    Say '    (los argumentos antiguos como -high o -USEALLAVAILABLECORES ya no sirven o estorban)' 'DarkGray'
    if ($doChange -and ($cfgReplay -eq 1)) {
        if (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) {
            Warn 'Fortnite esta abierto: cierralo para tocar las repeticiones'
        } else {
            $repKey = $null
            $repVal = $null
            foreach ($line in ($file.Text -split "`n")) {
                $tl = $line.Trim()
                if ($tl -match '^([^\s=\[;]+)\s*=\s*(\S+)') {
                    $kn = $Matches[1]
                    $kv = $Matches[2]
                    if ((-not $repKey) -and ($kn -match '(?i)^b\w*replay\w*$') -and ($kv -match '(?i)^(true|false)$')) {
                        $repKey = $kn
                        $repVal = $kv
                    }
                }
            }
            if (-not $repKey) {
                Say '  No hay una clave booleana de repeticiones en tu ini: se puede apagar dentro del juego (Ajustes, Juego, Repeticiones)' 'DarkGray'
            } elseif ($repVal -match '(?i)^false$') {
                Ok ('Repeticiones ya apagadas (' + $repKey + ')')
            } else {
                $bak = $ini + '.boss_adv.bak'
                if (-not (Test-Path -LiteralPath $bak)) { Copy-Item -LiteralPath $ini -Destination $bak -Force }
                $res = IniGetSet $file.Text $repKey 'False'
                if ($res -and (WriteIniFile $ini $res.Text $file.Enc)) {
                    AddUndo @{ t = 'ini'; a = $ini; b = $repKey; old = $res.Old }
                    Ok ('Repeticiones apagadas (' + $repKey + '): menos escritura a disco durante la partida')
                } else {
                    Warn 'No se pudo apagar la grabacion de repeticiones'
                }
            }
        }
    }
}

# ------------------------------------------------------------------
if ($doChange) {
    Head 'Modo JUGAR: lanzador y guardado del estado'
    try {
        if ($global:undo.Count -gt 0) {
            $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
            [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
        }
        $self = $env:BOSS_SELF
        $dst = Join-Path $dataDir 'BOSSTWK.bat'
        if ($self -and ($self -ne $dst)) { Copy-Item -LiteralPath $self -Destination $dst -Force }
        $taskOk = $false
        if ($cfgTask -eq 1) {
            try {
                $who = $env:USERDOMAIN + '\' + $env:USERNAME
                $act = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument ('/c "' + $dst + '" play adv')
                $set = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit ([TimeSpan]::Zero) -MultipleInstances IgnoreNew
                $prn = New-ScheduledTaskPrincipal -UserId $who -LogonType Interactive -RunLevel Highest
                Register-ScheduledTask -TaskName $taskName -Action $act -Settings $set -Principal $prn -Force -ErrorAction Stop | Out-Null
                AddUndo @{ t = 'task'; a = $taskName; b = ''; old = '' }
                $taskOk = $true
                $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
                [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
            } catch {
                Warn 'No se pudo crear la tarea sin UAC: el lanzador pedira permiso de administrador cada vez'
            }
        }
        $desk = (Join-Path $env:ProgramData 'BOSS')
        $crlf = "`r`n"
        $lp = @('@echo off', 'schtasks /run /tn "BOSS_Fortnite_Play" >nul 2>&1', 'if errorlevel 1 call "%ProgramData%\BOSS\BOSSTWK.bat" play adv')
        if (-not $taskOk) { $lp = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" play adv') }
        $l1 = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" restore adv')
        $l2 = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" check adv')
        $asc = New-Object System.Text.ASCIIEncoding
        [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Fortnite_JUGAR.bat'), (($lp -join $crlf) + $crlf), $asc)
        [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Avanzado_RESTAURAR.bat'), (($l1 -join $crlf) + $crlf), $asc)
        [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Avanzado_COMPROBAR.bat'), (($l2 -join $crlf) + $crlf), $asc)
        Ok 'Modo JUGAR listo: usa BOSSTWK_JUGAR.bat del Escritorio o la opcion 5 del menu'
    } catch {
        Warn 'No se pudo guardar el estado ni crear los lanzadores'
    }
}

# ------------------------------------------------------------------
Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
if ($doChange) { Say '  Reinicia el PC para que el cambio de reloj del arranque surta efecto.' 'Gray' }
Say '==================================================================' 'Green'
Say ''
Say 'Que hace el modo JUGAR (BOSSTWK_JUGAR.bat):' 'Cyan'
Say '  1. Activa el plan BOSS, pausa OneDrive, Teams y similares, y para Windows Update unos minutos.' 'Gray'
Say '  2. Lanza Fortnite por Epic y mide la partida: ping, jitter, perdida, CPU, RAM y (opcional) GPU.' 'Gray'
Say '  3. Al cerrar Fortnite lo deja todo como estaba y te da el informe de la sesion.' 'Gray'
Say '  No toca el proceso de Fortnite: el anticheat queda intacto.' 'Gray'
#PS_MODULE:SMOOTH:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0
$global:fixes = @()
$mode = $env:BOSS_MODE
if (-not $mode) { $mode = 'apply' }
$doChange = ($mode -eq 'apply')

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

$cfgRestore = Flag 'RESTORE_POINT' 1
$cfgHz      = Flag 'DISPLAY_HZ' 1
$cfgMem     = Flag 'MEMORY_AGENT' 1
$cfgCap     = Flag 'FRAME_CAP' 1
$cfgNet     = Flag 'NET_TEST' 1
$cfgIdle    = Flag 'IDLE_REPORT' 1

$dataDir  = Join-Path $env:ProgramData 'BOSS'
$undoFile = Join-Path $dataDir 'smooth_undo.json'
$global:undo = New-Object System.Collections.ArrayList
$global:ids = @{}

# ---------------------- API nativa: pantallas y timer ----------------------
$apiOk = $true
try {
    Add-Type -ErrorAction Stop -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
using System.Text;

public static class BossMon {
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi)]
    struct DEVMODE {
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmDeviceName;
        public short dmSpecVersion; public short dmDriverVersion; public short dmSize; public short dmDriverExtra;
        public int dmFields;
        public int dmPositionX; public int dmPositionY; public int dmDisplayOrientation; public int dmDisplayFixedOutput;
        public short dmColor; public short dmDuplex; public short dmYResolution; public short dmTTOption; public short dmCollate;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string dmFormName;
        public short dmLogPixels;
        public int dmBitsPerPel; public int dmPelsWidth; public int dmPelsHeight; public int dmDisplayFlags; public int dmDisplayFrequency;
        public int dmICMMethod; public int dmICMIntent; public int dmMediaType; public int dmDitherType;
        public int dmReserved1; public int dmReserved2; public int dmPanningWidth; public int dmPanningHeight;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    struct DISPLAY_DEVICE {
        public int cb;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] public string DeviceName;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 128)] public string DeviceString;
        public int StateFlags;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 128)] public string DeviceID;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 128)] public string DeviceKey;
    }

    [DllImport("user32.dll", CharSet = CharSet.Unicode)]
    static extern bool EnumDisplayDevices(string lpDevice, uint iDevNum, ref DISPLAY_DEVICE lpDisplayDevice, uint dwFlags);
    [DllImport("user32.dll", CharSet = CharSet.Ansi)]
    static extern bool EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);
    [DllImport("user32.dll", CharSet = CharSet.Ansi)]
    static extern int ChangeDisplaySettingsEx(string deviceName, ref DEVMODE devMode, IntPtr hwnd, int flags, IntPtr lParam);
    [DllImport("ntdll.dll")]
    static extern int NtQueryTimerResolution(out uint min, out uint max, out uint cur);

    static DEVMODE NewMode() {
        DEVMODE d = new DEVMODE();
        d.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));
        return d;
    }

    public static string List() {
        StringBuilder sb = new StringBuilder();
        for (uint i = 0; i < 16; i++) {
            DISPLAY_DEVICE dd = new DISPLAY_DEVICE();
            dd.cb = Marshal.SizeOf(typeof(DISPLAY_DEVICE));
            if (!EnumDisplayDevices(null, i, ref dd, 0)) break;
            if ((dd.StateFlags & 1) == 0) continue;
            DEVMODE cur = NewMode();
            if (!EnumDisplaySettings(dd.DeviceName, -1, ref cur)) continue;
            int max = 0;
            for (int m = 0; m < 4000; m++) {
                DEVMODE x = NewMode();
                if (!EnumDisplaySettings(dd.DeviceName, m, ref x)) break;
                if (x.dmPelsWidth == cur.dmPelsWidth && x.dmPelsHeight == cur.dmPelsHeight && x.dmBitsPerPel == cur.dmBitsPerPel && x.dmDisplayOrientation == cur.dmDisplayOrientation && (x.dmDisplayFlags & 2) == 0) {
                    if (x.dmDisplayFrequency > max) max = x.dmDisplayFrequency;
                }
            }
            int primary = ((dd.StateFlags & 4) != 0) ? 1 : 0;
            sb.AppendLine(dd.DeviceName + "|" + cur.dmPelsWidth + "|" + cur.dmPelsHeight + "|" + cur.dmDisplayFrequency + "|" + max + "|" + primary + "|" + dd.DeviceString);
        }
        return sb.ToString();
    }

    public static int SetHz(string dev, int hz) {
        DEVMODE m = NewMode();
        if (!EnumDisplaySettings(dev, -1, ref m)) return -999;
        m.dmDisplayFrequency = hz;
        m.dmFields = m.dmFields | 0x400000;
        int t = ChangeDisplaySettingsEx(dev, ref m, IntPtr.Zero, 2, IntPtr.Zero);
        if (t != 0) return t;
        return ChangeDisplaySettingsEx(dev, ref m, IntPtr.Zero, 1, IntPtr.Zero);
    }

    public static string TimerRes() {
        uint mn, mx, cu;
        NtQueryTimerResolution(out mn, out mx, out cu);
        return mn + "|" + mx + "|" + cu;
    }
}
'@
} catch {
    $apiOk = $false
}

# ---------------------- Archivos .ini ----------------------
function ReadIniFile($path) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $bom = (($bytes.Length -ge 2) -and ((($bytes[0] -eq 0xFF) -and ($bytes[1] -eq 0xFE)) -or (($bytes[0] -eq 0xFE) -and ($bytes[1] -eq 0xFF)))) -or (($bytes.Length -ge 3) -and ($bytes[0] -eq 0xEF) -and ($bytes[1] -eq 0xBB) -and ($bytes[2] -eq 0xBF))
    $sr = New-Object System.IO.StreamReader($path, $true)
    $text = $sr.ReadToEnd()
    $enc = $sr.CurrentEncoding
    $sr.Close()
    if (-not $bom) { $enc = New-Object System.Text.UTF8Encoding($false) }
    return [pscustomobject]@{ Text = $text; Enc = $enc }
}

function WriteIniFile($path, $text, $enc) {
    $ro = (Get-Item -LiteralPath $path).IsReadOnly
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $false }
    $okw = $true
    try { [IO.File]::WriteAllText($path, $text, $enc) } catch { $okw = $false }
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $true }
    return $okw
}

function IniGetSet($text, $key, $value) {
    $rx = '(?mi)^(\s*' + [regex]::Escape($key) + '\s*=\s*)(\S+)'
    $m = [regex]::Match($text, $rx)
    if (-not $m.Success) { return $null }
    $old = $m.Groups[2].Value
    $new = [regex]::Replace($text, $rx, ('${1}' + $value))
    return [pscustomobject]@{ Text = $new; Old = $old }
}

function IniVal($text, $key) {
    $m = [regex]::Match($text, ('(?mi)^\s*' + [regex]::Escape($key) + '\s*=\s*(\S+)'))
    if ($m.Success) { return $m.Groups[1].Value }
    return $null
}

# ---------------------- Registro de cambios (deshacer) ----------------------
function UndoId($r) { return ([string]$r.t + '|' + [string]$r.a + '|' + [string]$r.b) }

function LoadUndo {
    if (Test-Path -LiteralPath $undoFile) {
        try {
            $raw = [IO.File]::ReadAllText($undoFile)
            $obj = $raw | ConvertFrom-Json
            foreach ($o in @($obj)) {
                [void]$global:undo.Add($o)
                $global:ids[(UndoId $o)] = $true
            }
        } catch { }
    }
}

function AddUndo($rec) {
    $id = UndoId $rec
    if (-not $global:ids.ContainsKey($id)) {
        [void]$global:undo.Add($rec)
        $global:ids[$id] = $true
    }
}

function RevertOne($r) {
    switch ([string]$r.t) {
        'display' {
            if (-not $apiOk) { return $false }
            return ([BossMon]::SetHz([string]$r.a, [int]$r.old) -eq 0)
        }
        'ini' {
            try {
                if (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) { return $false }
                if (-not (Test-Path -LiteralPath ([string]$r.a))) { return $false }
                $ini = ReadIniFile ([string]$r.a)
                $res = IniGetSet $ini.Text ([string]$r.b) ([string]$r.old)
                if ($null -eq $res) { return $false }
                return (WriteIniFile ([string]$r.a) $res.Text $ini.Enc)
            } catch { return $false }
        }
        'mma' {
            try {
                if ([string]$r.a -eq 'MemoryCompression') { Enable-MMAgent -MemoryCompression -ErrorAction Stop }
                if ([string]$r.a -eq 'PageCombining') { Enable-MMAgent -PageCombining -ErrorAction Stop }
                return $true
            } catch { return $false }
        }
    }
    return $false
}

function RunRevert($list) {
    $arr = @($list)
    [array]::Reverse($arr)
    $n = 0
    foreach ($r in $arr) {
        if (RevertOne $r) { $n++ }
    }
    return $n
}

# ---------------------- Utilidades de medicion ----------------------
function PingOnce($target, $timeout) {
    try {
        $p = New-Object System.Net.NetworkInformation.Ping
        $r = $p.Send($target, $timeout)
        if ($r.Status -eq 'Success') { return [double]$r.RoundtripTime }
    } catch { }
    return $null
}

function Chk($label, $okFlag, $fix) {
    if ($okFlag) {
        Ok $label
    } else {
        Warn ($label + '   -> ' + $fix)
        $global:fixes += $fix
    }
}

function GetEdidInfo {
    $res = @()
    foreach ($m in @(Get-PnpDevice -Class Monitor -PresentOnly -ErrorAction SilentlyContinue)) {
        $k = 'HKLM:\SYSTEM\CurrentControlSet\Enum\' + [string]$m.InstanceId + '\Device Parameters'
        $e = (Get-ItemProperty -LiteralPath $k -Name EDID -ErrorAction SilentlyContinue).EDID
        if ((-not $e) -or ($e.Length -lt 128)) { continue }
        $name = ''
        $vmin = 0
        $vmax = 0
        foreach ($off in @(54, 72, 90, 108)) {
            if (($e[$off] -eq 0) -and ($e[$off + 1] -eq 0) -and ($e[$off + 2] -eq 0)) {
                if ($e[$off + 3] -eq 0xFC) {
                    $name = ([System.Text.Encoding]::ASCII.GetString($e, $off + 5, 13)).Trim([char]10, [char]0, [char]32)
                } elseif ($e[$off + 3] -eq 0xFD) {
                    $vmin = [int]$e[$off + 5]
                    $vmax = [int]$e[$off + 6]
                    $fl = $e[$off + 4] -band 3
                    if ($fl -eq 2) { $vmax += 255 } elseif ($fl -eq 3) { $vmax += 255; $vmin += 255 }
                }
            }
        }
        $res += [pscustomobject]@{ Name = $name; VMin = $vmin; VMax = $vmax }
    }
    return $res
}

function SampleProcs($secs) {
    $cpu = @{}
    $io = @{}
    $logical = [Math]::Max(1, [Environment]::ProcessorCount)
    for ($i = 0; $i -lt ($secs + 1); $i++) {
        $rows = @(Get-CimInstance Win32_PerfFormattedData_PerfProc_Process -ErrorAction SilentlyContinue | Where-Object { ($_.Name -ne '_Total') -and ($_.Name -ne 'Idle') -and ($_.Name -notmatch '^(powershell|WmiPrvSE|conhost)') })
        if ($i -gt 0) {
            foreach ($r in $rows) {
                $n = [string]$r.Name
                if (-not $cpu.ContainsKey($n)) {
                    $cpu[$n] = 0.0
                    $io[$n] = 0.0
                }
                $cpu[$n] += [double]$r.PercentProcessorTime / $logical
                $io[$n] += [double]$r.IODataBytesPersec
            }
        }
        Start-Sleep -Seconds 1
    }
    return @{ cpu = $cpu; io = $io; n = $secs }
}

# ====================== MODO RESTAURAR ======================
if ($mode -eq 'restore') {
    Head 'Restaurar los valores originales'
    if (-not (Test-Path -LiteralPath $undoFile)) {
        Warn 'No hay ningun estado guardado para restaurar'
        exit 0
    }
    $items = @([IO.File]::ReadAllText($undoFile) | ConvertFrom-Json)
    $done = RunRevert $items
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    Move-Item -LiteralPath $undoFile -Destination (Join-Path $dataDir ('smooth_undo_restaurado_' + $stamp + '.json')) -Force
    Ok ('Cambios revertidos: ' + $done + ' de ' + $items.Count)
    Say ''
    Say '  Reinicia el PC para completar la restauracion.' 'Gray'
    exit 0
}

# ====================== LECTURA Y AJUSTES ======================
LoadUndo
if ($doChange) { New-Item -ItemType Directory -Path $dataDir -Force | Out-Null }

Head 'Tu equipo'
$cv = Get-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -ErrorAction SilentlyContinue
$cpuInfo = Get-CimInstance Win32_Processor -ErrorAction SilentlyContinue | Select-Object -First 1
$ramGb = [Math]::Round((Get-CimInstance Win32_ComputerSystem -ErrorAction SilentlyContinue).TotalPhysicalMemory / 1GB, 0)
Say ('  Windows ' + $cv.DisplayVersion + ' build ' + $cv.CurrentBuildNumber + '.' + $cv.UBR + '   ' + $cpuInfo.Name + '   ' + $ramGb + ' GB de RAM')
$gpus = @(Get-CimInstance Win32_VideoController -ErrorAction SilentlyContinue | Where-Object { [string]$_.PNPDeviceID -like 'PCI\*' })
$hasNv = $false
foreach ($g in $gpus) {
    Say ('  GPU: ' + $g.Name + '  driver ' + $g.DriverVersion) 'DarkGray'
    if ([string]$g.PNPDeviceID -match 'VEN_10DE') { $hasNv = $true }
}

if ($doChange -and ($cfgRestore -eq 1)) {
    Head 'Punto de restauracion de Windows'
    try {
        Enable-ComputerRestore -Drive ($env:SystemDrive + '\') -ErrorAction Stop
        $srKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore'
        $oldFreq = (Get-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue).SystemRestorePointCreationFrequency
        Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value 0 -Type DWord -Force
        Checkpoint-Computer -Description 'BOSS Smooth (antes de aplicar)' -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
        if ($null -ne $oldFreq) { Set-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -Value $oldFreq -Type DWord -Force } else { Remove-ItemProperty -LiteralPath $srKey -Name SystemRestorePointCreationFrequency -ErrorAction SilentlyContinue }
        Ok 'Punto de restauracion creado'
    } catch {
        Warn 'No se pudo crear el punto de restauracion (se sigue: todo queda guardado para deshacer)'
    }
}

# ------------------------------------------------------------------
Head 'Pantallas: todas a su frecuencia maxima'
$edids = @(GetEdidInfo)
$vrrCapable = $false
foreach ($m in $edids) {
    Say ('  Monitor: ' + $m.Name + '   rango vertical anunciado: ' + $m.VMin + ' a ' + $m.VMax + ' Hz') 'DarkGray'
    if (($m.VMin -gt 0) -and ($m.VMin -le 60) -and ($m.VMax -ge 100)) { $vrrCapable = $true }
}
if ($vrrCapable) { Say '  Rango amplio: la pantalla parece admitir VRR (G-SYNC o FreeSync).' 'DarkGray' }
$displays = @()
if ($apiOk) {
    foreach ($line in (([BossMon]::List()) -split "`n")) {
        $p = $line.Trim().Split('|')
        if ($p.Count -ge 7) {
            $displays += [pscustomobject]@{ Dev = $p[0]; W = [int]$p[1]; H = [int]$p[2]; Hz = [int]$p[3]; Max = [int]$p[4]; Primary = ([int]$p[5] -eq 1); Name = $p[6] }
        }
    }
}
$primaryHz = 0
$allMax = $true
$hzSet = @()
foreach ($d in $displays) {
    $tag = ''
    if ($d.Primary) { $tag = ' (principal)' }
    Say ('  ' + $d.Dev + $tag + ': ' + $d.W + 'x' + $d.H + ' a ' + $d.Hz + ' Hz, maximo a esa resolucion ' + $d.Max + ' Hz   [' + $d.Name + ']')
    $finalHz = $d.Hz
    if ($d.Max -gt $d.Hz) {
        if ($doChange -and ($cfgHz -eq 1)) {
            $rc = [BossMon]::SetHz($d.Dev, $d.Max)
            if ($rc -eq 0) {
                AddUndo @{ t = 'display'; a = [string]$d.Dev; b = ''; old = $d.Hz }
                $finalHz = $d.Max
                Ok ($d.Dev + ': subida de ' + $d.Hz + ' a ' + $d.Max + ' Hz')
            } else {
                $allMax = $false
                Warn ($d.Dev + ': no se pudo subir a ' + $d.Max + ' Hz (codigo ' + $rc + '). Ponlo en Configuracion, Pantalla, Pantalla avanzada')
            }
        } else {
            $allMax = $false
            Warn ($d.Dev + ' esta a ' + $d.Hz + ' Hz y llega a ' + $d.Max + ' Hz')
        }
    } else {
        Ok ($d.Dev + ' ya va a su frecuencia maxima (' + $d.Hz + ' Hz)')
    }
    $hzSet += $finalHz
    if ($d.Primary) { $primaryHz = $finalHz }
}
if ($displays.Count -eq 0) { Warn 'No se pudo leer la lista de pantallas' }
if (($hzSet | Select-Object -Unique).Count -gt 1) { Warn 'Tus pantallas van a frecuencias distintas: la mas lenta puede meter microtirones en el escritorio y en juegos en ventana. Pon todas a la maxima que admitan.' }

# ------------------------------------------------------------------
Head 'RAM'
$mods = @(Get-CimInstance Win32_PhysicalMemory -ErrorAction SilentlyContinue)
$slow = $false
foreach ($mo in $mods) {
    $gb = [Math]::Round([double]$mo.Capacity / 1GB, 0)
    Say ('  ' + $mo.DeviceLocator + ': ' + $gb + ' GB ' + ([string]$mo.Manufacturer).Trim() + ' ' + ([string]$mo.PartNumber).Trim() + '   nominal ' + $mo.Speed + ' MT/s, en uso ' + $mo.ConfiguredClockSpeed + ' MT/s') 'DarkGray'
    if (([int]$mo.ConfiguredClockSpeed -gt 0) -and ([int]$mo.Speed -gt 0) -and ([int]$mo.ConfiguredClockSpeed -lt [int]$mo.Speed)) { $slow = $true }
}
if ($mods.Count -gt 0) {
    $speeds = @($mods | ForEach-Object { [int]$_.ConfiguredClockSpeed } | Select-Object -Unique)
    if ($speeds.Count -gt 1) { Warn 'Los modulos van a velocidades distintas: mezclar kits resta frecuencia y estabilidad' }
    if ($slow) { Warn 'La RAM corre mas lenta que su velocidad nominal: el perfil EXPO/XMP no esta aplicado' } else { Ok ('RAM a ' + $speeds[0] + ' MT/s, ' + $mods.Count + ' modulo(s)') }
}
if ($ramGb -ge 32) {
    $mma = Get-MMAgent -ErrorAction SilentlyContinue
    if ($mma) {
        foreach ($pair in @(@('MemoryCompression', 'compresion de memoria'), @('PageCombining', 'combinado de paginas'))) {
            $isOn = [bool]$mma.($pair[0])
            if ($isOn -and $doChange -and ($cfgMem -eq 1)) {
                try {
                    if ($pair[0] -eq 'MemoryCompression') { Disable-MMAgent -MemoryCompression -ErrorAction Stop } else { Disable-MMAgent -PageCombining -ErrorAction Stop }
                    AddUndo @{ t = 'mma'; a = [string]$pair[0]; b = ''; old = '1' }
                    Ok ('Sin ' + $pair[1] + ': menos trabajo de CPU en segundo plano (tras reiniciar)')
                } catch {
                    Warn ('No se pudo desactivar la ' + $pair[1])
                }
            } elseif ($isOn) {
                Say ('  La ' + $pair[1] + ' sigue activa') 'DarkGray'
            } else {
                Say ('  La ' + $pair[1] + ' ya esta desactivada') 'DarkGray'
            }
        }
    }
} else {
    Say '  Con menos de 32 GB se deja la compresion de memoria como esta' 'DarkGray'
}

# ------------------------------------------------------------------
Head 'Grafica: estado real'
$smi = Join-Path $env:SystemRoot 'System32\nvidia-smi.exe'
if (-not (Test-Path -LiteralPath $smi)) { $smi = 'C:\Program Files\NVIDIA Corporation\NVSMI\nvidia-smi.exe' }
if ($hasNv -and (Test-Path -LiteralPath $smi)) {
    $q = 'name,pcie.link.gen.current,pcie.link.gen.max,pcie.link.width.current,pcie.link.width.max,pstate,clocks.sm,clocks.max.sm,power.draw,power.limit,temperature.gpu'
    $lines = @(& $smi ('--query-gpu=' + $q) '--format=csv,noheader,nounits' 2>$null)
    foreach ($ln in $lines) {
        $f = @(([string]$ln).Split(',') | ForEach-Object { $_.Trim() })
        if ($f.Count -ge 11) {
            Say ('  ' + $f[0] + '   estado ' + $f[5] + '   reloj ' + $f[6] + ' de ' + $f[7] + ' MHz   consumo ' + $f[8] + ' de ' + $f[9] + ' W   ' + $f[10] + ' C') 'DarkGray'
            Say ('  PCIe: gen ' + $f[1] + ' de ' + $f[2] + ', ancho x' + $f[3] + ' de x' + $f[4] + '   (en reposo baja a proposito; ejecuta COMPROBAR con el juego abierto)') 'DarkGray'
            if (([int]$f[4] -gt 0) -and ([int]$f[3] -lt [int]$f[4]) -and (($f[5] -eq 'P0') -or ($f[5] -eq 'P1') -or ($f[5] -eq 'P2'))) { Warn 'Bajo carga el enlace PCIe va con menos carriles de los que admite: revisa que la GPU este bien asentada en la ranura principal' }
        }
    }
    $tr = (& $smi '--query-gpu=clocks_throttle_reasons.active' '--format=csv,noheader' 2>$null | Select-Object -First 1)
    if ($tr -and ([string]$tr -match '0x([0-9A-Fa-f]+)')) {
        $bits = [Convert]::ToUInt64($Matches[1], 16)
        $names = @()
        if (($bits -band 0x4) -ne 0) { $names += 'limite de potencia por software' }
        if (($bits -band 0x8) -ne 0) { $names += 'freno por hardware' }
        if (($bits -band 0x20) -ne 0) { $names += 'limite termico por software' }
        if (($bits -band 0x40) -ne 0) { $names += 'limite termico por hardware' }
        if (($bits -band 0x80) -ne 0) { $names += 'freno de potencia por hardware' }
        if ($names.Count -gt 0) { Warn ('La GPU esta limitando su reloj ahora mismo: ' + ($names -join ', ')) } else { Ok 'La GPU no esta limitando su reloj por temperatura ni potencia' }
    }
} elseif ($hasNv) {
    Say '  No se encontro nvidia-smi: se omite la lectura detallada' 'DarkGray'
} else {
    Say '  GPU no NVIDIA: usa Adrenalin para ver reloj, temperatura y consumo' 'DarkGray'
}

# ------------------------------------------------------------------
Head 'CPU y planificador'
$perfVals = @()
for ($i = 0; $i -lt 5; $i++) {
    $row = Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation -ErrorAction SilentlyContinue | Where-Object { [string]$_.Name -eq '_Total' } | Select-Object -First 1
    if (($i -gt 0) -and $row) { $perfVals += [double]$row.PercentProcessorPerformance }
    Start-Sleep -Seconds 1
}
$perfAvg = $null
if ($perfVals.Count -gt 0) { $perfAvg = [Math]::Round(($perfVals | Measure-Object -Average).Average, 0) }
if ($null -ne $perfAvg) { Say ('  Rendimiento relativo de la CPU en reposo: ' + $perfAvg + ' por ciento (con el plan BOSS debe ser 100 o mas)') 'DarkGray' }
if ($apiOk) {
    $tr2 = ([BossMon]::TimerRes()).Split('|')
    Say ('  Resolucion del timer del sistema: ' + ([double]$tr2[2] / 10000.0) + ' ms (la mejor posible: ' + ([double]$tr2[1] / 10000.0) + ' ms)') 'DarkGray'
}

# ------------------------------------------------------------------
Head 'Auditoria: lo aplicado por los demas BOSS'
$planOut = (& powercfg.exe -getactivescheme | Out-String)
Chk 'Plan de energia BOSS activo' ($planOut -match 'b0550000-b055-4055-8055-b05500b05500') 'el modulo 1 (Plan de energia)'
if ($null -ne $perfAvg) { Chk ('CPU sin bajar de reloj en reposo (' + $perfAvg + ' por ciento)') ($perfAvg -ge 95) 'el modulo 1 (Plan de energia)' }
$mouseK = Get-ItemProperty -LiteralPath 'HKCU:\Control Panel\Mouse' -ErrorAction SilentlyContinue
Chk 'Raton sin aceleracion de Windows' (([string]$mouseK.MouseSpeed -eq '0') -and ([string]$mouseK.MouseSensitivity -eq '10')) 'el modulo 2 (Teclado y raton)'
$kbK = Get-ItemProperty -LiteralPath 'HKCU:\Control Panel\Keyboard' -ErrorAction SilentlyContinue
Chk 'Teclado con retardo minimo' ([string]$kbK.KeyboardDelay -eq '0') 'el modulo 2 (Teclado y raton)'
$dtStart = (Get-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\DiagTrack' -Name Start -ErrorAction SilentlyContinue).Start
Chk 'Servicio de telemetria desactivado' ($dtStart -eq 4) 'el modulo 3 (Sistema)'
$dvr = (Get-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR' -Name AppCaptureEnabled -ErrorAction SilentlyContinue).AppCaptureEnabled
Chk 'Grabacion en segundo plano (Game DVR) apagada' ($dvr -eq 0) 'el modulo 3 (Sistema)'
$gt = (Get-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel' -Name GlobalTimerResolutionRequests -ErrorAction SilentlyContinue).GlobalTimerResolutionRequests
Chk 'Peticiones de timer globales activas' ($gt -eq 1) 'el modulo 5 (Afinidad)'
$hold = Get-Process -Name 'BossTimerHolder' -ErrorAction SilentlyContinue
if ($hold) { Ok 'Mantenedor del timer en ejecucion' } elseif (Test-Path -LiteralPath (Join-Path $dataDir 'BossTimerHolder.exe')) { Warn 'El mantenedor del timer esta instalado pero no corre (cierra sesion y entra de nuevo)' } else { Say '  Mantenedor del timer: no instalado (el modulo 5 (Afinidad) solo lo instala si la mejora es clara)' 'DarkGray' }
Chk 'Afinidad de interrupciones aplicada' (Test-Path -LiteralPath (Join-Path $dataDir 'aff_undo.json')) 'el modulo 5 (Afinidad)'
Chk 'Ajustes de red aplicados' (Test-Path -LiteralPath (Join-Path $dataDir 'net_undo.json')) 'el modulo 4 (Red)'
$duck = (Get-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Multimedia\Audio' -Name UserDuckingPreference -ErrorAction SilentlyContinue).UserDuckingPreference
Chk 'Audio: Windows no baja el volumen del juego' ($duck -eq 3) 'el modulo 6 (Audio)'
$fs = (Get-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name HiberbootEnabled -ErrorAction SilentlyContinue).HiberbootEnabled
Chk 'Inicio rapido desactivado (arranque limpio)' ($fs -eq 0) 'el modulo 1 (Plan de energia)'
$dg = Get-CimInstance -Namespace 'root\Microsoft\Windows\DeviceGuard' -ClassName Win32_DeviceGuard -ErrorAction SilentlyContinue
if ($dg) {
    if ([int]$dg.VirtualizationBasedSecurityStatus -eq 2) { Say '  VBS activo: cuesta algunos FPS (el modulo 3 (Sistema) con DISABLE_VBS=1 lo quita, a costa de proteccion)' 'DarkGray' } else { Ok 'VBS apagado: sin coste de FPS' }
}
Chk 'Todas las pantallas a su frecuencia maxima' $allMax 'el modulo 8 (Smooth) (o Configuracion, Pantalla)'
$uniqFixes = @($global:fixes | Select-Object -Unique)
if ($uniqFixes.Count -gt 0) { Say ('  Te falta ejecutar: ' + ($uniqFixes -join ', ')) 'Yellow' }

# ------------------------------------------------------------------
if ($cfgIdle -eq 1) {
    Head 'Ruido en reposo: quien consume mientras no haces nada (6 s)'
    $sp = SampleProcs 6
    $topCpu = @($sp.cpu.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 6)
    foreach ($e in $topCpu) {
        $avgc = [Math]::Round($e.Value / $sp.n, 1)
        if ($avgc -ge 0.3) { Say ('  CPU {0,5} %   {1}' -f $avgc, $e.Key) 'DarkGray' }
    }
    $topIo = @($sp.io.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 5)
    foreach ($e in $topIo) {
        $kb = [Math]::Round(($e.Value / $sp.n) / 1KB, 0)
        if ($kb -ge 100) { Say ('  E/S {0,7} KB/s   {1}' -f $kb, $e.Key) 'DarkGray' }
    }
    $big = @($topCpu | Where-Object { ($_.Value / $sp.n) -ge 2.0 })
    if ($big.Count -gt 0) { Warn ('Hay procesos que usan mas del 2 por ciento de la CPU en reposo: ' + (($big | ForEach-Object { $_.Key }) -join ', ') + '. Cierralos antes de jugar.') } else { Ok 'Sin procesos que ensucien la CPU en reposo' }
}

# ------------------------------------------------------------------
if ($cfgNet -eq 1) {
    Head 'Ping a Fortnite: mejor region y estabilidad'
    $regions = [ordered]@{ eu = 'Europa'; nae = 'NA-Este'; nac = 'NA-Centro'; naw = 'NA-Oeste'; oce = 'Oceania'; br = 'Brasil'; asia = 'Asia'; me = 'Oriente Medio' }
    $best = $null
    $bestMs = [double]::MaxValue
    foreach ($key in $regions.Keys) {
        $vals = @()
        for ($k = 0; $k -lt 3; $k++) {
            $v = PingOnce ('ping-' + $key + '.ds.on.epicgames.com') 1000
            if ($null -ne $v) { $vals += $v }
        }
        if ($vals.Count -gt 0) {
            $avg = ($vals | Measure-Object -Average).Average
            if ($avg -lt $bestMs) {
                $bestMs = $avg
                $best = $key
            }
        }
    }
    if (-not $best) {
        Warn 'No respondio ningun punto de ping de Epic'
    } else {
        $host2 = 'ping-' + $best + '.ds.on.epicgames.com'
        Say ('  Mejor region: ' + $regions[$best] + ' (' + $host2 + ')') 'DarkGray'
        $rt = @()
        $lost = 0
        for ($k = 0; $k -lt 40; $k++) {
            $v = PingOnce $host2 800
            if ($null -ne $v) { $rt += $v } else { $lost++ }
            Start-Sleep -Milliseconds 120
        }
        if ($rt.Count -gt 1) {
            $avg = ($rt | Measure-Object -Average).Average
            $max = ($rt | Measure-Object -Maximum).Maximum
            $jit = 0.0
            for ($k = 1; $k -lt $rt.Count; $k++) { $jit += [Math]::Abs($rt[$k] - $rt[$k - 1]) }
            $jit = $jit / ($rt.Count - 1)
            $lossPct = [Math]::Round(100.0 * $lost / 40, 1)
            Say ('  Ping medio {0:N1} ms | maximo {1:N0} ms | jitter {2:N1} ms | perdida {3} %' -f $avg, $max, $jit, $lossPct)
            if (($lossPct -eq 0) -and ($jit -le 3)) { Ok 'Conexion estable hacia Epic: sin perdida y con poco jitter' } else { Warn 'Hay perdida o jitter: si vas por Wi-Fi usa cable; si ya usas cable, mira el modulo 4 (Red) y el SQM del router' }
            Say '  Nota: el ping no puede bajar de lo que tarda la luz hasta el servidor; lo que si baja es el jitter y la perdida.' 'DarkGray'
        } else {
            Warn 'Pocas respuestas del servidor: no se pudo medir la estabilidad'
        }
    }
}

# ------------------------------------------------------------------
Head 'Fortnite: configuracion de fluidez'
$ini = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'
if (-not (Test-Path -LiteralPath $ini)) {
    Warn 'No existe GameUserSettings.ini: abre Fortnite una vez, cierralo y repite'
} else {
    $file = ReadIniFile $ini
    foreach ($k in @('FrameRateLimit', 'bUseVSync', 'FullscreenMode', 'PreferredRHI', 'PreferredFeatureLevel', 'bAllowMultithreadedRendering')) {
        $v = IniVal $file.Text $k
        if ($null -ne $v) { Say ('  ' + $k + ' = ' + $v) 'DarkGray' }
    }
    foreach ($line in ($file.Text -split "`n")) {
        $tl = $line.Trim()
        if ($tl -match '^([^\s=\[;]+)\s*=\s*(\S+)') {
            $kn = $Matches[1]
            $kv = $Matches[2]
            if ($kn -match '(?i)reflex|lowlatency') { Say ('  ' + $kn + ' = ' + $kv) 'DarkGray' }
        }
    }
    $capTarget = 0
    if ($primaryHz -gt 10) {
        if ($cfgCap -eq 2) { $capTarget = $primaryHz - 3 } elseif (($cfgCap -eq 1) -and $vrrCapable) { $capTarget = $primaryHz - 3 }
    }
    if (-not $doChange) {
        Say '  (modo comprobar: no se escribe nada)' 'DarkGray'
    } elseif ($capTarget -le 0) {
        if ($cfgCap -eq 0) { Say '  Limite de FPS: no se toca (FRAME_CAP=0)' 'DarkGray' } else { Say '  Limite de FPS: no se toca porque no se detecta pantalla VRR (sin VRR el menor retardo es sin limite)' 'DarkGray' }
    } elseif (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue) {
        Warn 'Fortnite esta abierto: cierralo y vuelve a ejecutar para fijar el limite de FPS'
    } else {
        $bak = $ini + '.boss_smooth.bak'
        if (-not (Test-Path -LiteralPath $bak)) { Copy-Item -LiteralPath $ini -Destination $bak -Force }
        $res = IniGetSet $file.Text 'FrameRateLimit' ($capTarget.ToString() + '.000000')
        if ($null -eq $res) {
            Warn 'Tu ini no tiene la clave FrameRateLimit: ponlo dentro del juego (Ajustes, Video)'
        } elseif ($res.Old -eq ($capTarget.ToString() + '.000000')) {
            Ok ('El limite de FPS ya esta en ' + $capTarget + ' (Hz menos 3)')
        } elseif (WriteIniFile $ini $res.Text $file.Enc) {
            AddUndo @{ t = 'ini'; a = $ini; b = 'FrameRateLimit'; old = $res.Old }
            Ok ('Limite de FPS de Fortnite en ' + $capTarget + ' (Hz menos 3): con VRR mantiene el juego dentro del rango y sin vsync forzado')
        } else {
            Warn 'No se pudo escribir el limite de FPS'
        }
    }
}

# ------------------------------------------------------------------
if ($doChange) {
    Head 'Guardando el estado para poder deshacer'
    try {
        if ($global:undo.Count -gt 0) {
            $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
            [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
        }
        $self = $env:BOSS_SELF
        $dst = Join-Path $dataDir 'BOSSTWK.bat'
        if ($self -and ($self -ne $dst)) { Copy-Item -LiteralPath $self -Destination $dst -Force }
        $desk = (Join-Path $env:ProgramData 'BOSS')
        $crlf = "`r`n"
        $l1 = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" restore smooth')
        $l2 = @('@echo off', 'call "%ProgramData%\BOSS\BOSSTWK.bat" check smooth')
        [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Smooth_RESTAURAR.bat'), (($l1 -join $crlf) + $crlf), (New-Object System.Text.ASCIIEncoding))
        [IO.File]::WriteAllText((Join-Path $desk 'BOSS_Smooth_COMPROBAR.bat'), (($l2 -join $crlf) + $crlf), (New-Object System.Text.ASCIIEncoding))
        Ok 'Estado guardado: usa COMPROBAR y RESTAURAR del menu de BOSSTWK'
    } catch {
        Warn 'No se pudo guardar el estado de restauracion'
    }
}

# ------------------------------------------------------------------
Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
if ($doChange) { Say '  Reinicia el PC para completar los cambios de memoria.' 'Gray' }
Say '==================================================================' 'Green'
Say ''
Say 'Para que se sienta suave de verdad (una vez, a mano):' 'Cyan'
Say '  - Panel de control de NVIDIA, Configurar G-SYNC: activar (si tu monitor lo admite) y marcar tambien modo ventana.' 'Gray'
Say '  - Fortnite, Video: NVIDIA Reflex en On + Boost. Con G-SYNC y Reflex el propio Reflex ya limita justo por debajo de los Hz.' 'Gray'
Say '  - Menor retardo absoluto = sin G-SYNC, sin vsync y sin limite de FPS (a costa de tearing); suavidad = G-SYNC con limite Hz menos 3. Elige uno.' 'Gray'
Say '  - Raton: polling a 1000 Hz como minimo; el limite de FPS no cambia nada si el raton va a 125 o 500 Hz.' 'Gray'
Say '  - Monitor: VRR activado, Overdrive en medio (el maximo deja fantasmas inversos) y cable DisplayPort.' 'Gray'
Say '  - Cierra Discord con overlay, Chrome y launchers mientras juegas: el informe de arriba te dice quien consume.' 'Gray'
#PS_MODULE:FLUID:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0
$mode = $env:BOSS_MODE
if (-not $mode) { $mode = 'apply' }
$doChange = ($mode -eq 'apply')

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

$cfgProfile = ([string]$env:FLUID_PROFILE).Trim().ToLower()
if (@('rapido', 'fluido', 'keep') -notcontains $cfgProfile) { $cfgProfile = 'rapido' }
$cfgKeyTest = Flag 'KEY_TEST' 1
$cfgSecs    = Flag 'FPS_SECONDS' 40
$cfgSlider  = Flag 'RESTORE_MOUSE_SLIDER' 1
$cfgFpsGpu  = Flag 'FPS_GPU' 1
if (($cfgSecs -lt 15) -or ($cfgSecs -gt 180)) { $cfgSecs = 40 }

$dataDir  = Join-Path $env:ProgramData 'BOSS'
$undoFile = Join-Path $dataDir 'fluid_undo.json'
$logFile  = Join-Path $dataDir 'fps_log.txt'
$global:undo = New-Object System.Collections.ArrayList
$global:ids = @{}
$fnProc = 'FortniteClient-Win64-Shipping'

# ---------------------- API nativa: aplicar teclado y raton en caliente ----------------------
$apiOk = $true
try {
    Add-Type -ErrorAction Stop -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public static class BossSpi {
    [DllImport("user32.dll", SetLastError = true)]
    static extern bool SystemParametersInfo(uint a, uint b, IntPtr c, uint d);
    public static bool KeyDelay(int v) { return SystemParametersInfo(0x0017, (uint)v, IntPtr.Zero, 3); }
    public static bool KeySpeed(int v) { return SystemParametersInfo(0x000B, (uint)v, IntPtr.Zero, 3); }
    public static bool MouseSpeed(int v) { return SystemParametersInfo(0x0071, 0, (IntPtr)v, 3); }
}
'@
} catch {
    $apiOk = $false
}

# ---------------------- Archivos .ini ----------------------
function ReadIniFile($path) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $bom = (($bytes.Length -ge 2) -and ((($bytes[0] -eq 0xFF) -and ($bytes[1] -eq 0xFE)) -or (($bytes[0] -eq 0xFE) -and ($bytes[1] -eq 0xFF)))) -or (($bytes.Length -ge 3) -and ($bytes[0] -eq 0xEF) -and ($bytes[1] -eq 0xBB) -and ($bytes[2] -eq 0xBF))
    $sr = New-Object System.IO.StreamReader($path, $true)
    $text = $sr.ReadToEnd()
    $enc = $sr.CurrentEncoding
    $sr.Close()
    if (-not $bom) { $enc = New-Object System.Text.UTF8Encoding($false) }
    return [pscustomobject]@{ Text = $text; Enc = $enc }
}

function WriteIniFile($path, $text, $enc) {
    $ro = (Get-Item -LiteralPath $path).IsReadOnly
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $false }
    $okw = $true
    try { [IO.File]::WriteAllText($path, $text, $enc) } catch { $okw = $false }
    if ($ro) { Set-ItemProperty -LiteralPath $path -Name IsReadOnly -Value $true }
    return $okw
}

function IniGetSet($text, $key, $value) {
    $rx = '(?mi)^(\s*' + [regex]::Escape($key) + '\s*=\s*)(\S+)'
    $m = [regex]::Match($text, $rx)
    if (-not $m.Success) { return $null }
    $old = $m.Groups[2].Value
    $new = [regex]::Replace($text, $rx, ('${1}' + $value))
    return [pscustomobject]@{ Text = $new; Old = $old }
}

function IniVal($text, $key) {
    $m = [regex]::Match($text, ('(?mi)^\s*' + [regex]::Escape($key) + '\s*=\s*(\S+)'))
    if ($m.Success) { return $m.Groups[1].Value }
    return $null
}

# ---------------------- Registro de cambios (deshacer) ----------------------
function UndoId($r) { return ([string]$r.t + '|' + [string]$r.a + '|' + [string]$r.b) }

function LoadUndo {
    if (Test-Path -LiteralPath $undoFile) {
        try {
            $raw = [IO.File]::ReadAllText($undoFile)
            $obj = $raw | ConvertFrom-Json
            foreach ($o in @($obj)) {
                [void]$global:undo.Add($o)
                $global:ids[(UndoId $o)] = $true
            }
        } catch { }
    }
}

function AddUndo($rec) {
    $id = UndoId $rec
    if (-not $global:ids.ContainsKey($id)) {
        [void]$global:undo.Add($rec)
        $global:ids[$id] = $true
    }
}

function SetReg($path, $name, $value, $type) {
    try {
        if (-not (Test-Path -LiteralPath $path)) { New-Item -Path $path -Force -ErrorAction Stop | Out-Null }
        New-ItemProperty -LiteralPath $path -Name $name -Value $value -PropertyType $type -Force -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

function RegQuiet($path, $name, $value, $type) {
    $rec = @{ t = 'reg'; a = $path; b = $name; old = $null; x = $false; y = $type }
    try {
        if (Test-Path -LiteralPath $path) {
            $key = Get-Item -LiteralPath $path -ErrorAction Stop
            $cur = $key.GetValue($name, $null)
            if ($null -ne $cur) {
                $rec.x = $true
                $rec.old = $cur
                $rec.y = [string]$key.GetValueKind($name)
                if ([string]$cur -eq [string]$value) { return 'same' }
            }
        }
    } catch { }
    if (SetReg $path $name $value $type) {
        AddUndo $rec
        return 'changed'
    }
    return 'fail'
}

function RevertOne($r) {
    switch ([string]$r.t) {
        'reg' {
            if ($r.x) {
                if ([string]$r.y -eq 'DWord') { return (SetReg $r.a $r.b ([int]$r.old) 'DWord') }
                return (SetReg $r.a $r.b ([string]$r.old) 'String')
            }
            Remove-ItemProperty -LiteralPath $r.a -Name $r.b -ErrorAction SilentlyContinue
            return $true
        }
        'ini' {
            try {
                if (Get-Process -Name $fnProc -ErrorAction SilentlyContinue) { return $false }
                if (-not (Test-Path -LiteralPath ([string]$r.a))) { return $false }
                $ini = ReadIniFile ([string]$r.a)
                $res = IniGetSet $ini.Text ([string]$r.b) ([string]$r.old)
                if ($null -eq $res) { return $false }
                return (WriteIniFile ([string]$r.a) $res.Text $ini.Enc)
            } catch { return $false }
        }
    }
    return $false
}

function RunRevert($list) {
    $arr = @($list)
    [array]::Reverse($arr)
    $n = 0
    foreach ($r in $arr) {
        if (RevertOne $r) { $n++ }
    }
    return $n
}

function ApplyLiveInput {
    if (-not $apiOk) { return }
    $kb = Get-ItemProperty -LiteralPath 'HKCU:\Control Panel\Keyboard' -ErrorAction SilentlyContinue
    $ms = Get-ItemProperty -LiteralPath 'HKCU:\Control Panel\Mouse' -ErrorAction SilentlyContinue
    if ($kb -and ($null -ne $kb.KeyboardDelay) -and ($null -ne $kb.KeyboardSpeed)) {
        [void][BossSpi]::KeyDelay([int]$kb.KeyboardDelay)
        [void][BossSpi]::KeySpeed([int]$kb.KeyboardSpeed)
    }
    if ($ms -and ($null -ne $ms.MouseSensitivity)) { [void][BossSpi]::MouseSpeed([int]$ms.MouseSensitivity) }
}

# ---------------------- Utilidades de lectura ----------------------
function FirstKmBackup {
    $roots = @((Join-Path $env:ProgramData 'BOSS'), [Environment]::GetFolderPath('Desktop'))
    $found = @()
    foreach ($r in $roots) { $found += @(Get-ChildItem -LiteralPath $r -Directory -Filter 'BOSS_KM_Backup_*' -ErrorAction SilentlyContinue) }
    return ($found | Sort-Object Name | Select-Object -First 1)
}

function RegFileValue($file, $name) {
    if (-not (Test-Path -LiteralPath $file)) { return $null }
    $txt = [IO.File]::ReadAllText($file)
    $m = [regex]::Match($txt, ('(?m)^"' + [regex]::Escape($name) + '"="([^"]*)"'))
    if ($m.Success) { return $m.Groups[1].Value }
    return $null
}

function Pctl($arr, $p) {
    $a = @($arr | Sort-Object)
    if ($a.Count -eq 0) { return $null }
    $i = [Math]::Min($a.Count - 1, [int][Math]::Floor($a.Count * $p))
    return $a[$i]
}

function SmiPath {
    $s = Join-Path $env:SystemRoot 'System32\nvidia-smi.exe'
    if (Test-Path -LiteralPath $s) { return $s }
    $s = 'C:\Program Files\NVIDIA Corporation\NVSMI\nvidia-smi.exe'
    if (Test-Path -LiteralPath $s) { return $s }
    return $null
}

function MaxRefreshHz {
    $vals = @(Get-CimInstance Win32_VideoController -ErrorAction SilentlyContinue | ForEach-Object { [int]$_.CurrentRefreshRate } | Where-Object { $_ -gt 0 })
    if ($vals.Count -eq 0) { return 0 }
    return ($vals | Measure-Object -Maximum).Maximum
}

# ---------------------- Prueba de repeticion de tecla (ventana en un proceso aparte) ----------------------
function RunKeyTest {
    $tmp = Join-Path $env:TEMP 'boss_key'
    New-Item -ItemType Directory -Path $tmp -Force | Out-Null
    $outFile = Join-Path $tmp 'result.txt'
    Remove-Item -LiteralPath $outFile -Force -ErrorAction SilentlyContinue
    $childTpl = @'
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$out = '__OUT__'
$script:stamps = New-Object System.Collections.ArrayList
$script:key = $null
$form = New-Object System.Windows.Forms.Form
$form.Text = 'BOSSTWK - Prueba de repeticion de tecla'
$form.Width = 580
$form.Height = 260
$form.StartPosition = 'CenterScreen'
$form.TopMost = $true
$form.KeyPreview = $true
$lbl = New-Object System.Windows.Forms.Label
$lbl.Dock = 'Fill'
$lbl.TextAlign = 'MiddleCenter'
$lbl.Font = New-Object System.Drawing.Font('Segoe UI', 13)
$lbl.Text = 'Haz clic en esta ventana y MANTEN PULSADA una tecla (por ejemplo la barra espaciadora) durante 4 segundos. Se cierra sola al soltarla.'
$form.Controls.Add($lbl)
$form.Add_KeyDown({
    param($s, $e)
    if ($null -eq $script:key) { $script:key = $e.KeyCode }
    if ($e.KeyCode -eq $script:key) { [void]$script:stamps.Add([Diagnostics.Stopwatch]::GetTimestamp()) }
    $e.Handled = $true
})
$form.Add_KeyUp({
    param($s, $e)
    if ($script:stamps.Count -ge 6) { $form.Close() }
})
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 30000
$timer.Add_Tick({ $form.Close() })
$timer.Start()
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()
$timer.Stop()
$n = $script:stamps.Count
if ($n -lt 6) {
    [IO.File]::WriteAllText($out, ('ERR|pocas repeticiones (' + $n + ')'))
} else {
    $f = [Diagnostics.Stopwatch]::Frequency
    $dt = New-Object System.Collections.ArrayList
    for ($i = 1; $i -lt $n; $i++) { [void]$dt.Add((($script:stamps[$i] - $script:stamps[$i - 1]) * 1000.0 / $f)) }
    $delay = [double]$dt[0]
    $iv = @()
    for ($i = 1; $i -lt $dt.Count; $i++) { $iv += [double]$dt[$i] }
    $sorted = @($iv | Sort-Object)
    $med = $sorted[[int][Math]::Floor($sorted.Count / 2)]
    $avg = ($iv | Measure-Object -Average).Average
    $sq = 0.0
    foreach ($v in $iv) { $sq += ($v - $avg) * ($v - $avg) }
    $sd = [Math]::Sqrt($sq / $iv.Count)
    $mx = ($iv | Measure-Object -Maximum).Maximum
    [IO.File]::WriteAllText($out, ('OK|' + [Math]::Round($delay, 0) + '|' + [Math]::Round($med, 1) + '|' + [Math]::Round($sd, 1) + '|' + [Math]::Round($mx, 1) + '|' + $n + '|' + $script:key))
}
'@
    $child = $childTpl.Replace('__OUT__', $outFile)
    $ps1 = Join-Path $tmp 'key.ps1'
    [IO.File]::WriteAllText($ps1, $child, (New-Object System.Text.ASCIIEncoding))
    $p = Start-Process -FilePath 'powershell.exe' -ArgumentList @('-NoProfile', '-STA', '-ExecutionPolicy', 'Bypass', '-WindowStyle', 'Hidden', '-File', $ps1) -PassThru
    if ($p) { [void]$p.WaitForExit(60000) }
    $res = ''
    if (Test-Path -LiteralPath $outFile) { $res = ([IO.File]::ReadAllText($outFile)).Trim() }
    Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
    return $res
}

# ---------------------- Medicion de FPS con ETW (logman y tracerpt, ya incluidos en Windows) ----------------------
function CaptureFps($secs, $useGpu) {
    $etl = Join-Path $dataDir 'fps_trace.etl'
    $csv = Join-Path $dataDir 'fps_trace.csv'
    foreach ($f in @($etl, $csv, (Join-Path $dataDir 'fps_sum.txt'))) { Remove-Item -LiteralPath $f -Force -ErrorAction SilentlyContinue }
    & logman.exe stop BOSS_FPS -ets *> $null
    & logman.exe start BOSS_FPS -p '{CA11C036-0102-4A2D-A6AD-F03CFED5D3C9}' 0xffffffffffffffff 0xff -o $etl -ets -nb 64 512 -bs 128 *> $null
    if ($LASTEXITCODE -ne 0) { return $null }
    $pids = @(Get-Process -Name $fnProc -ErrorAction SilentlyContinue | ForEach-Object { [int]$_.Id })
    $smi = $null
    if ($useGpu -eq 1) { $smi = SmiPath }
    $gu = @()
    $gc = @()
    $gm = @()
    $gs = @()
    $steps = [int][Math]::Ceiling($secs / 5.0)
    for ($i = 0; $i -lt $steps; $i++) {
        Start-Sleep -Seconds 5
        if ($smi) {
            $ln = (& $smi '--query-gpu=utilization.gpu,clocks.sm,clocks.max.sm,pstate' '--format=csv,noheader,nounits' 2>$null | Select-Object -First 1)
            if ($ln) {
                $ff = @(([string]$ln).Split(',') | ForEach-Object { $_.Trim() })
                if ($ff.Count -ge 4) {
                    $gu += [double]$ff[0]
                    $gc += [double]$ff[1]
                    $gm += [double]$ff[2]
                    $gs += [string]$ff[3]
                }
            }
        }
    }
    & logman.exe stop BOSS_FPS -ets *> $null
    & tracerpt.exe $etl -of CSV -o $csv -summary (Join-Path $dataDir 'fps_sum.txt') -y *> $null
    if (-not (Test-Path -LiteralPath $csv)) { return $null }
    $times = New-Object System.Collections.Generic.List[double]
    $idx = @{}
    $sep = [char[]]@(',')
    foreach ($line in [IO.File]::ReadLines($csv)) {
        if ($line -match 'Clock-Time') {
            $idx = @{}
            $hdr = @($line.Split($sep) | ForEach-Object { $_.Trim() })
            for ($c = 0; $c -lt $hdr.Count; $c++) { $idx[$hdr[$c]] = $c }
            continue
        }
        if (($idx.Count -eq 0) -or (-not $idx.ContainsKey('Event ID')) -or (-not $idx.ContainsKey('PID'))) { continue }
        $f = $line.Split($sep, 20)
        $need = [Math]::Max($idx['Event ID'], [Math]::Max($idx['PID'], $idx['Clock-Time']))
        if ($f.Count -le $need) { continue }
        if (($f[$idx['Event ID']].Trim() -eq '42') -and ($pids -contains [int]($f[$idx['PID']].Trim()))) {
            $ck = 0.0
            if ([double]::TryParse($f[$idx['Clock-Time']].Trim(), [ref]$ck)) { [void]$times.Add($ck / 10000.0) }
        }
    }
    return [pscustomobject]@{ Times = $times; Gu = $gu; Gc = $gc; Gm = $gm; Gs = $gs }
}

function AnalyzeFps($times) {
    $t = [double[]]$times.ToArray()
    [Array]::Sort($t)
    if ($t.Length -lt 120) { return $null }
    $dts = New-Object System.Collections.Generic.List[double]
    for ($i = 1; $i -lt $t.Length; $i++) {
        $d = $t[$i] - $t[$i - 1]
        if (($d -gt 0) -and ($d -lt 2000)) { [void]$dts.Add($d) }
    }
    if ($dts.Count -lt 100) { return $null }
    $arr = [double[]]$dts.ToArray()
    $sum = 0.0
    foreach ($v in $arr) { $sum += $v }
    $avg = $sum / $arr.Length
    $sorted = [double[]]$arr.Clone()
    [Array]::Sort($sorted)
    $med = $sorted[[int][Math]::Floor($sorted.Length / 2)]
    $p99 = $sorted[[Math]::Min($sorted.Length - 1, [int][Math]::Floor($sorted.Length * 0.99))]
    $p999 = $sorted[[Math]::Min($sorted.Length - 1, [int][Math]::Floor($sorted.Length * 0.999))]
    $mx = $sorted[$sorted.Length - 1]
    $jit = 0.0
    for ($i = 1; $i -lt $arr.Length; $i++) { $jit += [Math]::Abs($arr[$i] - $arr[$i - 1]) }
    $jit = $jit / ($arr.Length - 1)
    $hitch = 0
    foreach ($v in $arr) { if ($v -gt (3.0 * $med)) { $hitch++ } }
    return [pscustomobject]@{ Frames = $arr.Length; Fps = (1000.0 / $avg); Low1 = (1000.0 / $p99); Low01 = (1000.0 / $p999); MedMs = $med; P99Ms = $p99; MaxMs = $mx; Jitter = $jit; Hitches = $hitch }
}

# ====================== MODO RESTAURAR ======================
if ($mode -eq 'restore') {
    Head 'Restaurar los valores de este modulo'
    if (-not (Test-Path -LiteralPath $undoFile)) {
        Warn 'No hay ningun estado guardado para restaurar'
        exit 0
    }
    $items = @([IO.File]::ReadAllText($undoFile) | ConvertFrom-Json)
    $done = RunRevert $items
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    Move-Item -LiteralPath $undoFile -Destination (Join-Path $dataDir ('fluid_undo_restaurado_' + $stamp + '.json')) -Force
    ApplyLiveInput
    Ok ('Cambios revertidos: ' + $done + ' de ' + $items.Count)
    if ($done -lt $items.Count) { Say '  Si faltan, suele ser Fortnite abierto: cierralo y vuelve a restaurar.' 'DarkGray' }
    exit 0
}

# ====================== MODO FPS ======================
if ($mode -eq 'fps') {
    Head 'Medicion de FPS de Fortnite (sin instalar nada: ETW de Windows)'
    New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
    if (-not (Get-Process -Name $fnProc -ErrorAction SilentlyContinue)) {
        Say '  Abre Fortnite y entra a una partida o a la isla de pruebas. Espero hasta 3 minutos.' 'Yellow'
        for ($w = 0; $w -lt 60; $w++) {
            if (Get-Process -Name $fnProc -ErrorAction SilentlyContinue) { break }
            Start-Sleep -Seconds 3
        }
    }
    if (-not (Get-Process -Name $fnProc -ErrorAction SilentlyContinue)) {
        Warn 'Fortnite no se abrio: no hay nada que medir'
        exit 0
    }
    Say '  Fortnite detectado. Tienes 25 segundos para entrar al juego y moverte con normalidad.' 'Yellow'
    Say ('  Sonara un pitido al empezar y dos al terminar. La medida dura ' + $cfgSecs + ' segundos: juega con normalidad, sin pausas ni menus.') 'Yellow'
    for ($w = 0; $w -lt 25; $w++) { Start-Sleep -Seconds 1 }
    try { [Console]::Beep(880, 300) } catch { }
    $cap = CaptureFps $cfgSecs $cfgFpsGpu
    try { [Console]::Beep(660, 200); [Console]::Beep(660, 200) } catch { }
    if (-not $cap) {
        Warn 'No se pudo capturar la traza (logman o tracerpt fallaron)'
        exit 0
    }
    $res = $null
    if ($cap.Times.Count -gt 0) { $res = AnalyzeFps $cap.Times }
    if (-not $res) {
        Warn ('No se pudieron leer frames de Fortnite de la traza (eventos encontrados: ' + $cap.Times.Count + ').')
        Say '  Alternativa dentro del juego: Ajustes, Game UI, HUD: activa Mostrar FPS y las estadisticas de red.' 'DarkGray'
        exit 0
    }
    $hz = MaxRefreshHz
    Head 'Resultado de la medida'
    Say ('  Frames medidos: ' + $res.Frames + ' en ' + $cfgSecs + ' s') 'Gray'
    Say ('  FPS medios: {0:N0}   FPS del 1 por ciento peor: {1:N0}   del 0,1 por ciento peor: {2:N0}' -f $res.Fps, $res.Low1, $res.Low01) 'White'
    Say ('  Tiempo por frame: tipico {0:N2} ms | p99 {1:N2} ms | maximo {2:N1} ms | variacion entre frames {3:N2} ms | tirones: {4}' -f $res.MedMs, $res.P99Ms, $res.MaxMs, $res.Jitter, $res.Hitches) 'Gray'
    $ratio = $res.Low1 / $res.Fps
    if ($ratio -ge 0.6) { Ok 'Muy fluido: los peores frames estan cerca de la media' } elseif ($ratio -ge 0.4) { Warn 'Fluido con algun tiron: el 1 por ciento peor va mucho mas lento que la media' } else { Warn 'Se notan tirones: el 1 por ciento peor esta muy por debajo de la media' }
    if ($res.Hitches -gt 0) { Say ('  Hubo ' + $res.Hitches + ' frames que tardaron mas del triple de lo normal (microparones).') 'DarkGray' }

    if ($cap.Gu.Count -gt 0) {
        $uAvg = ($cap.Gu | Measure-Object -Average).Average
        $cAvg = ($cap.Gc | Measure-Object -Average).Average
        $mMax = ($cap.Gm | Measure-Object -Maximum).Maximum
        Say ('  GPU: uso medio {0:N0} %, reloj medio {1:N0} de {2:N0} MHz, estado {3}' -f $uAvg, $cAvg, $mMax, (($cap.Gs | Select-Object -Unique) -join '/')) 'Gray'
        if ($uAvg -ge 93) {
            Say '  Limitado por la GPU: baja la Resolucion 3D, sombras o efectos para subir FPS.' 'DarkGray'
        } elseif ($uAvg -lt 75) {
            Say '  Limitado por la CPU o por el limite de FPS: la GPU va sobrada.' 'DarkGray'
        }
        if (($mMax -gt 0) -and ($cAvg -lt (0.85 * $mMax)) -and ($uAvg -lt 93)) { Warn 'La GPU baja de reloj con carga media: en el Panel de control de NVIDIA pon Administracion de energia en Preferir maximo rendimiento para FortniteClient-Win64-Shipping.exe' }
    }

    Head 'Que perfil te conviene'
    if ($hz -gt 0) {
        Say ('  Tu pantalla va a ' + $hz + ' Hz y Fortnite da ' + [Math]::Round($res.Fps, 0) + ' FPS de media.') 'Gray'
        if ($res.Fps -ge (1.5 * $hz)) {
            Ok 'Vas muy por encima de tus Hz: sin limite de FPS es lo mas rapido, y a tantos FPS el tearing casi no se ve. Perfil: rapido.'
        } elseif ($res.Fps -ge (0.95 * $hz)) {
            Say '  Vas justo por encima de los Hz: con pantalla VRR conviene el perfil fluido (limite Hz menos 3); sin VRR deja el perfil rapido.' 'Gray'
        } else {
            Warn ('Tu FPS (' + [Math]::Round($res.Fps, 0) + ') no llega a tus Hz (' + $hz + '): limitar no ayuda. Hay que subir FPS: Resolucion 3D, sombras, efectos o modo Rendimiento.')
        }
    }
    $ini = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'
    $limit = '?'
    $vs = '?'
    if (Test-Path -LiteralPath $ini) {
        $f2 = ReadIniFile $ini
        $l1 = IniVal $f2.Text 'FrameRateLimit'
        $v1 = IniVal $f2.Text 'bUseVSync'
        if ($null -ne $l1) { $limit = $l1 }
        if ($null -ne $v1) { $vs = $v1 }
    }
    $line = (Get-Date -Format 'yyyy-MM-dd HH:mm') + ' | limite ' + $limit + ' | vsync ' + $vs + ' | FPS ' + [Math]::Round($res.Fps, 0) + ' | 1pc ' + [Math]::Round($res.Low1, 0) + ' | 0.1pc ' + [Math]::Round($res.Low01, 0) + ' | p99 ' + [Math]::Round($res.P99Ms, 2) + ' ms | tirones ' + $res.Hitches
    try { Add-Content -LiteralPath $logFile -Value $line } catch { }
    Say ''
    Say 'Ultimas medidas guardadas (para comparar antes y despues de cambiar de perfil):' 'Cyan'
    foreach ($l in @(Get-Content -LiteralPath $logFile -Tail 6 -ErrorAction SilentlyContinue)) { Say ('  ' + $l) 'DarkGray' }
    exit 0
}

# ====================== MODO APLICAR / COMPROBAR ======================
LoadUndo
if ($doChange) { New-Item -ItemType Directory -Path $dataDir -Force | Out-Null }

Head 'Teclado: repeticion de tecla'
$kbPath = 'HKCU:\Control Panel\Keyboard'
$kbNow = Get-ItemProperty -LiteralPath $kbPath -ErrorAction SilentlyContinue
$curDelay = [string]$kbNow.KeyboardDelay
$curSpeed = [string]$kbNow.KeyboardSpeed
$bk = FirstKmBackup
$origDelay = $null
$origSpeed = $null
if ($bk) {
    $origDelay = RegFileValue (Join-Path $bk.FullName 'keyboard.reg') 'KeyboardDelay'
    $origSpeed = RegFileValue (Join-Path $bk.FullName 'keyboard.reg') 'KeyboardSpeed'
}
$srcTxt = 'tu copia de seguridad'
if ($null -eq $origDelay) { $origDelay = '1'; $srcTxt = 'valores por defecto de Windows' }
if ($null -eq $origSpeed) { $origSpeed = '31'; $srcTxt = 'valores por defecto de Windows' }
$delayMs = 250
if ($curDelay -match '^\d+$') { $delayMs = 250 * ([int]$curDelay + 1) }
Say ('  Ahora: espera de ' + $delayMs + ' ms antes de repetir (valor ' + $curDelay + ') y velocidad ' + $curSpeed + ' de 31') 'DarkGray'
Say ('  Tus valores originales (' + $srcTxt + '): espera ' + $origDelay + ', velocidad ' + $origSpeed) 'DarkGray'
if (($curDelay -ne $origDelay) -or ($curSpeed -ne $origSpeed)) {
    if ($doChange) {
        $r1 = RegQuiet $kbPath 'KeyboardDelay' $origDelay 'String'
        $r2 = RegQuiet $kbPath 'KeyboardSpeed' $origSpeed 'String'
        if (($r1 -eq 'fail') -or ($r2 -eq 'fail')) {
            Warn 'No se pudo restaurar la repeticion de tecla'
        } else {
            ApplyLiveInput
            Ok 'Repeticion de tecla devuelta a tus valores originales (aplicada al momento)'
        }
    } else {
        Warn 'La repeticion de tecla no es la original: ejecuta este modulo para devolverla'
    }
} else {
    Ok 'La repeticion de tecla esta en tus valores originales'
}
$fk = (Get-ItemProperty -LiteralPath 'HKCU:\Control Panel\Accessibility\Keyboard Response' -Name Flags -ErrorAction SilentlyContinue).Flags
if ($fk -and (([int]$fk -band 1) -ne 0)) { Warn 'Las Teclas de filtro estan activadas: retrasan y filtran las pulsaciones. Desactivalas en Accesibilidad, Teclado.' }
if ($cfgKeyTest -eq 1) {
    Say '  Se abre una ventana: haz clic en ella y manten pulsada una tecla (por ejemplo la barra espaciadora) unos 4 segundos.' 'Yellow'
    $kt = RunKeyTest
    if (-not $kt) {
        Warn 'No se pudo completar la prueba de tecla'
    } else {
        $kp = $kt.Split('|')
        if ($kp[0] -ne 'OK') {
            Warn ('Prueba de tecla sin datos (' + $kt + ')')
        } else {
            $expDelay = 250
            $nowDelay = [string](Get-ItemProperty -LiteralPath $kbPath -Name KeyboardDelay -ErrorAction SilentlyContinue).KeyboardDelay
            if ($nowDelay -match '^\d+$') { $expDelay = 250 * ([int]$nowDelay + 1) }
            $medMs = [double]$kp[2]
            $cps = 0
            if ($medMs -gt 0) { $cps = [Math]::Round(1000.0 / $medMs, 1) }
            Say ('  Medido: espera ' + $kp[1] + ' ms (esperado ' + $expDelay + ' ms), repite cada ' + $kp[2] + ' ms (unas ' + $cps + ' pulsaciones por segundo), variacion ' + $kp[3] + ' ms, intervalo maximo ' + $kp[4] + ' ms, tecla ' + $kp[6]) 'Gray'
            if (([double]$kp[3] -gt 6) -or ([double]$kp[4] -gt (2.5 * $medMs))) {
                Warn 'La repeticion es irregular: hay pulsaciones que llegan con retraso. Suele ser carga de CPU, un USB saturado o una interrupcion mal repartida. Prueba con el teclado en otro puerto USB trasero.'
            } else {
                Ok 'La repeticion es regular: sin retrasos ni saltos'
            }
        }
    }
}

# ------------------------------------------------------------------
Head 'Raton: velocidad del puntero de Windows'
$mPath = 'HKCU:\Control Panel\Mouse'
$mNow = Get-ItemProperty -LiteralPath $mPath -ErrorAction SilentlyContinue
$curSens = [string]$mNow.MouseSensitivity
$origSens = $null
if ($bk) { $origSens = RegFileValue (Join-Path $bk.FullName 'mouse.reg') 'MouseSensitivity' }
Say ('  Ahora: velocidad del puntero ' + $curSens + ' de 20 (10 = 6/11, la que hace 1 a 1), aceleracion ' + $(if ([string]$mNow.MouseSpeed -eq '0') { 'apagada' } else { 'encendida' })) 'DarkGray'
if ($null -ne $origSens) { Say ('  Antes de BOSSTWK: ' + $origSens) 'DarkGray' }
if (($cfgSlider -eq 1) -and ($null -ne $origSens) -and ($origSens -ne $curSens)) {
    if ($doChange) {
        $r = RegQuiet $mPath 'MouseSensitivity' $origSens 'String'
        if ($r -eq 'fail') {
            Warn 'No se pudo restaurar la velocidad del puntero'
        } else {
            ApplyLiveInput
            Ok ('Velocidad del puntero de Windows devuelta a ' + $origSens + ' (la aceleracion sigue apagada; dentro del juego solo cuenta la sensibilidad de Fortnite)')
        }
    } else {
        Warn 'La velocidad del puntero no es la que tenias: ejecuta este modulo para devolverla'
    }
} else {
    Say '  Sin cambios en la velocidad del puntero' 'DarkGray'
}

# ------------------------------------------------------------------
Head 'Fortnite: limite de FPS y vsync'
$ini = Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'
$hz = MaxRefreshHz
if ($hz -gt 0) { Say ('  Tu pantalla va a ' + $hz + ' Hz') 'DarkGray' }
if (-not (Test-Path -LiteralPath $ini)) {
    Warn 'No existe GameUserSettings.ini: abre Fortnite una vez, cierralo y repite'
} else {
    $file = ReadIniFile $ini
    foreach ($line in ($file.Text -split "`n")) {
        $tl = $line.Trim()
        if ($tl -match '^([^\s=\[;]+)\s*=\s*(\S+)') {
            $kn = $Matches[1]
            $kv = $Matches[2]
            if ($kn -match '(?i)^(FrameRateLimit|bUseVSync|FullscreenMode|PreferredRHI|PreferredFeatureLevel|ResolutionSizeX|ResolutionSizeY|MenuFrameRateLimit)$') { Say ('  ' + $kn + ' = ' + $kv) 'DarkGray' }
            if ($kn -match '(?i)motionblur|resolutionquality|screenpercentage|3dresolution|reflex|lowlatency') { Say ('  ' + $kn + ' = ' + $kv) 'DarkGray' }
        }
    }
    $curLimit = IniVal $file.Text 'FrameRateLimit'
    $curVs = IniVal $file.Text 'bUseVSync'
    $standard = @(30, 60, 75, 90, 100, 120, 144, 165, 180, 200, 240, 280, 300, 360, 480, 500)
    if (($null -ne $curLimit) -and ($curLimit -match '^[\d\.]+$')) {
        $cl = [double]$curLimit
        if (($cl -gt 0) -and ($standard -notcontains [int][Math]::Round($cl))) { Warn ('El limite de FPS actual (' + $curLimit + ') no es uno de los valores del menu del juego: puede que Fortnite lo interprete mal y vaya mas lento. El perfil lo corrige.') }
        if (($cl -gt 0) -and ($cl -lt 100)) { Warn ('El limite de FPS actual es bajo (' + $curLimit + '): el juego se vera lento aunque la pantalla vaya a mas Hz') }
    }
    $wantLimit = $null
    if ($cfgProfile -eq 'rapido') { $wantLimit = '0.000000' }
    if (($cfgProfile -eq 'fluido') -and ($hz -gt 10)) { $wantLimit = (($hz - 3).ToString() + '.000000') }
    if (-not $doChange) {
        Say ('  (modo comprobar: perfil previsto ' + $cfgProfile + ', no se escribe nada)') 'DarkGray'
    } elseif ($cfgProfile -eq 'keep') {
        Say '  Perfil keep: no se toca el limite de FPS' 'DarkGray'
    } elseif (Get-Process -Name $fnProc -ErrorAction SilentlyContinue) {
        Warn 'Fortnite esta abierto: cierralo y vuelve a ejecutar para cambiar el limite de FPS'
    } else {
        $bak = $ini + '.boss_fluid.bak'
        if (-not (Test-Path -LiteralPath $bak)) { Copy-Item -LiteralPath $ini -Destination $bak -Force }
        $text = $file.Text
        $changed = @()
        foreach ($pair in @(@('FrameRateLimit', $wantLimit), @('bUseVSync', 'False'))) {
            if ($null -eq $pair[1]) { continue }
            $res = IniGetSet $text $pair[0] $pair[1]
            if ($null -eq $res) {
                Say ('  ' + $pair[0] + ' no esta en tu ini: se cambia dentro del juego') 'DarkGray'
            } elseif ($res.Old -ne $pair[1]) {
                $text = $res.Text
                $changed += $pair[0]
                AddUndo @{ t = 'ini'; a = $ini; b = $pair[0]; old = $res.Old }
            }
        }
        if ($changed.Count -gt 0) {
            if (WriteIniFile $ini $text $file.Enc) {
                $what = 'sin limite de FPS'
                if ($cfgProfile -eq 'fluido') { $what = 'limite de ' + ($hz - 3) + ' FPS' }
                Ok ('Perfil ' + $cfgProfile + ' aplicado (' + $what + ', vsync apagado): ' + ($changed -join ', '))
            } else {
                Warn 'No se pudo escribir GameUserSettings.ini'
            }
        } else {
            Ok ('Perfil ' + $cfgProfile + ': el ini ya estaba asi')
        }
    }
}

# ------------------------------------------------------------------
Head 'Grafica: estado ahora'
$smi = SmiPath
if ($smi) {
    $ln = (& $smi '--query-gpu=name,pstate,clocks.sm,clocks.max.sm,utilization.gpu,power.draw,power.limit,temperature.gpu' '--format=csv,noheader,nounits' 2>$null | Select-Object -First 1)
    if ($ln) {
        $g = @(([string]$ln).Split(',') | ForEach-Object { $_.Trim() })
        if ($g.Count -ge 8) { Say ('  ' + $g[0] + '   estado ' + $g[1] + '   reloj ' + $g[2] + ' de ' + $g[3] + ' MHz   uso ' + $g[4] + ' %   ' + $g[5] + ' de ' + $g[6] + ' W   ' + $g[7] + ' C   (en reposo es normal que baje)') 'DarkGray' }
    }
} else {
    Say '  Sin nvidia-smi: no se lee la GPU' 'DarkGray'
}

# ------------------------------------------------------------------
if ($doChange) {
    try {
        if ($global:undo.Count -gt 0) {
            $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
            [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
        }
    } catch { }
}

Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
Say '==================================================================' 'Green'
Say ''
Say 'Siguiente paso para ver si de verdad va mas rapido y fluido:' 'Cyan'
Say '  Abre BOSSTWK_FPS.bat del Escritorio con Fortnite en una partida: mide FPS, tirones y tiempo por frame.' 'Gray'
Say '  Compara la medida con perfil rapido y con perfil fluido (FLUID_PROFILE al principio del archivo) y quedate con el mejor.' 'Gray'
Say '  Si sigue pareciendote lento con muchos FPS, revisa en el monitor el Overdrive y que no haya suavizado de movimiento.' 'Gray'
#PS_MODULE:EXTRA:
$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'
$global:okc = 0
$global:wc = 0
$mode = $env:BOSS_MODE
if (-not $mode) { $mode = 'apply' }
$doChange = ($mode -eq 'apply')

function Say($t, $c = 'Gray') { Write-Host $t -ForegroundColor $c }
function Ok($t)   { $global:okc++; Say ('  [OK] ' + $t) 'Green' }
function Warn($t) { $global:wc++;  Say ('  [!!] ' + $t) 'Yellow' }
function Head($t) { Say ''; Say ('== ' + $t) 'Cyan' }

function Flag($n, $d) {
    $v = [Environment]::GetEnvironmentVariable($n)
    if ($v -match '^\d+$') { return [int]$v }
    return $d
}

$cfgHealth  = Flag 'HEALTH_SCAN' 1
$cfgCpu     = Flag 'CPU_TEST' 1
$cfgClean   = Flag 'CLEAN' 1
$cfgEpic    = Flag 'CLEAN_EPIC_CACHE' 0
$cfgComp    = Flag 'COMPONENT_CLEANUP' 0
$cfgDef     = Flag 'DEFENDER_SOFT' 1
$cfgReboot  = Flag 'NO_AUTO_REBOOT' 1
$cfgMpo     = Flag 'DISABLE_MPO' 0
$cfgHags    = ([string]$env:HAGS).Trim().ToLower()
if (@('keep', 'on', 'off') -notcontains $cfgHags) { $cfgHags = 'keep' }

$dataDir  = Join-Path $env:ProgramData 'BOSS'
$undoFile = Join-Path $dataDir 'extra_undo.json'
$global:undo = New-Object System.Collections.ArrayList
$global:ids = @{}

# ---------------------- API nativa: carga de CPU para la prueba de boost ----------------------
$apiOk = $true
try {
    Add-Type -ErrorAction Stop -TypeDefinition @'
using System;
using System.Diagnostics;
using System.Threading;

public static class BossBurn {
    public static void Start(int threads, int ms) {
        long end = Stopwatch.GetTimestamp() + (long)(ms * (Stopwatch.Frequency / 1000.0));
        for (int i = 0; i < threads; i++) {
            Thread t = new Thread(delegate() {
                double x = 1.0001;
                while (Stopwatch.GetTimestamp() < end) {
                    for (int k = 0; k < 20000; k++) {
                        x = x * 1.0000001 + 0.0000001;
                        if (x > 1000000.0) x = 1.0001;
                    }
                }
                GC.KeepAlive(x);
            });
            t.IsBackground = true;
            t.Start();
        }
    }
}
'@
} catch {
    $apiOk = $false
}

# ---------------------- Registro de cambios (deshacer) ----------------------
function UndoId($r) { return ([string]$r.t + '|' + [string]$r.a + '|' + [string]$r.b) }

function LoadUndo {
    if (Test-Path -LiteralPath $undoFile) {
        try {
            $raw = [IO.File]::ReadAllText($undoFile)
            $obj = $raw | ConvertFrom-Json
            foreach ($o in @($obj)) {
                [void]$global:undo.Add($o)
                $global:ids[(UndoId $o)] = $true
            }
        } catch { }
    }
}

function AddUndo($rec) {
    $id = UndoId $rec
    if (-not $global:ids.ContainsKey($id)) {
        [void]$global:undo.Add($rec)
        $global:ids[$id] = $true
    }
}

function SetReg($path, $name, $value, $type) {
    try {
        if (-not (Test-Path -LiteralPath $path)) { New-Item -Path $path -Force -ErrorAction Stop | Out-Null }
        New-ItemProperty -LiteralPath $path -Name $name -Value $value -PropertyType $type -Force -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

function RegQuiet($path, $name, $value, $type) {
    $rec = @{ t = 'reg'; a = $path; b = $name; old = $null; x = $false; y = $type }
    try {
        if (Test-Path -LiteralPath $path) {
            $key = Get-Item -LiteralPath $path -ErrorAction Stop
            $cur = $key.GetValue($name, $null)
            if ($null -ne $cur) {
                $rec.x = $true
                $rec.old = $cur
                $rec.y = [string]$key.GetValueKind($name)
                if ([string]$cur -eq [string]$value) { return 'same' }
            }
        }
    } catch { }
    if (SetReg $path $name $value $type) {
        AddUndo $rec
        return 'changed'
    }
    return 'fail'
}

function SetMp($name, $value) {
    try {
        switch ($name) {
            'ScanAvgCPULoadFactor' { Set-MpPreference -ScanAvgCPULoadFactor ([int]$value) -ErrorAction Stop }
            'EnableLowCpuPriority' { Set-MpPreference -EnableLowCpuPriority ([bool]$value) -ErrorAction Stop }
            'ScanOnlyIfIdleEnabled' { Set-MpPreference -ScanOnlyIfIdleEnabled ([bool]$value) -ErrorAction Stop }
        }
        return $true
    } catch {
        return $false
    }
}

function RevertOne($r) {
    switch ([string]$r.t) {
        'reg' {
            if ($r.x) {
                if ([string]$r.y -eq 'DWord') { return (SetReg $r.a $r.b ([int]$r.old) 'DWord') }
                return (SetReg $r.a $r.b ([string]$r.old) 'String')
            }
            Remove-ItemProperty -LiteralPath $r.a -Name $r.b -ErrorAction SilentlyContinue
            return $true
        }
        'mp' {
            if ([string]$r.a -eq 'ScanAvgCPULoadFactor') { return (SetMp 'ScanAvgCPULoadFactor' ([int]$r.old)) }
            return (SetMp ([string]$r.a) ([bool]::Parse([string]$r.old)))
        }
    }
    return $false
}

function RunRevert($list) {
    $arr = @($list)
    [array]::Reverse($arr)
    $n = 0
    foreach ($r in $arr) {
        if (RevertOne $r) { $n++ }
    }
    return $n
}

# ---------------------- Utilidades ----------------------
function SmiPath {
    $s = Join-Path $env:SystemRoot 'System32\nvidia-smi.exe'
    if (Test-Path -LiteralPath $s) { return $s }
    $s = 'C:\Program Files\NVIDIA Corporation\NVSMI\nvidia-smi.exe'
    if (Test-Path -LiteralPath $s) { return $s }
    return $null
}

function AgeDays($d) {
    try { return [int]((Get-Date) - [datetime]$d).TotalDays } catch { return $null }
}

function CountEvents($log, $ids, $provider, $since) {
    try {
        $f = @{ LogName = $log; StartTime = $since }
        if ($ids) { $f['Id'] = $ids }
        if ($provider) { $f['ProviderName'] = $provider }
        return @(Get-WinEvent -FilterHashtable $f -MaxEvents 500 -ErrorAction Stop)
    } catch {
        return @()
    }
}

function CleanOld($path, $days) {
    if (-not (Test-Path -LiteralPath $path)) { return 0 }
    $limit = (Get-Date).AddDays(-$days)
    $freed = 0
    foreach ($f in @(Get-ChildItem -LiteralPath $path -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt $limit })) {
        $len = $f.Length
        try {
            Remove-Item -LiteralPath $f.FullName -Force -ErrorAction Stop
            $freed += $len
        } catch { }
    }
    return $freed
}

function PathMtu($target) {
    $p = New-Object System.Net.NetworkInformation.Ping
    $opt = New-Object System.Net.NetworkInformation.PingOptions -ArgumentList 64, $true
    $lo = 1200
    $hi = 1472
    $best = 0
    while ($lo -le $hi) {
        $mid = [int](($lo + $hi) / 2)
        $buf = New-Object byte[] $mid
        $good = $false
        try {
            $r = $p.Send($target, 1500, $buf, $opt)
            $good = ([string]$r.Status -eq 'Success')
        } catch { $good = $false }
        if ($good) {
            $best = $mid
            $lo = $mid + 1
        } else {
            $hi = $mid - 1
        }
    }
    if ($best -eq 0) { return $null }
    return ($best + 28)
}

# ====================== MODO RESTAURAR ======================
if ($mode -eq 'restore') {
    Head 'Restaurar los valores de este modulo'
    if (-not (Test-Path -LiteralPath $undoFile)) {
        Warn 'No hay ningun estado guardado para restaurar (la limpieza de archivos no se puede deshacer)'
        exit 0
    }
    $items = @([IO.File]::ReadAllText($undoFile) | ConvertFrom-Json)
    $done = RunRevert $items
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    Move-Item -LiteralPath $undoFile -Destination (Join-Path $dataDir ('extra_undo_restaurado_' + $stamp + '.json')) -Force
    Ok ('Cambios revertidos: ' + $done + ' de ' + $items.Count)
    Say '  Reinicia el PC para completar la restauracion.' 'Gray'
    exit 0
}

# ====================== LECTURA Y AJUSTES ======================
LoadUndo
if ($doChange) { New-Item -ItemType Directory -Path $dataDir -Force | Out-Null }

# ------------------------------------------------------------------
Head 'Estado de la BIOS visto desde Windows (comprueba lo que ya tienes hecho)'
$bios = Get-CimInstance Win32_BIOS -ErrorAction SilentlyContinue | Select-Object -First 1
$board = Get-CimInstance Win32_BaseBoard -ErrorAction SilentlyContinue | Select-Object -First 1
if ($bios) {
    $bAge = AgeDays $bios.ReleaseDate
    Say ('  Placa: ' + $board.Manufacturer + ' ' + $board.Product + '   BIOS ' + $bios.SMBIOSBIOSVersion + ' del ' + ([datetime]$bios.ReleaseDate).ToString('yyyy-MM-dd') + ' (hace ' + $bAge + ' dias)') 'DarkGray'
    if (($null -ne $bAge) -and ($bAge -gt 540)) { Warn 'La BIOS tiene mas de 18 meses: mira si el fabricante tiene una nueva (suelen mejorar el boost y la memoria)' }
}
$sb = $null
try { $sb = Confirm-SecureBootUEFI -ErrorAction Stop } catch { $sb = $null }
if ($sb -eq $true) { Ok 'Secure Boot activado (Epic lo exige en los torneos)' } elseif ($sb -eq $false) { Warn 'Secure Boot desactivado: Epic lo exige en los torneos y en el modo competitivo' } else { Warn 'No se pudo leer Secure Boot (BIOS en modo legacy o sin UEFI)' }
$tpm = Get-CimInstance -Namespace 'root\cimv2\Security\MicrosoftTpm' -ClassName Win32_Tpm -ErrorAction SilentlyContinue
if ($tpm -and ([string]$tpm.SpecVersion -match '^2\.0')) { Ok ('TPM 2.0 presente (' + ([string]$tpm.SpecVersion).Split(',')[0] + ')') } else { Warn 'No se ve un TPM 2.0 activo: Epic lo exige en los torneos' }
$dg = Get-CimInstance -Namespace 'root\Microsoft\Windows\DeviceGuard' -ClassName Win32_DeviceGuard -ErrorAction SilentlyContinue
$dma = ($dg -and (@($dg.AvailableSecurityProperties) -contains 3))
$iommuDev = (@(Get-PnpDevice -PresentOnly -ErrorAction SilentlyContinue | Where-Object { [string]$_.FriendlyName -match 'IOMMU' }).Count -gt 0)
if ($dma -or $iommuDev) { Ok 'IOMMU detectado (Epic lo exige en los torneos)' } else { Warn 'No se detecta IOMMU: Epic lo exige en los torneos (solo importa si juegas torneos)' }
$cpu = Get-CimInstance Win32_Processor -ErrorAction SilentlyContinue | Select-Object -First 1
if ($cpu) {
    if ([int]$cpu.NumberOfLogicalProcessors -gt [int]$cpu.NumberOfCores) { Ok ('SMT activo: ' + $cpu.NumberOfCores + ' nucleos y ' + $cpu.NumberOfLogicalProcessors + ' hilos') } else { Say ('  SMT desactivado: ' + $cpu.NumberOfCores + ' nucleos y ' + $cpu.NumberOfLogicalProcessors + ' hilos') 'DarkGray' }
}
$mods = @(Get-CimInstance Win32_PhysicalMemory -ErrorAction SilentlyContinue)
if ($mods.Count -gt 0) {
    $slow = $false
    foreach ($mo in $mods) { if (([int]$mo.ConfiguredClockSpeed -gt 0) -and ([int]$mo.Speed -gt 0) -and ([int]$mo.ConfiguredClockSpeed -lt [int]$mo.Speed)) { $slow = $true } }
    $spd = ($mods | Select-Object -First 1).ConfiguredClockSpeed
    if ($slow) { Warn 'La RAM corre por debajo de su velocidad nominal: el perfil EXPO/XMP no esta aplicado' } else { Ok ('RAM a ' + $spd + ' MT/s con ' + $mods.Count + ' modulo(s)') }
}
$smi = SmiPath
if ($smi) {
    $q = (& $smi '-q' '-d' 'MEMORY' 2>$null | Out-String)
    $fb = [regex]::Match($q, '(?is)FB Memory Usage\s*Total\s*:\s*(\d+)\s*MiB')
    $bar = [regex]::Match($q, '(?is)BAR1 Memory Usage\s*Total\s*:\s*(\d+)\s*MiB')
    if ($fb.Success -and $bar.Success) {
        $fbm = [int]$fb.Groups[1].Value
        $barm = [int]$bar.Groups[1].Value
        if ($barm -ge ($fbm - 512)) { Ok ('Resizable BAR activo (BAR1 ' + $barm + ' MiB de ' + $fbm + ' MiB de VRAM)') } else { Warn ('Resizable BAR parece desactivado (BAR1 ' + $barm + ' MiB de ' + $fbm + ' MiB de VRAM): suele dar algo mas de FPS') }
    }
}
$hw = (Get-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Name HwSchMode -ErrorAction SilentlyContinue).HwSchMode
if ($hw -eq 2) { Say '  Planificacion de GPU por hardware (HAGS): activada' 'DarkGray' } elseif ($hw -eq 1) { Say '  Planificacion de GPU por hardware (HAGS): desactivada' 'DarkGray' } else { Say '  HAGS: lo decide Windows con el driver' 'DarkGray' }

# ------------------------------------------------------------------
Head 'Drivers: antiguedad de los que importan'
$drv = @(Get-CimInstance Win32_PnPSignedDriver -ErrorAction SilentlyContinue | Where-Object { $_.DriverDate -and $_.DeviceName })
$groups = @(
    @('GPU', @($drv | Where-Object { [string]$_.DeviceClass -eq 'DISPLAY' })),
    @('Red', @($drv | Where-Object { ([string]$_.DeviceClass -eq 'NET') -and ([string]$_.DeviceName -notmatch 'Virtual|Hyper-V|Bluetooth|WAN|TAP|VPN|Loopback|Miniport|Tunnel') })),
    @('Audio', @($drv | Where-Object { ([string]$_.DeviceClass -eq 'MEDIA') -and ([string]$_.DeviceName -notmatch 'Virtual|Remote') })),
    @('Chipset', @($drv | Where-Object { ([string]$_.DeviceClass -eq 'SYSTEM') -and ([string]$_.DriverProviderName -match 'Advanced Micro Devices|AMD|Intel') } | Select-Object -First 4))
)
foreach ($g in $groups) {
    foreach ($d in @($g[1] | Select-Object -First 4)) {
        $age = AgeDays $d.DriverDate
        Say ('  {0,-8} {1,-44} {2,-14} {3}  (hace {4} dias)' -f $g[0], ([string]$d.DeviceName), ([string]$d.DriverVersion), (([datetime]$d.DriverDate).ToString('yyyy-MM-dd')), $age) 'DarkGray'
        if (($null -ne $age) -and ($age -gt 365) -and (($g[0] -eq 'GPU') -or ($g[0] -eq 'Red') -or ($g[0] -eq 'Chipset'))) { Warn ('Driver de ' + $g[0] + ' con mas de un ano: busca uno nuevo en la web del fabricante') }
    }
}

# ------------------------------------------------------------------
Head 'Estabilidad: errores de los ultimos 14 dias en el registro de eventos'
$since = (Get-Date).AddDays(-14)
$whea = CountEvents 'System' $null 'Microsoft-Windows-WHEA-Logger' $since
$tdr = CountEvents 'System' @(4101) 'Display' $since
$kp = CountEvents 'System' @(41) 'Microsoft-Windows-Kernel-Power' $since
$bug = CountEvents 'System' @(1001) 'Microsoft-Windows-WER-SystemErrorReporting' $since
$dsk = CountEvents 'System' @(7, 11, 51, 153) 'disk' $since
$ntfs = CountEvents 'System' @(55) 'Ntfs' $since
$fnc = @(CountEvents 'Application' @(1000) $null $since | Where-Object { [string]$_.Message -match 'Fortnite' })
Say ('  Errores de hardware (WHEA): ' + $whea.Count + '   Reinicios del driver de video: ' + $tdr.Count + '   Apagados inesperados: ' + $kp.Count + '   Pantallazos azules: ' + $bug.Count + '   Errores de disco: ' + ($dsk.Count + $ntfs.Count) + '   Cierres de Fortnite: ' + $fnc.Count) 'DarkGray'
if ($whea.Count -gt 0) { Warn 'Hay errores WHEA: el hardware corrigio o fallo en algo (CPU, RAM, PCIe). Suele ser un EXPO, PBO o undervolt demasiado agresivo: afloja el ajuste que hayas tocado.' }
if ($tdr.Count -gt 0) { Warn 'El driver de video se reinicio: puede ser un overclock o undervolt de la GPU inestable, o un driver con fallos. Prueba con valores de fabrica o un driver anterior.' }
if ($kp.Count -gt 0) { Warn 'El PC se apago sin avisar: revisa la fuente de alimentacion y las temperaturas.' }
if ($bug.Count -gt 0) { Warn 'Hubo pantallazos azules: la causa suele ser un driver o una RAM inestable.' }
if (($dsk.Count + $ntfs.Count) -gt 0) { Warn 'Hay errores de disco o del sistema de archivos: revisa el estado del SSD y haz copia de seguridad.' }
if ($fnc.Count -ge 3) { Warn 'Fortnite se cerro varias veces: si coincide con reinicios del driver de video, la GPU o la RAM estan al limite.' }
if (($whea.Count + $tdr.Count + $kp.Count + $bug.Count + $dsk.Count + $ntfs.Count) -eq 0) { Ok 'Sin errores de hardware, de video ni de disco en 14 dias: el sistema esta estable' }

# ------------------------------------------------------------------
if ($cfgHealth -eq 1) {
    Head 'Salud del sistema (puede tardar unos minutos, solo informa)'
    try {
        $img = Repair-WindowsImage -Online -CheckHealth -ErrorAction Stop
        if ([string]$img.ImageHealthState -eq 'Healthy') { Ok 'Imagen de Windows sana' } else { Warn ('Imagen de Windows: ' + $img.ImageHealthState + '. Ejecuta DISM /Online /Cleanup-Image /RestoreHealth y luego sfc /scannow.') }
    } catch {
        Say '  No se pudo comprobar la imagen de Windows' 'DarkGray'
    }
    try {
        $rv = Repair-Volume -DriveLetter ($env:SystemDrive.Substring(0, 1)) -Scan -ErrorAction Stop
        if ([string]$rv -eq 'NoErrorsFound') { Ok 'El disco del sistema no tiene errores' } else { Warn ('Resultado del analisis del disco: ' + [string]$rv) }
    } catch {
        Say '  No se pudo analizar el disco' 'DarkGray'
    }
}

# ------------------------------------------------------------------
if ($cfgCpu -eq 1) {
    Head 'CPU: boost real a plena carga (unos 15 s)'
    if (-not $apiOk) {
        Warn 'No se pudo preparar la prueba'
    } else {
        $logical = [Environment]::ProcessorCount
        [BossBurn]::Start($logical, 8500)
        $allF = @()
        for ($i = 0; $i -lt 8; $i++) {
            Start-Sleep -Seconds 1
            $row = Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation -ErrorAction SilentlyContinue | Where-Object { [string]$_.Name -eq '_Total' } | Select-Object -First 1
            if (($i -ge 2) -and $row) { $allF += [double]$row.ProcessorFrequency }
        }
        Start-Sleep -Seconds 2
        [BossBurn]::Start(1, 6500)
        $peak = 0.0
        for ($i = 0; $i -lt 5; $i++) {
            Start-Sleep -Seconds 1
            $rows = @(Get-CimInstance Win32_PerfFormattedData_Counters_ProcessorInformation -ErrorAction SilentlyContinue | Where-Object { [string]$_.Name -match '^\d+,\d+$' })
            foreach ($r in $rows) { if ([double]$r.ProcessorFrequency -gt $peak) { $peak = [double]$r.ProcessorFrequency } }
        }
        Start-Sleep -Seconds 2
        $baseMhz = [double]$cpu.MaxClockSpeed
        if ($allF.Count -gt 0) {
            $allAvg = [Math]::Round(($allF | Measure-Object -Average).Average, 0)
            Say ('  Todos los nucleos cargados: ' + $allAvg + ' MHz de media   Un solo nucleo: pico de ' + [Math]::Round($peak, 0) + ' MHz   (frecuencia base ' + $baseMhz + ' MHz)') 'Gray'
            if (($baseMhz -gt 0) -and ($peak -gt 0)) {
                if ($peak -ge $baseMhz * 1.05) { Ok 'El boost funciona: un nucleo supera la frecuencia base' } else { Warn 'Un nucleo no llega ni a la base: puede haber limite de potencia, temperatura alta o un plan de energia que limita el boost' }
            }
            if (($baseMhz -gt 0) -and ($allAvg -lt ($baseMhz * 0.9))) { Warn 'Con carga total la CPU baja de su frecuencia base: revisa la refrigeracion y los limites de potencia' }
        } else {
            Warn 'No se pudo leer la frecuencia de la CPU'
        }
    }
}

# ------------------------------------------------------------------
Head 'Red: MTU de la ruta hacia Internet'
$mtu = PathMtu '1.1.1.1'
$route = Get-NetRoute -DestinationPrefix '0.0.0.0/0' -ErrorAction SilentlyContinue | Where-Object { $_.NextHop -ne '0.0.0.0' } | Sort-Object RouteMetric | Select-Object -First 1
$adMtu = $null
if ($route) { $adMtu = (Get-NetIPInterface -InterfaceIndex $route.ifIndex -AddressFamily IPv4 -ErrorAction SilentlyContinue).NlMtu }
if ($null -eq $mtu) {
    Say '  No se pudo medir el MTU de la ruta (algo bloquea los paquetes de prueba)' 'DarkGray'
} else {
    Say ('  MTU de la ruta: ' + $mtu + '   MTU del adaptador: ' + $adMtu) 'DarkGray'
    if (($null -ne $adMtu) -and ([int]$adMtu -gt $mtu)) { Warn ('Tu adaptador usa MTU ' + $adMtu + ' pero la ruta solo admite ' + $mtu + ': los paquetes grandes se fragmentan. Se arregla en el router (PPPoE suele ser 1492).') } else { Ok 'El MTU del adaptador cabe en la ruta: sin fragmentacion' }
}

# ------------------------------------------------------------------
Head 'Que arranca y corre de fondo sin ser de Microsoft'
$svc = @(Get-CimInstance Win32_Service -ErrorAction SilentlyContinue | Where-Object { ([string]$_.State -eq 'Running') -and ([string]$_.StartMode -eq 'Auto') -and ([string]$_.PathName -notmatch '(?i)\\Windows\\|Microsoft|svchost') } | Select-Object -First 20)
if ($svc.Count -eq 0) {
    Ok 'No hay servicios de terceros en arranque automatico'
} else {
    Say ('  Servicios de terceros en marcha (' + $svc.Count + '): ' + (($svc | ForEach-Object { [string]$_.DisplayName }) -join ', ')) 'DarkGray'
    Say '  Los de drivers de GPU, audio, red y antivirus hay que dejarlos; el resto (iluminacion, actualizadores, lanzadores) se puede pasar a manual desde Servicios.' 'DarkGray'
}
$tasks = @(Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { ([string]$_.TaskPath -notlike '\Microsoft*') -and ([string]$_.State -ne 'Disabled') } | Select-Object -First 15)
if ($tasks.Count -gt 0) { Say ('  Tareas programadas de terceros (' + $tasks.Count + '): ' + (($tasks | ForEach-Object { [string]$_.TaskName }) -join ', ')) 'DarkGray' }

# ------------------------------------------------------------------
if ($cfgClean -eq 1) {
    Head 'Limpieza segura de archivos'
    if (-not $doChange) {
        Say '  (modo comprobar: no se borra nada)' 'DarkGray'
    } else {
        $freed = 0
        $freed += CleanOld $env:TEMP 7
        $freed += CleanOld (Join-Path $env:SystemRoot 'Temp') 7
        $freed += CleanOld (Join-Path $env:LOCALAPPDATA 'CrashDumps') 0
        $freed += CleanOld (Join-Path $env:ProgramData 'Microsoft\Windows\WER\ReportQueue') 7
        $freed += CleanOld (Join-Path $env:ProgramData 'Microsoft\Windows\WER\ReportArchive') 7
        if (-not (Get-Process -Name 'FortniteClient-Win64-Shipping' -ErrorAction SilentlyContinue)) {
            $freed += CleanOld (Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Logs') 7
            $freed += CleanOld (Join-Path $env:LOCALAPPDATA 'FortniteGame\Saved\Crashes') 7
        } else {
            Say '  Fortnite esta abierto: no se tocan sus registros' 'DarkGray'
        }
        Ok ('Archivos temporales, volcados de fallos y registros viejos borrados: ' + [Math]::Round($freed / 1MB, 0) + ' MB liberados')
        if ($cfgEpic -eq 1) {
            if (Get-Process -Name 'EpicGamesLauncher' -ErrorAction SilentlyContinue) {
                Warn 'El launcher de Epic esta abierto: cierralo para limpiar su cache web'
            } else {
                $wc = @(Get-ChildItem -LiteralPath (Join-Path $env:LOCALAPPDATA 'EpicGamesLauncher\Saved') -Directory -Filter 'webcache*' -ErrorAction SilentlyContinue)
                foreach ($d in $wc) { Remove-Item -LiteralPath $d.FullName -Recurse -Force -ErrorAction SilentlyContinue }
                Ok ('Cache web del launcher de Epic borrada (' + $wc.Count + ' carpeta/s): se regenera sola')
            }
        }
        if ($cfgComp -eq 1) {
            Say '  Limpiando componentes de Windows (puede tardar varios minutos) ...' 'DarkGray'
            & dism.exe /Online /Cleanup-Image /StartComponentCleanup *> $null
            if ($LASTEXITCODE -eq 0) { Ok 'Componentes antiguos de Windows limpiados' } else { Warn 'No se pudo completar la limpieza de componentes' }
        }
    }
}

# ------------------------------------------------------------------
if ($cfgDef -eq 1) {
    Head 'Antivirus de Windows: escaneos suaves (la proteccion no baja)'
    $mp = Get-MpPreference -ErrorAction SilentlyContinue
    if (-not $mp) {
        Say '  No se pudo leer la configuracion de Defender (puede haber otro antivirus)' 'DarkGray'
    } else {
        Say ('  Ahora: carga media de CPU en escaneos ' + $mp.ScanAvgCPULoadFactor + ' por ciento, prioridad baja ' + $mp.EnableLowCpuPriority + ', solo en reposo ' + $mp.ScanOnlyIfIdleEnabled) 'DarkGray'
        $pairs = @(@('ScanAvgCPULoadFactor', 20, [string]$mp.ScanAvgCPULoadFactor), @('EnableLowCpuPriority', $true, [string]$mp.EnableLowCpuPriority), @('ScanOnlyIfIdleEnabled', $true, [string]$mp.ScanOnlyIfIdleEnabled))
        $did = 0
        foreach ($pr in $pairs) {
            $same = $false
            if ($pr[0] -eq 'ScanAvgCPULoadFactor') { $same = ([int]$pr[2] -le 20) } else { $same = ([string]$pr[2] -eq 'True') }
            if ($same) { continue }
            if (-not $doChange) { continue }
            if (SetMp $pr[0] $pr[1]) {
                AddUndo @{ t = 'mp'; a = [string]$pr[0]; b = ''; old = [string]$pr[2] }
                $did++
            }
        }
        if (-not $doChange) {
            Say '  (modo comprobar: no se cambia nada)' 'DarkGray'
        } elseif ($did -gt 0) {
            Ok ('Escaneos de Defender con poca CPU y solo en reposo (' + $did + ' ajuste/s)')
        } else {
            Say '  Defender ya estaba asi (o la proteccion contra manipulacion no deja cambiarlo)' 'DarkGray'
        }
    }
}

# ------------------------------------------------------------------
Head 'Windows Update sin reinicios con la sesion abierta'
if ($cfgReboot -eq 1) {
    if ($doChange) {
        $r = RegQuiet 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' 'NoAutoRebootWithLoggedOnUsers' 1 'DWord'
        if ($r -eq 'fail') { Warn 'No se pudo cambiar la politica de reinicio' } elseif ($r -eq 'same') { Say '  Ya estaba activada' 'DarkGray' } else { Ok 'Windows Update ya no reinicia el PC solo mientras tengas la sesion abierta' }
    } else {
        Say '  (modo comprobar: no se cambia nada)' 'DarkGray'
    }
}

# ------------------------------------------------------------------
Head 'GPU: HAGS y MPO (solo si lo pides)'
if ($doChange -and ($cfgHags -ne 'keep')) {
    $want = 2
    if ($cfgHags -eq 'off') { $want = 1 }
    $r = RegQuiet 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' 'HwSchMode' $want 'DWord'
    if ($r -eq 'fail') { Warn 'No se pudo cambiar HAGS' } elseif ($r -eq 'same') { Say '  HAGS ya estaba asi' 'DarkGray' } else { Ok ('HAGS ' + $cfgHags + ' (tras reiniciar). Mide con la medicion de FPS antes y despues.') }
} else {
    Say '  HAGS: se deja como esta (HAGS=on u off al principio del archivo para probarlo)' 'DarkGray'
}
if ($doChange -and ($cfgMpo -eq 1)) {
    $r = RegQuiet 'HKLM:\SOFTWARE\Microsoft\Windows\Dwm' 'OverlayTestMode' 5 'DWord'
    if ($r -eq 'fail') { Warn 'No se pudo desactivar MPO' } elseif ($r -eq 'same') { Say '  MPO ya estaba desactivado' 'DarkGray' } else { Ok 'MPO desactivado (tras reiniciar): puede quitar microtirones con varios monitores o HDR' }
} else {
    $ov = (Get-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows\Dwm' -Name OverlayTestMode -ErrorAction SilentlyContinue).OverlayTestMode
    if ($ov -eq 5) { Say '  MPO: desactivado' 'DarkGray' } else { Say '  MPO: activo (DISABLE_MPO=1 solo si tienes microtirones con varios monitores)' 'DarkGray' }
}

# ------------------------------------------------------------------
if ($doChange) {
    try {
        if ($global:undo.Count -gt 0) {
            $json = ConvertTo-Json -InputObject $global:undo.ToArray() -Depth 6
            [IO.File]::WriteAllText($undoFile, $json, (New-Object System.Text.UTF8Encoding($false)))
        }
    } catch { }
}

Say ''
Say '==================================================================' 'Green'
Say ('  Listo: ' + $global:okc + ' bloques OK, ' + $global:wc + ' avisos') 'Green'
Say '==================================================================' 'Green'
Say ''
Say 'Lo que ya no puede hacer un bat (queda a mano):' 'Cyan'
Say '  - NVIDIA, por programa para Fortnite: Administracion de energia en Preferir maximo rendimiento, G-SYNC, y drivers al dia.' 'Gray'
Say '  - Monitor (menu OSD): frecuencia maxima, VRR, Overdrive medio, sin suavizado de movimiento; cable DisplayPort.' 'Gray'
Say '  - Raton: 1000 Hz o mas, 800 DPI, buena superficie, y el receptor en un puerto trasero directo.' 'Gray'
Say '  - Temperaturas: polvo, pasta termica y flujo de aire. Si la prueba de CPU o la medicion de FPS muestran limites termicos, empieza por ahi.' 'Gray'
Say '  - Afinado fino de CPU, RAM y GPU (undervolt, curvas): fuera de Windows y con cuidado; los errores WHEA de arriba te dicen si te pasaste.' 'Gray'
