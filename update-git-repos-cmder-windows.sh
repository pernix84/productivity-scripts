#!/bin/sh

# TODO: fix this, works on windows, cmder only
FIND_LOCATION=$CMDER_ROOT/vendor/git-for-windows/usr/bin/find.exe

# store the current dir
CUR_DIR=$(pwd)

if [ ! -z $1 ]
then
    CUR_DIR=$(readlink -f $1)
fi

echo $CUR_DIR

# Let the person running the script know what's going on.
echo "Pulling in latest changes for all repositories..."

# Find all git repositories and update it to the master latest revision
#  find . -type d -exec test -e '{}/.git' ';' -print -prune
# alternative: xargs -I {} dirname {} use in pipe
for i in $($FIND_LOCATION $CUR_DIR -maxdepth 2 -type d -exec test -e '{}/.git' ';' -print); do # Not my best script line of all time
    
    echo "In Folder: $i"
    cd "$i";

    # pull your stuff, given your are 
    git pull origin master;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo "Complete!"
