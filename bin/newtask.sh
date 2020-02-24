LOWER=$(echo $1 | tr '[:upper:]' '[:lower:]')
UPPER=$(echo $1 | tr '[:lower:]' '[:upper:]')
mkdir -p out
echo It is $UPPER  ... $LOWER
sed s/COMMS/$UPPER/g ./template/task.c.template  | sed s/comms/$LOWER/g | sed  s/__USER/$USER/g | sed s/__DATE/"$(date)"/g >./out/$LOWER.c
sed s/COMMS/$UPPER/g ./template/task.h.template  | sed s/comms/$LOWER/g | sed  s/__USER/$USER/g | sed s/__DATE/"$(date)"/g >./out/$LOWER.h
sed s/COMMS/$UPPER/g ./template/task_noos.c.template | sed s/comms/$LOWER/g | sed  s/__USER/$USER/g | sed s/__DATE/"$(date)"/g >./out/"$LOWER"noos.c
#sed s/comms/abc/g comms.c | sed s/COMMS/ABC/g
