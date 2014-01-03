#!/bin/ksh
# change the project name of this project into yours
# all occurences of "dupro" will be replaced by $1 in all files
# then all directories called dupro will be renamed into $1 as well
DUPRO=dupro

if [[ -z "$1" ]]; then
    echo "We need a project name as argument"
    exit 1
fi

PROJECT_NAME="$1"

echo "Project name you choose is $PROJECT_NAME"
echo -e "Is this correct [y/N]? \c"
read Answer
if [[ "$Answer" = [yY] ]]; then
    echo
    echo "OK - new project name is $PROJECT_NAME"
else
    echo "Restart the script to correct the project name"
    exit 1
fi

echo "Current directory is $PWD"
echo -e "Please confirm this is correct before we proceed [y/N] \c"
read Answer
if [[ "$Answer" = [yY] ]]; then
    echo
    echo "OK - current directory is $PWD and we will continue..."
    echo "We will now replace all occurences of \"$DUPRO\" into \"$PROJECT_NAME\""
else
    echo "Go into the correct directory before restarting the script again"
    exit 1
fi

echo
find . -type f -exec grep $DUPRO {} /dev/null \; | grep -v -E '(.git|change_project_name.sh)' | cut -d: -f1 > /tmp/my_dummy_file.txt
for FILE in $(sort -u /tmp/my_dummy_file.txt)
do
    echo "File $FILE contains \"$DUPRO\" and we replace this keyword with \"$PROJECT_NAME\""
    sed -e "s#$DUPRO#$PROJECT_NAME#g" < $FILE > ${FILE}.tmp
    mv -f ${FILE}.tmp $FILE
done
rm -f /tmp/my_dummy_file.txt

echo
echo "Rename the main script from \"$DUPRO\" into \"$PROJECT_NAME\""
FILE=$( find . -name $DUPRO )
echo "Executing mv $FILE $(dirname $FILE)/$PROJECT_NAME"
mv $FILE $(dirname $FILE)/$PROJECT_NAME

echo
echo "Now replace all directory names \"$DUPRO\" into \"$PROJECT_NAME\""
for DIR in $( find . -type d -name $DUPRO )
do
    echo "Executing mv $DIR $(dirname $DIR)/$PROJECT_NAME"
    mv $DIR $(dirname $DIR)/$PROJECT_NAME
done
echo
echo "Remaining one step and that is renaming current directory"
echo "$PWD into $(dirname $PWD)/$PROJECT_NAME"
mv $PWD $(dirname $PWD)/$PROJECT_NAME
cd ..
cd $PROJECT_NAME
echo
echo "Current project directory is $PWD"
echo "done"
