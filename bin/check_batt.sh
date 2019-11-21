#/bin/sh

level=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | sed 's/.* //' | sed 's/%//')

echo Level = $level
echo $(date) Level = $level > ~/.last_batt.txt

if [ $level -lt 10 ];
then
   wall "Battery is $level"
fi
