:: ytdl-batch by mind-freak
:: version 1.1
@echo off
if not exist "config-ytdl.txt" (echo # Here are saved the default conversion format, you can change it manually here.
echo FORMAT=vorbis) > config-ytdl.txt
for /f "delims= skip=1" %%x in (config-ytdl.txt) do (set "%%x")
:start
choice /n /c:123456 /m "Single URL [1] // Multiple URLs [2] // Change Default Format [3] // Update [4] // Clean Cache [5] // Exit [6]"
if errorlevel 6 exit
if errorlevel 5 goto cach
if errorlevel 4 goto updt
if errorlevel 3 goto form
if errorlevel 2 goto mult
if errorlevel 1 goto sing
:sing
echo -- Single URL
set /p URL=URL:
youtube-dl --newline --no-mtime -i -o "%%(title)s.%%(ext)s" -x --audio-format %FORMAT% --audio-quality 0 --ignore-config "%URL%"
choice /n /c:yn /m "Another process [Y/N]"
if errorlevel 2 goto opendir
if errorlevel 1 goto sing

:mult
echo -- Multiple URLs
if not exist "list.txt" echo # Paste your URLs below with each URL on a line, then save it and go back to the prompt. >> "list.txt"
start %cd%\list.txt
choice /n /c:yn /m "Continue [Y/N]"
if errorlevel 2 exit
if errorlevel 1 youtube-dl --newline --no-mtime -i -o "%%(title)s.%%(ext)s" -x --audio-format %FORMAT% --audio-quality 0 --ignore-config -a list.txt
goto opendir

:form
echo -- Change Default Format.
:form404
echo FORMATS AVAILABLE: aac, flac, mp3, m4a, opus, vorbis, or wav.
set /p FORMAT=FORMAT:
if "%FORMAT%" neq "aac" if "%FORMAT%" neq "flac" if "%FORMAT%" neq "mp3" if "%FORMAT%" neq "m4a" if "%FORMAT%" neq "opus" if "%FORMAT%" neq "vorbis" if "%FORMAT%" neq "wav" (echo INVALID FORMAT, TRY AGAIN
goto form404)
(echo # Here are saved the default conversion format, you can change it manually here.
echo FORMAT=%FORMAT%) > config-ytdl.txt
echo DEFAULT FORMAT CHANGED SUCCESSFULY
goto start

:updt
echo -- Update
echo Current version is ...
youtube-dl --version
echo Checking for updates ...
youtube-dl -U
echo.
exit

:cach
echo -- Clean Cache
youtube-dl --rm-cache-dir
echo.
echo -- Cache Cleaned
pause
goto start

:opendir
choice /n /c:yn /m "Open directory [Y/N]"
if errorlevel 2 exit
if errorlevel 1 start %cd%
exit
