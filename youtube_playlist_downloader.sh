#!/bin/bash

mkdir youtube
cd youtube
youtube-dl --yes-playlist $1 
rename 's/ /_/g' *
mkdir mp3
for i in `ls | grep -v mp3`
do
    ffmpeg -i $i -q:a 0 -map a $i.mp3 && rm $i
done
mv *.mp3 mp3

