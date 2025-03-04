#!/bin/bash
/home/abrax/bin/check_dependencies.sh toilet
top_header() {
  rich --force-terminal -p "$@" -S "blue" -s "yellow on blue" -a heavy -e
}

header1() {
  rich --force-terminal -p "$@" -s "#FFA500" -a heavy -e
  sleep 0.3
}

header2() {
  rich --force-terminal -p "$@" -s "#FFA500" -a rounded -e -S blue
  sleep 0.3
}

header3() {
  rich --force-terminal -p "$@" -s "blue" -u --text-left -S "#777777"
  sleep 0.3
}; 

headerred() {
  rich --force-terminal -p "$@" -s "red" -a ascii -e
  sleep 0.3
}

headergreen() {
  rich --force-terminal -p "$@" -s "green" -a ascii -e
  sleep 0.3
}

toilet_header1() {
  toilet "$1" -W -t --metal
}
toilet_header2() {
  toilet -f pagga "$*" -W -t --metal
}
toilet_header3() {
  toilet -f future "$*" -W -t --metal
}
toilet_header4() {
  toilet -f smbraille "$*" -W -t --metal
}
toilet_header5() {
  toilet -f rustofat "$*" -W -t --metal
}
mystatus1() {
  rich --force-terminal -p "[bold]$*" --panel-style "green on black" -e  --rule-style "blue on black" --text-left -s "black on green" -a rounded -e
}
mystatus1b() {
  rich --force-terminal -p "$*" -s "black on blue"
}
mystatus2() {
  rich --force-terminal -u -p "[bold]$*" --panel-style "green on black"  --rule-style "blue on black" --text-left -s "blue on black" -a rounded -e
}
mystatus20() {
#  echo --force-terminal -u -p "[bold]$1" --panel-style "green on black"  --rule-style "blue on black" --text-left -s "blue on black" -a rounded -e "$2"
  rich --force-terminal -u -p "[bold]$1" --panel-style "green on black"  --rule-style "blue on black" --text-left -s "blue on black" -a rounded -e --caption "$2" --title="$3"
}
mystatus2b() {
  rich --force-terminal -p "$*" -s "black on blue" --panel-style black -e -u --rule-style black --text-left 
}
mystatus3() {
  rich --force-terminal -u -p "[bold] -󰼏 -$*" --panel-style "blue on black"  --rule-style "blue on black" --text-left -s "blue on black" -e
}
mystatuscast() {
  rich --force-terminal -u -p "[bold] 󰄘 -$*" --panel-style "blue on black"  --rule-style "blue on black" --text-left -s "blue on black" -e --text-right
}
mystatus3b() {
  rich --force-terminal -p "$*" -s "black on #222222" --panel-style black -e -u --rule-style black --text-left
}
mystatus4() {
  rich --force-terminal -p " -󰼐 -$*" -s "#888888 on black" --panel-style "#888888 on black" -e -u --rule-style "#888888 on black" --text-left
}
mystatus5() {
  rich --force-terminal -p " -󰼑 -$*" -s "#666666 on black" --panel-style "#666666 on black" -e -u --rule-style "#666666 on black" --text-left
}
mystatus6() {
  rich --force-terminal -p " -󰼒 -$*" -s "#444444 on black" --panel-style "#444444 on black" -e -u --rule-style "#444444 on black" --text-left
}
mystatus0() {
  rich --force-terminal -p "$*" --panel-style "#222222 on black" -e -u --rule-style "#222222 on black" --text-left
}
mystatusred() {
  rich --force-terminal -p "$*" --panel-style "red on black" -e -u --rule-style "#222222 on black" --text-left
}
if [[ $1 = "show" ]]; then
top_header top_header; header1 header1; header2 header2; header3 header3; headergreen headergreen; headerred headerred
toilet_header1 toilet_header1; toilet_header2 toilet_header2; toilet_header3 toilet_header3; toilet_header4 toilet_header4; toilet_header5 toilet_header5 ; mystatus1 mystatus1; mystatus2 mystatus2; mystatus3 mystatus3; mystatus4 mystatus4; mystatus5 mystatus5; mystatus6 mystatus6
fi
 
