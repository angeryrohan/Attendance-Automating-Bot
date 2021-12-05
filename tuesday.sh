classOne=$(date -d "09:50" +%s)
classTwo=$(date -d "14:00" +%s)
classThree=$(date -d "16:00" +%s)
newDay=$(date -d "23:59" +%s)

differenceOne=$((classOne - $(date +%s)))
differenceTwo=$((classTwo - $(date +%s)))
differenceThree=$((classThree - $(date +%s)))

if [ $differenceOne -lt 0 ]
then
#You missed Class One, Check for second class
    if [ $differenceTwo -lt 0 ]
    then
    #You missed Class Two, Check for Third class
        if [ $differenceThree -lt 0 ]
        then
        #You missed Class Three, All classes missed.
            echo "Waiting for Tomorrow"
            echo "Sleeping for $((newDay - $(date +%s))) seconds"
            sleep $((newDay+60 - $(date +%s)))
            ./wednesday.sh
        else
            echo "Waiting for [Class 3: Maths Theory] to Start"
            sleep $differenceThree
            python mathTHE.py
            ./master.sh
        fi
    else
        echo "Waiting for [Class 2: Physics Theory] to Start" 
        sleep $differenceTwo
        python physicsTHE.py
        ./master.sh
    fi
else
    echo "Waiting for [Class 1: Maths LAB] to Start"
    sleep $differenceOne
    python mathLAB.py
    ./master.sh
fi

$SHELL 