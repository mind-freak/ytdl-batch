@echo off
set /p URL=URL:
youtube-dl --ignore-config -F %URL%
set /p FORMAT=FORMAT CODE:
youtube-dl --no-mtime -i -o %%(title)s.%%(ext)s -f %FORMAT% --ignore-config %URL%
:opendir
choice /n /c:yn /m "Open directory [Y/N]"
if errorlevel 2 exit
if errorlevel 1 start %cd%
exit
