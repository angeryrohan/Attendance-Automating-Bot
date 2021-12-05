classOne=$(date -d "15:00" +%s)
differenceOne=$((classOne - $(date +%s)))
newDay=$(date -d "23:59" +%s)

if [ $differenceOne -lt 0 ]
then
#You missed Class One, All Classes Missed.
    echo "Waiting for Tomorrow"
    echo "Sleeping for $((newDay - $(date +%s))) seconds"
    sleep $((newDay+60 - $(date +%s)))
    ./thursday.sh
else
    echo "Waiting for [Class 1: Electronics Theory] to Start"
    sleep $differenceOne
    python electronicsTHE.py
    ./master.sh
fi

$SHELL 