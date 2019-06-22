@echo off
echo THIS WILL CONVERT ALL THE MUSIC FILES INSIDE
echo THIS FOLDER TO .OGG / VORBIS TO THE FOLDER "OGG";
echo IF "OGG" DOESN'T EXIST, IT WILL BE CREATED;
echo FFMPEG AND THE MUSIC FILES MUST BE WITH THE CONVERTER;
echo CHOOSE THE FILE TYPE YOU WANNA CONVERT TO OGG.
choice /n /c:123456 /m "MP3 [1] // FLAC [2] // WAV [3] // M4A [4] // Other [5] // Exit [6]"
if errorlevel 6 exit
if errorlevel 5 goto PROMPTothr
if errorlevel 4 goto PROMPTm4a
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

:PROMPTm4a
if exist "*.m4a" goto convertm4a
goto 404

:PROMPTothr
set /p FORMAT=FORMAT (without the dot):
if exist "*.%FORMAT%" goto convertothr
goto 404

:convertothr
if not exist "OGG" mkdir OGG
for %%a in ("*.%FORMAT%) do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
goto opendir

:convertm4a
if not exist "OGG" mkdir OGG
for %%a in ("*.m4a) do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
goto opendir

:convertwav
if not exist "OGG" mkdir OGG
for %%a in ("*.wav") do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
goto opendir

:convertmp3
if not exist "OGG" mkdir OGG
for %%a in ("*.flac") do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
goto opendir

:convertflac
if not exist "OGG" mkdir OGG
for %%a in ("*.mp3") do ffmpeg -i "%%a" -c:a libvorbis "OGG/%%~na.ogg"
goto opendir

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
