#!/bin/sh
if [ -f $1 -o -d $1 ]
then
	echo "\e[1;95mPermissions Updated!\e[0m"
	if [ -f $1 ]
	then
		echo "\e[1;93mType: Regular File\e[0m"
		echo "\e[91mBefore: \c\e[0m"
		ls -l | grep $1
		if [ -x $1 -a -z $2 ]
		then
			chmod 644 $1
		elif [ ! -z $2 ]
		then
			chmod $2 $1
		elif [ ! -x $1 -a -z $2 ]
		then
			chmod 744 $1
		fi
		echo "\e[92mAfter : \c\e[0m"
		ls -l | grep $1
	elif [ -d $1 ]
	then
		echo "\e[1;96mType: Directory\e[0m"
		echo "\e[91mBefore: \c\e[0m"
		ls -l | grep $1
		if [ ! -z $2 ]
		then
			chmod $2 $1
			chmod o-t $1
		else
			chmod 755 $1
			chmod o-t $1
		fi
		echo "\e[92mAfter : \c\e[0m"
		ls -l | grep $1
	fi
else
	echo "\e[91mFile doesn't exist\e[0m"
fi
