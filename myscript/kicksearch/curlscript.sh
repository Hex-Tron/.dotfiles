#!/bin/bash

set -xe

DMENU="dmenu -l 15 -sb purple"
Baseurl="https://kickasstorrents.to"
page='1'
Nice='Search
New:new/
Movies:movies/
TV:tv/
Music:music/
Games:games/
Apps:apps/
Anime:anime/
Other:other/
XXX:xxx/
Doc:documentries/

++Popular :popular
++Popular Movies:popular-movies
++Popular TV:popular-tv
++Popular Music:popular-music
++Popular Games:popular-games
++Popular Apps:popular-apps
++Popular Anime:popular-anime
++Popular Other:popular-other
++Popular XXX:popular-xxx
++Popular Doc:popular-documentries

++Top :top-100
++Top Movies :top-100-movies
++Top TV :top-100-tv
++Top Music :top-100-music
++Top Games :top-100-games
++Top Apps :top-100-apps
++Top Anime :top-100-anime
++Top Other :top-100-other
++Top XXX :top-100-xxx
++Top Doc :top-100-documentries

'

browser="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36"
function search_FUNCTION() {


  local mainurl="https://kickasstorrents.to"
  local Baseurl="https://kickasstorrents.to/usearch"
  local val1=$(echo '' | $DMENU -p 'Enter the query:' )
  local val2=$(/home/hextron/Tools/project/kicksearch/space_to_20/spaceto20 "$val1")

  function curlquery() {
    echo "Loading ..." | $DMENU &
    PID=$!
    curl  -x 'socks5://localhost:9050' -A "$browser" "$Baseurl/$val2/$((page++))" > $HOME/.cache/torrent/htmlfile.html

    $HOME/Tools/project/kicksearch/kick $HOME/.cache/torrent/htmlfile.html> $HOME/.cache/torrent/formated.txt  
    kill $PID
    new=$(cat $HOME/.cache/torrent/formated.txt | awk -F ':-:' '{print $1 " -: " $3 " -: " $4  }' )
    new1=$(echo -e "$new\nnext" | $DMENU -p "$val1")
  }
while :
do
  curlquery
  if [[ $new1 != "next" ]]; then 
    break
  fi
done
local newchange=$(echo -e "$new1" | awk -F ' -: ' '{print $1}')
local box=( "$newchange" )
local changed=$(echo -e "$box" | awk -F '[' '{print $1}') # error when  square bracket appear 
local changed1=("$changed")
if [[ -z "$changed1" ]]; then
  return
fi
local final=$(grep "${changed1[@]}" $HOME/.cache/torrent/formated.txt | awk -F ':-:' '{print $2}')
# + local final=/pegasproductions-22-01-18-luna-temptress-my-step-sis-tiny-pussy-xxx-720p-hevc-x265-prt-xvx-t5129078.html

echo "Loading ..." | $DMENU &
PID2=$!
curl -x 'socks5://localhost:9050' -A "$browser" "$mainurl$final" > $HOME/.cache/torrent/checkfile.html
kill $PID2
magnetlink=$(/home/hextron/Tools/project/kicksearch/regexmatch/regexm $HOME/.cache/torrent/checkfile.html)


if [[ -n "$magnetlink" ]]; then
  qbittorrent "$magnetlink" &
fi
}


value=$(echo -e "$Nice" | awk -F ':' '{print $1}'| $DMENU )
if [[ $value =~ "Search" ]]; then 
  search_FUNCTION
  exit 0 
fi

linker=$(echo -e "$Nice" | grep "$value" | head -n 1)
Newlink=$(echo -e "$linker" |  awk -F ':' '{print $2}')

function curlquery1() {
  echo "Loading ..." | $DMENU &
  PID=$!
  curl  -x 'socks5://localhost:9050' -A "$browser" "$Baseurl/$Newlink" > $HOME/.cache/torrent/htmlfile.html
  $HOME/Tools/project/kicksearch/kick $HOME/.cache/torrent/htmlfile.html > $HOME/.cache/torrent/formated.txt  
  kill $PID
  new=$(cat $HOME/.cache/torrent/formated.txt | awk -F ':-:' '{print $1 " -: " $3 " -: " $4  }' )
  new1=$(echo -e "$new\nnext" | $DMENU -p "$val1")
}
function curlquery2() {
  echo "Loading ..." | $DMENU &
  PID=$!
  curl  -x 'socks5://localhost:9050' -A "$browser" "$Baseurl/$Newlink/$((page++))" > $HOME/.cache/torrent/htmlfile.html
  $HOME/Tools/project/kicksearch/kick $HOME/.cache/torrent/htmlfile.html > $HOME/.cache/torrent/formated.txt  
  kill $PID
  new=$(cat $HOME/.cache/torrent/formated.txt | awk -F ':-:' '{print $1 " -: " $3 " -: " $4  }' )
  new1=$(echo -e "$new\nnext" | $DMENU -p "$val1")
}
while :
do
  if [[ $linker =~ '++' ]];then 
    curlquery1 #without nextable html
    break
  fi
  curlquery2 #with nextable html
  if [[ $new1 != "next" ]]; then 
    break
  fi
done
#echo "Loading ..." | $DMENU &
#PID3=$!
#curl  -x 'socks5://localhost:9050' -A "$browser" "$Baseurl/$Newlink" > $HOME/.cache/torrent/htmlfile.html
#$HOME/Tools/project/kicksearch/kick $HOME/.cache/torrent/htmlfile.html> $HOME/.cache/torrent/formated.txt  
#kill $PID3
#new=$(cat $HOME/.cache/torrent/formated.txt | awk -F ':-:' '{print $1 " -: " $3 " -: " $4  }' )
#new1=$(echo -e "$new\nnext" | $DMENU -p "$val1")












newchange=$(echo -e "$new1" | awk -F ' -: ' '{print $1}')
box=( "$newchange" )
changed=$(echo -e "$box" | awk -F '[' '{print $1}') # error when  square bracket appear 
changed1=("$changed")
if [[ -z "$changed1" ]]; then
  return
fi
final=$(grep "${changed1[@]}" $HOME/.cache/torrent/formated.txt | awk -F ':-:' '{print $2}')
# +  final=/pegasproductions-22-01-18-luna-temptress-my-step-sis-tiny-pussy-xxx-720p-hevc-x265-prt-xvx-t5129078.html

echo "Loading ..." | $DMENU &
PID2=$!
curl -x 'socks5://localhost:9050' -A "$browser" "$Baseurl$final" > $HOME/.cache/torrent/checkfile.html
kill $PID2
magnetlink=$(/home/hextron/Tools/project/kicksearch/regexmatch/regexm $HOME/.cache/torrent/checkfile.html)


if [[ -n "$magnetlink" ]]; then
  qbittorrent "$magnetlink" &
fi
