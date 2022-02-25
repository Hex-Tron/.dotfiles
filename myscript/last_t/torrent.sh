#!/bin/bash

function main() {


	local DMENU="dmenu -l 15  -i -sb purple"
	local testurl="https://subsplease.org/rss/"
	local baseurl="$1"
	local vari="$2"
	echo "vari:$vari"
	read
	local browser="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36"
	curl  -x 'socks5://localhost:9050' -A "$browser" "$baseurl" > $HOME/.cache/torrent/testurl.txt
	local parameter="-i -xml" 
	if [[ -f "$HOME/.cache/torrent/New.xml" ]] ; then 
		rm $HOME/.cache/torrent/New.xml
	fi
	tidy $parameter $HOME/.cache/torrent/testurl.txt >>  $HOME/.cache/torrent/New.xml
	./box > $HOME/.cache/torrent/formated.txt
	# cat $HOME/.cache/torrent/formated.txt | fzf --delimiter ':-:'  --with-nth 1,2,3  --bind 'enter:execute(qbittorrent {4} & )'  -i
	# cat $HOME/.cache/torrent/formated.txt | $DMENU


	local new=$(cat $HOME/.cache/torrent/formated.txt | awk -F ':-:' '{print $1" -:  "$2}' | $DMENU -p "$vari :" )
	echo -e "1:$new"
	local newchange=$(echo -e "$new" | awk -F ' -:  ' '{print $1}')
	echo -e "2:$newchange"
	local box=( "$newchange")
	local changed=$(echo  "$box" | awk -F '[' '{print $1}')
	local changed1=("$changed")
	#//grep The.Matrix.Resurrections.2021.HDRip.XviD.AC3-EVO /home/hextron/.cache/torrent/formated.txt
	#grep $newchange $HOME/.cache/torrent/formated.txt
	local final=$(grep  "${changed1[@]}"  ${HOME}/.cache/torrent/formated.txt | awk -F ':-:' '{print $4}')
	if [[ -n "$final"]]; then
		qbittorrent "$final" &
	fi
	echo -e "$final"

}

main $1 "$2"
