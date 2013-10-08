#!/bin/bash

getNowDay()
{
	date +%d
}

getOriginFileDay()
{
	last_run=$(stat -f %c ~/.bobmenus)
	date -r $last_run +%d
}

bobMenuSelect()
{
    bobmenu_file=~/.bobmenus


    if (egrep -q '.' ${bobmenu_file}); 
    then
		old_IFS=$IFS
		IFS=$'\n'
		menus=($(cat $bobmenu_file)) # array
		IFS=$old_IFS

		myhour=($(date +'%H'))
		
		length=${#menus[@]}
		if [ $length -lt 4 ]
		then
			echo "메뉴없음"
			return;
		fi
		
		if [ $myhour -gt 19 ]
		then
			echo "메뉴없음"

		elif [ $myhour -gt 13 ]
		then
			echo "${menus[3]}"

		elif [ $myhour -gt 8 ] 
		then
			echo "${menus[1]},${menus[2]}"

		else
			echo "${menus[0]}"
		fi
	else	
		echo "메뉴없음"
		return;	
    fi
}

bobMenus()
{
    cliww="$(pwd)/bobcrowler.py"
    if ! [ -e ~/.bobmenus ]; 
    then
        python ${cliww} > ~/.bobmenus
    fi

    last_run_day=$(getOriginFileDay)
    if [ $last_run_day -ne $(getNowDay) ];
    then
        res=$(python ${cliww})
        echo ${res} > ~/.bobmenus
	fi

    bobMenuSelect
}

bobMenus
