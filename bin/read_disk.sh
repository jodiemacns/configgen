if [ $1 ]
then
    echo reading $1 from /dev/sdb
    sudo dd of=./$1 if=/dev/sdb bs=512 count=4390912 status=progress
else
    echo Need a file name
fi
