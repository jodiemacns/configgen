mkdir -p /tmp/$USER
wget "https://seinfeld-quotes.herokuapp.com/random" -qO-  > /tmp/$USER/.sjoke.json
jq '.quote' /tmp/$USER/.sjoke.json > /tmp/$USER/.msg  
echo $'\n' >> /tmp/$USER/.msg
jq '.author' /tmp/$USER/.sjoke.json >> /tmp/$USER/.msg 
cat /tmp/$USER/.msg | recode html | cowsay
rm -fr /tmp/$USER
