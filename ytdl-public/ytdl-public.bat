@echo off
cls
choice /n /c:123 /m "Single Url [1] // Multiple Urls [2] // Exit [3]"
if errorlevel 3 goto exit
if errorlevel 2 goto mult
if errorlevel 1 goto sing
:sing
set /p URL=URL:
youtube-dl --newline --no-mtime -i -o %(title)s.%(ext)s -x --audio-format vorbis -audio-quality 0 --ignore-config %URL%
%SystemRoot%\explorer.exe %cd%
exit
:mult
if not exist "list.txt" echo # Paste your URLs below with each URL on a line, then save it and go back to the prompt. >> "list.txt"
start notepad %cd%\list.txt
pause
youtube-dl --newline --no-mtime -i -o %(title)s.%(ext)s -x --audio-format vorbis -audio-quality 0 --ignore-config -a list.txt
%SystemRoot%\explorer.exe %cd%
exit
