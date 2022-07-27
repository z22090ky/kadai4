#!/bin/bash


check_Num(){
	if expr "$1" : "^[0-9]" >&/dev/null;then
		return 0
	else
		echo  "Not Number!"
		exit 1
	fi

}

gcd(){
	while [ ! 0 -eq "$2" ]; do
		set -- "$2" "`expr "$1" % "$2"`"
	done
	echo "$1"
}

check_Num $1
check_Num $2
gcd $1 $2

