echo "#### Start ####"
# delete file in directory
if [ -d ~/.bobsh ];
then
	echo "Delete .bobsh directory and files"
	rm -rf ~/.bobsh
fi
# delete menu file
if [ -f ~/.bobmenus ];
then
	echo "Delete ~/bobmenus file"
	rm ~/.bobmenus
fi

echo "#### Finish ####"
echo "You have to earse bob.sh related code in shell configuration."

