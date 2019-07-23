# ytdl-batch - making my life easier for Windows
Batch files to download one or multiple musics/videos using youtube-dl and convert multiple audio files(to .ogg) using FFmpeg.

## Requirements
* Windows (if you manage to make this work on other OS then props to you)
* [youtube-dl](https://ytdl-org.github.io/youtube-dl/download.html)
* [FFmpeg](https://ffmpeg.zeranoe.com/builds/)

### Installing
Just put all the required programs(youtube-dl.exe and FFmpeg) in one folder and you're done! You can start using the batch whenever you want, for more convenience create a shortcut of the bat file to your desktop for even easier access.

## Usage
It's very easy and straightforward. For downloading musics/videos open ytdl-public.bat and select the option you desire by pressing the number displayed next to it.
To paste the URL you can use Ctrl+V, if that doesn't work, you can right click and select paste, if that also doesn't work, right click on the CMD window tab, go in edit and paste.

For converting audio files(to .ogg) you need converter-public.bat to be in the same folder of the audio files you want to convert, carefull, all audio files inside the folder with the same format will be converted as well, now open the bat file and select the option you desire by pressing the number displayed next to it.

I advise to always keep youtube-dl.exe updated, you can update it using the ytdl-public.bat or manually with --update in the cmd.

More or less features to come!

## License
ytdl-batch is licensed under the GPLv3.
