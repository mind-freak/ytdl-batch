@echo off
if not exist "config-convert.txt" (echo # Here are saved the default conversion format, you can change it manually here.
echo FORMAT=ogg) > config-convert.txt
for /f "delims= skip=1" %%x in (config-convert.txt) do (set "%%x")
:start
choice /n /c:1234567 /m "MP3 [1] // FLAC [2] // WAV [3] // OGG [4] // Other [5] // Change Default Format [6] // Exit [7]"
if errorlevel 7 exit
if errorlevel 6 goto form
if errorlevel 5 goto PROMPTothr
if errorlevel 4 goto PROMPTogg
if errorlevel 3 goto PROMPTwav
if errorlevel 2 goto PROMPTflac
if errorlevel 1 goto PROMPTmp3
:PROMPTmp3
if exist "*.mp3" goto convertmp3
goto 404
:PROMPTflac
if exist "*.flac" goto convertflac
goto 404
:PROMPTwav
if exist "*.wav" goto convertwav
goto 404
:PROMPTogg
if exist "*.ogg" goto convertogg
goto 404
:PROMPTothr
set /p FORMAT=FORMAT (without the dot):
if exist "*.%FORMAT%" goto convertothr
goto 404

:convertothr
if not exist "OGG" mkdir OGG
for %%a in ("*.%FORMAT%") do ffmpeg -i "%%a" "OGG/%%~na.%FMT%"
goto opendir
:convertogg
if not exist "OGG" mkdir OGG
for %%a in ("*.ogg") do ffmpeg -i "%%a" "OGG/%%~na.%FMT%"
goto opendir
:convertwav
if not exist "OGG" mkdir OGG
for %%a in ("*.wav") do ffmpeg -i "%%a" "OGG/%%~na.%FMT%"
goto opendir
:convertmp3
if not exist "OGG" mkdir OGG
for %%a in ("*.mp3") do ffmpeg -i "%%a" "OGG/%%~na.%FMT%"
goto opendir
:convertflac
if not exist "OGG" mkdir OGG
for %%a in ("*.flac") do ffmpeg -i "%%a" "OGG/%%~na.%FMT%"
goto opendir

:form
echo -- Change Default Format.
:form404
echo FORMATS AVAILABLE: flac, mp3, ogg, or wav.
set /p FMT=FORMAT:
if "%FMT%" neq "flac" if "%FMT%" neq "mp3" if "%FMT%" neq "ogg" if "%FMT%" neq "wav" (echo INVALID FORMAT, TRY AGAIN
goto form404)
(echo # Here are saved the default conversion format, you can change it manually here.
echo FMT=%FMT%) > config-convert.txt
echo DEFAULT FORMAT CHANGED SUCCESSFULY
goto start

:opendir
choice /n /c:yn /m "Open OGG directory [Y/N]"
if errorlevel 2 exit
if errorlevel 1 start %cd%\OGG
exit

:404
echo -- File not found
echo -- Make sure to place the converter in the file directory
pause
exit
