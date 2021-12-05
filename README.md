# What is AttendanceBot MS Teams?
One click = 100% online attendance (unless you're being called in your class! Ratz!) <br>
<b>This is made using python, + selenium and shell scripts.</b>
<br>
You execute one shell script, and never turn off your PC. the "master" shell script detects current time and date, then waits for the upcoming lecture time.
When the time comes, it runs the required python file which logs you into your meeting & exits it when its over, then the bot starts waiting for the next one. <br>
<i><b>This process keeps repeating itself...</b></i>

# Understanding how it all works:

-> You need to have a fixed schedule/Time table of your lectures which is repeatitive.<br>
-> Role of python files: click on buttons etc, fill in input boxes etc.<br> That's how you join into your meetings!<br><br><i> Note: Difference python files open up different meetings, this is something that you'd have to set on your own.<br> Example: "physicsTHE.py" opens up the physics theory lecture meeting tab</i><br><br>
-> Role of BASH files: detect current time and date, and execute specific python files according to the timetable and subject.<br>


# Example: A class of Physics is at 8:00 in the morning

-> So You'd run a shell script anytime before the class timing <br>
-> The script would start waiting for  " 8:00  AM " <br>
-> When the time comes, the shell script runs a python file that opens the "Physics" tab and joins into the meeting. (Because different python files are allocated to different subjects.)<br>
-> Then the bot sleeps for ```<Class Duration>``` (you can set this in the python code files) and then exits the meeting.
  
  
 # Awesome, how do I use it for myself?
 **Video To be uploaded**
