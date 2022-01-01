#!/bin/bash

echo "Completed download $1  =  $2  , $(date) " >> complete
wall "Completed download $1  =  $2  , $(date) "
shutdown +5
i3-nagbar -t warning -m " Completed download $2 , Cancel shutdown? " -B 'OK' 'shutdown -c && killall -p i3-nagbar'
#shutdown 
#if [[ "$1" == "66fb374069f66ef0067fc668d43e2b96ac79d354" ]]
#then 
#	echo "Completed download $1  =  $2 " >> complete
#	i3-nagbar  -m "$2 completed" 
#       	shutdown 
#fi
#
