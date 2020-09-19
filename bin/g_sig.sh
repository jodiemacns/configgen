#!/bin/bash

# https://www.linode.com/docs/security/encryption/gpg-keys-to-send-encrypted-messages/

ACTION=$1
FILE=$2
USER=$2


#--------------------------------------------------------------------------------
# Help menu 
if [ "$ACTION" == "?" ]
then
    echo "*** ? = help.              $0 ?           "
    echo "*** s = Sign Document      $0 s doc.pdf   "
    echo "*** v = verify Document    $0 v           "
    echo "*** i = import key         $0 i           "
    echo "*** C = Create signing key $0 C           "
    echo "*** E = export key         $0 E           "
    echo "*** z = zip Document       $0 z           "
    echo "*** u = unzip Document     $0 u           "
    echo "*** e = encrypt file       $0 e           "
    echo "*** e = decrypt file       $0 e           "
    exit
fi

#--------------------------------------------------------------------------------
# Sign file
if [ "$1" == "s" ]
then
    gpg -a --output $FILE.sig  --detach-sig $FILE
    exit
fi

#--------------------------------------------------------------------------------
# Verify file
if [ "$1" == "v" ]
then
    gpg --verify $FILE.sig  $FILE
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
# Import key
if [ "$1" == "i" ]
then
    gpg --import $FILE
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

