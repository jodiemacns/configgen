if [ $1 ]
then
    echo Writing $1 to /dev/sdb
    sudo dd if=$1 of=/dev/sdb bs=32M status=progress
else
    echo Need a file name
fi
