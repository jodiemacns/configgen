#!/bin/sh

FILENAME=~/configgen/quotes/seinfeld.json

LENGTH=`expr "$(cat $FILENAME | jq '.quotes | length')" - "1"`
RAND_QUOTEITEM=$(shuf -i 1-"$LENGTH" -n1)

#echo length = $LENGTH and RQI $RAND_QUOTEITEM
#echo ---------

ITEM=$(cat $FILENAME | jq ".quotes[$RAND_QUOTEITEM]")
QUOTE=$(echo "$ITEM" | jq '.quote' | sed 's/\"//g')
AUTHOR=$(echo "$ITEM" | jq '.author' | sed 's/\"//g')
SEASON=$(echo "$ITEM" | jq '.season' | sed 's/\"//g')
EPISODE=$(echo "$ITEM" | jq '.episode' | sed 's/\"//g')

echo $QUOTE "\n" $AUTHOR "    -" \(S"$SEASON"E"$EPISODE"\)  | cowsay

