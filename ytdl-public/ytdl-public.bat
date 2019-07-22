@echo off
:start
for /f "delims= skip=1" %%x in (config.txt) do (set "%%x")
choice /n /c:1234 /m "Single Url [1] // Multiple Urls [2] // Change Default Format [3] // Update [4] // Exit [5]"
if errorlevel 5 exit
if errorlevel 4 goto updt
if errorlevel 3 goto form
if errorlevel 2 goto mult
if errorlevel 1 goto sing
:sing
set /p URL=URL:
youtube-dl --newline --no-mtime -i -o "%%(title)s.%%(ext)s" -x --audio-format %FORMAT% --audio-quality 0 --ignore-config %URL%
choice /n /c:yn /m "Another process [Y/N]"
if errorlevel 2 goto opendir
if errorlevel 1 goto sing

:mult
if not exist "list.txt" echo # Paste your URLs below with each URL on a line, then save it and go back to the prompt. >> "list.txt"
start %cd%\list.txt
choice /n /c:yn /m "Continue [Y/N]"
if errorlevel 2 exit
if errorlevel 1 youtube-dl --newline --no-mtime -i -o "%%(title)s.%%(ext)s" -x --audio-format %FORMAT% --audio-quality 0 --ignore-config -a list.txt
goto opendir

:form
echo CHOOSE A FORMAT.
:form404
echo FORMAT: aac, flac, mp3, m4a, opus, vorbis, or wav.
set /p FORMAT=FORMAT:
if "%FORMAT%" neq "aac" if "%FORMAT%" neq "flac" if "%FORMAT%" neq "mp3" if "%FORMAT%" neq "m4a" if "%FORMAT%" neq "opus" if "%FORMAT%" neq "vorbis" if "%FORMAT%" neq "wav" (echo INVALID FORMAT, TRY AGAIN
goto form404)
(echo # Here are saved the default conversion format, you can change it manually here.
echo FORMAT=%FORMAT%) > config.txt
goto start

:updt
echo Checking current version
youtube-dl --version
echo Updating
youtube-dl -U
echo Updated
goto start

:opendir
choice /n /c:yn /m "Open directory [Y/N]"
if errorlevel 2 exit
if errorlevel 1 start %cd%
exit
