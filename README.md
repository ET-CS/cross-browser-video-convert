# cross-browser-video-convert
(a) Small bash script to convert video file(s) into multiple formats that (aim to) supported by any device

prerequisites:
* ffmpeg

usage:

$ ./process.sh [file-name]

where file-name is a any video files with codec and format compatible by ffmpeg (ffmpeg -codecs, ffmpeg -formats)

this script will generate 3 files:

* .avi file
* .webm file
* .ogv file

for serving in websites using video element, js video player, and any way you serve your video file to browsers.