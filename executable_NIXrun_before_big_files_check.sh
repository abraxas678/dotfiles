#!/bin/bash
#rclone lsf 
chezmoi managed >/home/abrax/tmp/cz.managed
while IFS= read -r line; do
    #echo "$line"
    dir=$(dirname "$line")
    echo "$dir" >>/home/abrax/tmp/cz.managed.dirs
done < /home/abrax/tmp/cz.managed
cat /home/abrax/tmp/cz.managed.dirs | sort | uniq >/home/abrax/tmp/cz.managed.dirs.uniq
#cat /home/abrax/tmp/cz.managed.dirs.uniq
while IFS= read -r line; do
    rich -p "/home/abrax/$line" -s blue 
    bws run -- rclone lsf "/home/abrax/$line" >>/home/abrax/tmp/cz.managed.dirs.files
    #while IFS= read -r file; do
    #    rich -p "$file" -s green
   #     size=$(stat -f %z "/home/abrax/$line/$file")
   #     bws run -- rclone size --json "$file" | jq .bytes
   # done < /home/abrax/tmp/cz.managed.dirs.files
done < /home/abrax/tmp/cz.managed.dirs.uniq
cat /home/abrax/tmp/cz.managed.dirs.files