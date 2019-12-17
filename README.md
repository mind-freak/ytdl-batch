# ytdl-batch - making my life easier
Batch files to download one or several songs using youtube-dl.

## Requirements
* [youtube-dl](https://ytdl-org.github.io/youtube-dl/download.html) requires [Microsoft Visual C++ 2010 Redistributable Package (x86)](https://www.microsoft.com/en-US/download/details.aspx?id=5555)
* [FFmpeg](https://ffmpeg.zeranoe.com/builds/)

### Installing
After you've downloaded the latest release of ytdl-batch and all of the rest required programs, put youtube-dl and FFmpeg in the ytdl-batch folder and you're done! You can start using the batch whenever you want, for more convenience create a shortcut of the bat file to your desktop for even easier access.
[![installing.gif](https://i.postimg.cc/L5nX2TY8/installing.gif)](https://postimg.cc/D43Fc1P9)

## Usage and Examples
It's very easy and straightforward. For downloading audio open ytdl-public.bat and select the option you desire by pressing the number displayed next to it, the rest is pretty straight forward.

### Single URL example
[![ytdl-public-single-usage.gif](https://i.postimg.cc/yxG6kHhq/ytdl-public-single-usage.gif)](https://postimg.cc/wRhYGnbF)

### Multiple URLs example
[![ytdl-public-list-usage.gif](https://i.postimg.cc/L5J2dbcx/ytdl-public-list-usage.gif)](https://postimg.cc/bSfKk3Nn)

---

### Converting
For converting audio files you need converter-public.bat to be in the same folder of the audio files you want to convert, carefull, all audio files inside the folder with the same format will be converted as well, now open the bat file and select the option you desire by pressing the number displayed next to it.

[![converter-public-usage.gif](https://i.postimg.cc/DyqYfKqR/converter-public-usage.gif)](https://postimg.cc/qzvGQSDG)

### Changing converted file
If you want to convert to another type of file, just select the option and choose another type.

[![converter-public-change-format.gif](https://i.postimg.cc/kGVGNcyt/converter-public-change-format.gif)](https://postimg.cc/PvjdT19t)
---

To paste the URL you can use Ctrl+V, if that doesn't work, you can right click and select paste, if that also doesn't work, right click on the CMD window tab, go in edit and paste.

[![cmd-paste.png](https://i.postimg.cc/wTfHxgq0/cmd-paste.png)](https://postimg.cc/1fqbJxNq)

#### Notes
I advise to always keep youtube-dl.exe updated, you can update it using the ytdl-public.bat and FFmpeg doesn't need to be always up to date.

That's all folks, more or less features to come!

## License
ytdl-batch is licensed under the GPLv3.
