#!/bin/bash
# cross-browser-video-convert
# require: ffmpeg

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

filename=$1
noextension="${filename%.*}"
full_mp4=$noextension.converted.mp4
full_webm=$noextension.converted.webm
full_ogv=$noextension.converted.ogv

if [ ! -f $filename ]; then
    echo "File not found! $filename"
    exit
fi

common="-i $filename -y -strict -2"
command="/usr/bin/ffmpeg "$common

# mp4
$command -vcodec libx264 \
	 -acodec aac \
	 -pix_fmt yuv420p \
	 -preset slow \
	 -profile:v baseline \
	 -level 3.0 \
	 -b:a 44k \
	 -movflags faststart \
	 $full_mp4

# webm
$command -c:v libvpx -c:a libvorbis -pix_fmt yuv420p -quality good -b:v 2M -crf 5 -vf "scale=trunc(in_w/2)*2:trunc(in_h/2)*2" $full_webm

# ogg
$command -q 5 -pix_fmt yuv420p -acodec libvorbis -vcodec libtheora $full_ogv

echo "done"