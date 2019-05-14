@echo off
cls
echo THIS WILL CONVERT ALL THE MUSIC FILES INSIDE
echo THIS FOLDER TO .OGG / VORBIS TO THE FOLDER "OGG";
echo IF "OGG" DOESN'T EXIST, IT WILL BE CREATED;
echo FFMPEG AND THE MUSIC FILES MUST BE WITH THE CONVERTER;
echo CHOOSE THE FILE TYPE YOU WANNA CONVERT TO OGG.
choice /n /c:123 /m "MP3 [1] // FLAC [2] // WAV [3] // Exit [4]"
if errorlevel 4 exit
if errorlevel 3 goto PROMPTwav
if errorlevel 2 goto PROMPTflac
if errorlevel 1 goto PROMPTmp3

:PROMPTmp3
if exist "*.mp3" goto convert
exit

:PROMPTflac
if exist "*.flac" goto convert
exit

:PROMPTYwav
if exist "*.wav" goto convert
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
