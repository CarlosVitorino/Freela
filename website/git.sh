#!/bin/sh

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
echo $LOCAL
echo $REMOTE  
echo $BASE
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Will pull"
    git pull
    echo "building..."
    ./fastBuild.sh
elif [ $REMOTE = $BASE ]; then
    echo "Forcing pull"
    git reset --hard HEAD && git clean -f && git pull
    echo "building..."
    ./fastBuild.sh
else
    echo "Diverged"
fi