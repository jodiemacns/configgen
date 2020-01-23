while read -r line; 
do 
	youtube-dl -x --audio-format mp3 $line
done < file.txt
