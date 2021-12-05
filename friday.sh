classOne=$(date -d "08:05" +%s)
classTwo=$(date -d "09:55" +%s)
classThree=$(date -d "11:40" +%s)
classFour=$(date -d "14:00" +%s)
classFive=$(date -d "16:00" +%s)
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
                    echo "Waiting for  Monday"
                    sleep $((newDay+86460 - $(date +%s)))
                    ./monday.sh
                else
                    echo "Waiting for [Class 5: Python Theory] to Start"
                    sleep $differenceFive
                    python pythonTHE.py
                    ./master.sh
                fi
            else
                echo "Waiting for [Class 4: Maths Theory] to Start"
                sleep $differenceFour
                python mathTHE.py
                ./master.sh
            fi
        else
            echo "Waiting for [Class 3: Ethnus] to Start"
            sleep $differenceThree
            python ethnus.py
            ./master.sh
        fi
    else
        echo "Waiting for [Class 2: Python] to Start" 
        sleep $differenceTwo
        python pythonLAB.py
        ./master.sh
    fi
else
    echo "Waiting for [Class 1: Physics LAB] to Start"
    sleep $differenceOne
    python physicsLAB.py
    ./master.sh
fi

$SHELL 