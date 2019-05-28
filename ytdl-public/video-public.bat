%echo off
cls
set /p URL=URL:
youtube-dl -F --ignore-config %URL%
set /p FORMAT=FORMAT:
youtube-dl --newline --no-mtime -i -o %(title)s.%(ext)s -f %FORMAT% --audio-quality 0 --ignore-config %URL%
%SystemRoot%\explorer.exe %cd%
exit
