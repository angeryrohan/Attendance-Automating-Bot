#get time

now=$(date +"%T")
echo "Current time : $now"

#get day name
DAYOFWEEK=$(date +"%a")
echo DAYOFWEEK: $DAYOFWEEK
if [ "$DAYOFWEEK" == "Mon" ];
then   
   ./monday.sh
elif [ "$DAYOFWEEK" == "Tue" ];
then
    ./tuesday.sh
elif [ "$DAYOFWEEK" == "Wed" ];
then
    ./wednesday.sh
elif [ "$DAYOFWEEK" == "Thu" ];
then
    ./thursday.sh
elif [ "$DAYOFWEEK" == "Fri" ];
then
    ./friday.sh
else 
    ./friday.sh
fi
$SHELL