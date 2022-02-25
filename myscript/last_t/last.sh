

#!/bin/bash

set -xe
DMENU="dmenu -l 15  -i -p choose -sb purple"
Baseurl="https://thepiratebay0.org/rss"
Nice="
Search
Audio :-:$Baseurl//top100/100
Music Top100 :-:$Baseurl/top100/101
Music Newest  :-:$Baseurl/new/101
Audio books Top100 :-:$Baseurl/top100/102
Audio books Newest :-:$Baseurl/new/102
Sound clips Top100 :-:$Baseurl/top100/103
Sound clips Newest :-:$Baseurl/new/103
FLAC Top100 :-:$Baseurl/top100/104
FLAC Newest :-:$Baseurl/new/104
Audio Other Top100 :-:$Baseurl/top100/199
Audio Other Newest :-:$Baseurl/new/199

Video :-:$Baseurl//top100/200 
Video Movies Top100 :-:$Baseurl/top100/201
Video Movies Newest :-:$Baseurl/new/201
Video Movies DVDR Top100 :-:$Baseurl/top100/202
Video Movies DVDR Newest :-:$Baseurl/new/202
Video Music videos Top100 :-:$Baseurl/top100/203
Video Music videos Newest :-:$Baseurl/new/203
Video Movie clips Top100 :-:$Baseurl/top100/204
Video Movie clips Newest :-:$Baseurl/new/204
Video TV shows Top100 :-:$Baseurl/top100/205
Video TV shows Newest :-:$Baseurl/new/205
Video Handheld Top100 :-:$Baseurl/top100/206
Video Handheld Newest :-:$Baseurl/new/206
Video HD - Movies Top100 :-:$Baseurl/top100/207
Video HD - Movies Newest :-:$Baseurl/new/207
Video HD - TV shows Top100 :-:$Baseurl/top100/208
Video HD - TV shows Newest :-:$Baseurl/new/208
Video 3D Top100 :-:$Baseurl/top100/209
Video 3D Newest :-:$Baseurl/new/209
Video Other Top100 :-:$Baseurl/top100/299
Video Other Newest :-:$Baseurl/top100/299

Applications :-:$Baseurl//top100/300
Applications Windows Top100 :-:$Baseurl/top100/301
Applications Windows Newest :-:$Baseurl/new/301
Applications Mac Top100 :-:$Baseurl/top100/302
Applications Mac Newest :-:$Baseurl/new/302
Applications UNIX Top100 :-:$Baseurl/top100/303
Applications UNIX Newest :-:$Baseurl/new/303
Applications Handheld Top100 :-:$Baseurl/top100/304
Applications Handheld Newest :-:$Baseurl/new/304
Applications IOS (iPad/iPhone) Top100 :-:$Baseurl/top100/305
Applications IOS (iPad/iPhone) Newest :-:$Baseurl/new/305
Applications Android Top100 :-:$Baseurl/top100/306
Applications Android Newest :-:$Baseurl/new/306
Applications Other OS Top100 :-:$Baseurl/top100/399
Applications Other OS Newest :-:$Baseurl/new/391

Games :-:$Baseurl//top100/400
Games PC Top100 :-:$Baseurl/top100/401
Games PC Newest :-:$Baseurl/new/401
Games Mac Top100 :-:$Baseurl/top100/402
Games Mac Newest:-:$Baseurl/new/402
Games PSx Top100 :-:$Baseurl/top100/403
Games PSx Newest :-:$Baseurl/new/403
Games XBOX360 Top100 :-:$Baseurl/top100/404
Games XBOX360 Newest :-:$Baseurl/new/404
Games Wii Top100 :-:$Baseurl/top100/405
Games Wii Newest :-:$Baseurl/new/405
Games Handheld Top100 :-:$Baseurl/top100/406
Games Handheld Newest :-:$Baseurl/new/406
Games Android Top100 :-:$Baseurl/top100/408
Games Android Newest :-:$Baseurl/new/408
Games Other Top100 :-:$Baseurl/top100/499
Games Other Newest :-:$Baseurl/new/499

Porn :-:$Baseurl//top100/500
Porn Movies Top100  :-:$Baseurl/top100/502
Porn Movies Newest :-:$Baseurl/new/501
Porn Movies DVDR Top100 :-:$Baseurl/top100/502
Porn Movies DVDR Newest  :-:$Baseurl/new/502
Porn Pictures Top100 :-:$Baseurl/top100/503
Porn Pictures Newest  :-:$Baseurl/new/503
Porn Games Top100 :-:$Baseurl/top100/504
Porn Games Newest  :-:$Baseurl/new/504
Porn HD - Movies Top100 :-:$Baseurl/top100/505
Porn HD - Movies Newest  :-:$Baseurl/new/505
Porn Movie clips Top100 :-:$Baseurl/top100/506
Porn Movie clips Newest  :-:$Baseurl/new/506
Porn Other Top100 :-:$Baseurl/top100/599
Porn Other Newest  :-:$Baseurl/new/599

Others
E-books Top100 :-:$Baseurl/top100/601
E-books Newest :-:$Baseurl/new/601
Comics Top100 :-:$Baseurl/top100/602
Comics Newest :-:$Baseurl/new/602
Pictures Top100 :-:$Baseurl/top100/603
Pictures Newest :-:$Baseurl/new/603
Covers Top100 :-:$Baseurl/top100/604
Covers Newest :-:$Baseurl/new/604
Physibles Top100 :-:$Baseurl/top100/605
Physibles Newest :-:$Baseurl/new/605
Other Top100 :-:$Baseurl/top100/699
Other Newest :-:$Baseurl/new/699
" 

value=$(echo -e "$Nice" |   awk -F ':-:' '{print $1}' | $DMENU)
if [[ $value = "Search" ]]; then 
	./todo
	exit 0
fi
newvalue=$(echo -e "$Nice" | grep "$value" | head -n 1 | awk -F ':-:' '{print $2}')
read
#./torrent.sh "$newvalue" "$value"





function main() {


	local DMENU="dmenu -l 15  -i -sb purple"
	local testurl="https://subsplease.org/rss/"
	local baseurl="$1"
	local vari="$2"
	echo "vari:$vari"
	local browser="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36"
	echo "Loading ..." | $DMENU &
	PID=$!
	curl  -x 'socks5://localhost:9050' -A "$browser" "$baseurl" > $HOME/.cache/torrent/testurl.txt
	local parameter="-i -xml"
	if [[ -f "$HOME/.cache/torrent/New.xml" ]] ; then
		rm $HOME/.cache/torrent/New.xml
	fi
	tidy $parameter $HOME/.cache/torrent/testurl.txt >>  $HOME/.cache/torrent/New.xml
	/home/hextron/Tools/project/last_torrent/box > $HOME/.cache/torrent/formated.txt
	kill $!
	# cat $HOME/.cache/torrent/formated.txt | fzf --delimiter ':-:'  --with-nth 1,2,3  --bind 'enter:execute(qbittorrent {4} & )'  -i
	# cat $HOME/.cache/torrent/formated.txt | $DMENU


	local new=$(cat $HOME/.cache/torrent/formated.txt | awk -F ':-:' '{print $1" -:  "$2}' | $DMENU -p "$vari :" )
	echo -e "1:$new"
	local newchange=$(echo -e "$new" | awk -F ' -:  ' '{print $1}')
	echo -e "2:$newchange"
	local box=( "$newchange")
	echo $box
	local changed=$(echo  "$box" | awk -F '[' '{print $1}')
	echo $changed 
	local changed1=("$changed")
	echo $changed1
	if [[ -z "$changed1" ]]; then 
		return
	fi

	#//grep The.Matrix.Resurrections.2021.HDRip.XviD.AC3-EVO /home/hextron/.cache/torrent/formated.txt
	#grep $newchange $HOME/.cache/torrent/formated.txt
	local final=$(grep  "${changed1[@]}"  ${HOME}/.cache/torrent/formated.txt | awk -F ':-:' '{print $4}')
	echo "$final"
	if [[ -n "$final" ]]; then
		qbittorrent "$final" &
	fi
	echo -e "$final"

}
main "$newvalue" "$value"

