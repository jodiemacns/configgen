#/bin/sh

if [ -z $1 ]
then
    echo we need a variable 
    exit
fi

OUTFILE=$2
if [ -z $OUTFILE ]
then
    OUTFILE=out
fi

youtube-dl -f replay-500 $1 -o $OUTFILE
ffmpeg -i $OUTFILE -vn -acodec copy $OUTFILE.aac
