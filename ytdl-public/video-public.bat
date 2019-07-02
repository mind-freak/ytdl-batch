@echo off
:vid
set /p URL=URL:
youtube-dl --ignore-config -F %URL%
set /p FORMAT=FORMAT CODE:
youtube-dl --no-mtime -i -o "%%(title)s.%%(ext)s" -f %FORMAT% --ignore-config %URL%
choice /n /c:yn /m "Another process [Y/N]"
if errorlevel 2 goto opendir
if errorlevel 1 goto vid
:opendir
choice /n /c:yn /m "Open directory [Y/N]"
if errorlevel 2 exit
if errorlevel 1 start %cd%
exit
