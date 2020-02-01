LOWER=$(echo $1 | tr '[:upper:]' '[:lower:]')
UPPER=$(echo $1 | tr '[:lower:]' '[:upper:]')

echo It is $UPPER  ... $LOWER
sed s/COMMS/$UPPER/g task.c.template | sed s/comms/$LOWER/g | sed  s/__USER/$USER/g | sed s/__DATE/"$(date)"/g >$LOWER.c
sed s/COMMS/$UPPER/g task.h.template | sed s/comms/$LOWER/g | sed  s/__USER/$USER/g | sed s/__DATE/"$(date)"/g >$LOWER.h
#sed s/comms/abc/g comms.c | sed s/COMMS/ABC/g
