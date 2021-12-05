classOne=$(date -d "08:00" +%s)
classTwo=$(date -d "10:00" +%s)
classThree=$(date -d "11:40" +%s)
classFour=$(date -d "14:05" +%s)
classFive=$(date -d "17:00" +%s)
newDay=$(date -d "23:59" +%s)
differenceOne=$((classOne - $(date +%s)))
differenceTwo=$((classTwo - $(date +%s)))
differenceThree=$((classThree - $(date +%s)))
differenceFour=$((classFour - $(date +%s)))
differenceFive=$((classFive- $(date +%s)))
if [ $differenceOne -lt 0 ]
then
#You missed Class One, Check for second class
    if [ $differenceTwo -lt 0 ]
    then
    #You missed Class Two, Check for Third class
        if [ $differenceThree -lt 0 ]
        then
        #You missed Class Three, Check for Fourth class
            if [ $differenceFour -lt 0 ]
            then
            #You missed Class Four, Check for Five class
                if [ $differenceFive -lt 0 ]
                then
                #You missed Class Five, All classes Missed
                    echo "Waiting for Tomorrow"
                    echo "Sleeping for $((newDay - $(date +%s))) seconds"
                    sleep $((newDay+60 - $(date +%s)))
                    ./tuesday.sh
                else
                    echo "Waiting for [Class 5: Physics Theory] to Start"
                    sleep $differenceFive
                    python physicsTHE.py
                    ./master.sh
                fi
            else
                echo "Waiting for [Class 4: Electronics Theory] to Start"
                sleep $differenceFour
                python electronicsTHE.py
                ./master.sh
            fi
        else
            echo "Waiting for [Class 3: Electronics LAB] to Start"
            sleep $differenceThree
            python electronicsLAB.py
            ./master.sh
        fi
    else
        echo "Waiting for [Class 2: Ethnus] to Start" 
        sleep $differenceTwo
        python ethnus.py
        ./master.sh
    fi
else
    echo "Waiting for [Class 1: Python] to Start"
    sleep $differenceOne
    python pythonLAB.py
    ./master.sh
fi

$SHELL 