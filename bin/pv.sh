
if [ $2 ]
then
   gpg -d $1 | grep $2 | csvprint.sh
else
   gpg -d $1 | csvprint.sh
fi
