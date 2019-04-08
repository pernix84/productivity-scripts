#!/bin/sh

FIND="find"

# For windows
if [ ! "$OSTYPE" == "msys" ] 
then
    FIND="$CMDER_ROOT\\vendor\\git-for-windows\\usr\\bin\\find.exe"
fi

echo -e "Using this find: \e[34m" 
echo $FIND
echo -e "\e[0m"

# Store the current dir
CUR_DIR=$PWD

if [ ! -z $1 ] 
then
    CUR_DIR=$(readlink -f $1)
fi

# Let the person running the script know what's going on.
echo "Pulling in latest changes for all repositories..."

# Find all git repositories and update it to the master latest revision
#  find . -type d -exec test -e '{}/.git' ';' -print -prune
# alternative: xargs -I {} dirname {} use in pipe
for i in $($FIND $CUR_DIR -maxdepth 2 -type d -exec test -e '{}/.git' ';' -print); do # Not my best script line of all time
    
    echo -e "In Folder:\e[33m $i\e[0m"
    cd "$i";

    # pull your stuff, given your are 
    git pull # origin master;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo -e "\n\e[32mComplete!\033[0m\n"
