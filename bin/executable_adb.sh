v1=20
adb connect 192.168.86.$v1:5555

if [ ! $1 ];then
  adb -s 192.168.86.$v1:5555 shell dumpsys audio | grep Current | head -n 1 | sed 's/(.*//'
  adb -s 192.168.86.$v1:5555 shell dumpsys audio | grep Mute | head -n 1
elif [ $1 = "pause" ]; then
  adb -s 192.168.86.$v1:5555 shell input keyevent 127
  sleep 3
  mystate=$(adb shell dumpsys media_session | grep active=true -A 5 -B 5 | grep state=PlaybackState | sed 's/,.*//' | sed 's/.*=//')
  echo mystate $mystate
#  if [ "$mystate" != "*\"2\"*" ]; then
#    adb -s 192.168.86.$v1:5555 shell input keyevent 127
#  fi
elif [ $1 = "play" ]; then
  adb -s 192.168.86.$v1:5555 shell input keyevent 126
  sleep 3
  mystate=$(adb shell dumpsys media_session | grep active=true -A 5 -B 5 | grep state=PlaybackState |  sed 's/,.*//' | sed 's/.*=//')
  echo $mystate
#  if [ "$mystate" != "*\"3\"*" ]; then
#    adb -s 192.168.86.$v1:5555 shell input keyevent 126
#  fi

#if     adb -s 192.168.86.$v1:5555 shell input keyevent 164 
# adb shell input keyevent 126 play
# adb shell input keyevent 127 pause
# was ist active  adb shell dumpsys media_session | grep active=true -A 5 -B 5 | head 1
# was ist active  adb shell dumpsys media_session | grep active=true -A 5 -B 5 | grep package= | head 1   package davon
#  adb shell dumpsys media_session | grep active=true -A 5 -B 5 | grep state=PlaybackState     3=playing 2=pause
# adb shell dumpsys media_session | grep active=true -A 5 -B 5 | grep state=PlaybackState | sed 's/,.*//' | sed 's/.*{//'
###### 
echo
fi
