%echo off
set /p URL=URL:
youtube-dl --ignore-config -F %URL%
set /p FORMAT=FORMAT:
youtube-dl --no-mtime -i -o %%(title)s.%%(ext)s -f %FORMAT% --ignore-config %URL%
# %SystemRoot%\explorer.exe %cd%
pause
exit
