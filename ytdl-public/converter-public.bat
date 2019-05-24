@echo off
cls
echo THIS WILL CONVERT ALL THE MUSIC FILES INSIDE
echo THIS FOLDER TO .OGG / VORBIS TO THE FOLDER "OGG";
echo IF "OGG" DOESN'T EXIST, IT WILL BE CREATED;
echo FFMPEG AND THE MUSIC FILES MUST BE WITH THE CONVERTER;
echo CHOOSE THE FILE TYPE YOU WANNA CONVERT TO OGG.
choice /n /c:123 /m "MP3 [1] // FLAC [2] // WAV [3] // M4A [4] // Exit [5]"
if errorlevel 5 exit
if errorlevel 4 goto PROMPTm4a
if errorlevel 3 goto PROMPTwav
if errorlevel 2 goto PROMPTflac
if errorlevel 1 goto PROMPTmp3

:PROMPTmp3
if exist "*.mp3" goto convertmp3
exit

:PROMPTflac
if exist "*.flac" goto convertflac
exit

:PROMPTYwav
if exist "*.wav" goto convertwav
exit

:PROMPTm4a
if exists "*.m4a" goto convertm4a
exit

:convertm4a
if not exist "OGG" mkdir OGG
for %%a in ("*.m4a) do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
pause
%SystemRoot%\explorer.exe "OGG"
exit

:convertwav
if not exist "OGG" mkdir OGG
for %%a in ("*.wav") do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
pause
%SystemRoot%\explorer.exe "OGG"
exit

:convertmp3
if not exist "OGG" mkdir OGG
for %%a in ("*.flac") do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
pause
%SystemRoot%\explorer.exe "OGG"
exit

:convertflac
if not exist "OGG" mkdir OGG
for %%a in ("*.mp3") do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
pause
%SystemRoot%\explorer.exe "OGG"
exit
