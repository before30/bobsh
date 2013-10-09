#!/bin/bash

echo "#### Start ####"
# directory check
echo "1. make directory ~/.bobsh"
mkdir -p ~/.bobsh
# copy file
echo "2. copy bob.sh to ~/.bobsh direcotry"
cp bob.sh ~/.bobsh
echo "3. copy bobcrowler.py to ~/.bobsh directory"
cp bobcrowler.py ~/.bobsh
# chage mode
echo "4. bob.sh change mode to execute"
chmod 755 ~/.bobsh/bob.sh
echo "#### Finish ####"
echo "You have to add bob.sh related code to shell configuration"
