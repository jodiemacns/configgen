#!/bin/bash

# https://www.linode.com/docs/security/encryption/gpg-keys-to-send-encrypted-messages/

ACTION=$1
FILE=$2
USER=$2

#--------------------------------------------------------------------------------
# Help menu 
if [ "$ACTION" == "?" ]
then
    echo "*** ? = help.              g_sig.sh ?             "
    echo "*** S = Sign Document      g_sig.sh S doc.pdf     "
    echo "*** v = verify Document    g_sig.sh v doc.pdf     "
    echo "*** i = import key         g_sig.sh i             "
    echo "*** E = export key         g_sig.sh E             "
    echo "*** L = list you keys      g_sig.sh L             "
    echo "*** l = list keys          g_sig.sh l             "
    echo "*** C = Create signing key g_sig.sh C             "
    echo "*** z = zip Document       g_sig.sh z to to       "
    echo "*** u = unzip Document     g_sig.sh u             "
    echo "*** e = encrypt file       g_sig.sh e file to to  "
    echo "*** d = decrypt file       g_sig.sh e file.tar.gz "
    exit
fi

#--------------------------------------------------------------------------------
# Sign file
if [ "$1" == "S" ]
then
    gpg -a --output $FILE.tmp.sig  --detach-sig $FILE
    cat $FILE.tmp.sig >> $FILE.sig
    chmod 777 $FILE.sig
    rm $FILE.tmp.sig
    exit
fi

#--------------------------------------------------------------------------------
# Verify file
if [ "$1" == "v" ]
then
    gpg --status-fd 1 --verify $FILE.sig  $FILE 2>/dev/null | grep GOODSIG
    exit
fi

#--------------------------------------------------------------------------------
# Export the public key 
if [ "$1" == "E" ]
then
    gpg --armor --export $USER
    exit
fi

#--------------------------------------------------------------------------------
# Export the public key 
if [ "$1" == "L" ]
then
    gpg --list-secret-keys
    exit
fi

#--------------------------------------------------------------------------------
# Export the public key 
if [ "$1" == "E" ]
then
    gpg --list-public-keys
    exit
fi

#--------------------------------------------------------------------------------
# Import key
if [ "$1" == "i" ]
then
    gpg --import $FILE
    exit
fi

#--------------------------------------------------------------------------------
# Fingerprint key
if [ "$1" == "f" ]
then
    gpg --fingerprint $USER
    exit
fi

#--------------------------------------------------------------------------------
# Create key
if [ "$1" == "C" ]
then
    gpg --full-generate-key
    exit
fi

#--------------------------------------------------------------------------------
# Compress file
if [ "$1" == "z" ]
then
    tar -czvf $FILE.tar.gz $FILE 
    exit
fi

#--------------------------------------------------------------------------------
# Decompress file
if [ "$1" == "u" ]
then
    tar -xzvf $FILE
    exit
fi

#--------------------------------------------------------------------------------
# Encrypt file
if [ "$1" == "e" ]
then
    command="gpg --output $FILE.gpg --encrypt "
    shift 
    shift 
    while (( "$#" )); do 
        echo $1 
        command+="--recipient $1 "
        shift 
    done
    command+="$FILE"
    $command
    exit
fi

#--------------------------------------------------------------------------------
# Decrypt file
if [ "$1" == "d" ]
then
    command="gpg -d $FILE"
    command=$(echo $command | sed 's/\.gpg//')
    $command
    exit
fi
