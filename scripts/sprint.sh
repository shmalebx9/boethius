#!/bin/bash

PATHS=$HOME/.local/share/boethius/searchpaths
LIST=$HOME/.local/share/boethius/sprintlist

getconfig() {
   while IFS= read -r line; do
      case $line in
         [[:alnum:]]* | /*) echo "$line" ;;
      esac
   done < "$1"
}

generate() {
   getconfig $PATHS |
      xargs -I% find % -maxdepth 6 > $LIST
}

Dircheck() {
	if [ -d "$1" ] ; then
		Dirsearch "$1"
	elif [ -z "$1" ] ; then
		exit 1
	else
		printf "%q\n" "$1" | xargs -I% opener % 
	fi
}

Dirsearch() {
	 prefix="$1"
	 selected=$(ls -1Ap $1 | AWMmenu -d)
	 	if [ -z "${selected##+([[:space:]])}" ] ; then
			echo "none selected"
			exit 1
		fi
	 Dircheck "$prefix/$selected"
}

filesearch() {
      RESULT=$(grep "$1" "$LIST" | head -1)
      if [ -z "${1##+([[:space:]])}" ] ; then
      	echo "none selected" ; exit 1
      elif [ -d $RESULT ]; then
      	Dirsearch $(grep "$1" $LIST)
      else
      	printf "%q\n" "$RESULT" | xargs -I% opener % #replace opener with 'exo-open if you face trouble'
  	  fi
}

Search(){
   	query=$(awk -F / '{print $(NF-1)"/"$NF}' $LIST | AWMmenu -d )
     filesearch "$query" 
}

case $* in
	-g) generate ;;
	*) Search ;; 
esac
