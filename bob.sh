#!/bin/bash

bobmenu_file=~/.bobmenus
bobsh_home=~/.bobsh

now()
{
	date +%s
}

bobMenuSelect()
{
	if [ -f $bobmenu_file ];
    then
		old_IFS=$IFS
		IFS=$'\n'
		menus=($(cat ${bobmenu_file})) # array
		IFS=$old_IFS

		myhour=($(date +'%H'))
		
		length=${#menus[@]}
		if [ $length -lt 4 ]
		then
			echo "메뉴없음 $length"
			return;
		fi
		
		if [ $myhour -ge 19 ]
		then
			echo "메뉴없음"

		elif [ $myhour -ge 13 ]
		then
			echo "${menus[3]}"

		elif [ $myhour -ge 8 ] 
		then
			num=$RANDOM
			if [ $(($num % 2)) -eq 0 ]; then
				echo "${menus[1]}"
			else
				echo "${menus[2]}"
			fi
		else
			echo "$myhour ${menus[0]}"
		fi
	else	
		echo "메뉴없음"
		return;	
    fi
}

bobMenus()
{

	poll_every=3600
    bobcrowler="${bobsh_home}/bobcrowler.py"
   
	if [ ! -f ${bobmenu_file} ]; 
    then
    	python $bobcrowler > $bobmenu_file 2>/dev/null
   	else
		last_run=$(stat -f %c ${bobmenu_file})
	fi

    if [ $(( $last_run + $poll_every )) -lt $(now) ];
    then
    	python $bobcrowler > $bobmenu_file 2>/dev/null
	fi

    bobMenuSelect
}

bobMenus
