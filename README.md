# AttendanceBot for MS Teams

One click = 100% online attendance (unless you're being called in your class! Ratz!)
Built with **Python + Selenium + shell scripts**.

Run one script, leave your PC on, and the bot joins every lecture in your timetable, leaves when it ends, then waits for the next one. Repeats forever.

## How it works

```
master.sh  →  checks today's day  →  monday.sh / tuesday.sh / ...
day.sh     →  waits for the next class time  →  runs that subject's .py
subject.py →  logs into Teams, opens the team, clicks Join, waits, hangs up
           →  back to master.sh for the next class
```

| File | Job |
|---|---|
| `master.sh` | Picks the right day script |
| `monday.sh` … `friday.sh` | Your timetable: class times + which `.py` to run |
| `physicsTHE.py`, `mathLAB.py`, … | One per subject. Opens that subject's team and joins the meeting |

## Requirements

- Google Chrome
- Python 3 + pip
- Bash with GNU `date`: **Linux** or **Git Bash on Windows** (macOS `date` won't work)

## Setup (step by step)

**1. Clone the repo**
```bash
git clone https://github.com/angeryrohan/Attendance-Automating-Bot.git
cd Attendance-Automating-Bot
```

**2. Install the dependencies**
```bash
pip install "selenium<4" webdriver-manager
```
> The code uses the Selenium 3 API, so `selenium<4` is required.

**3. Add your login to every `.py` file**
```python
emailBox.send_keys('MY EMAIL')   # ← your college email
passBox.send_keys('MY PASS')     # ← your password
```

**4. Point each `.py` file to its team**

Every `.py` file clicks one team card by its position:
```python
driver.find_elements_by_class_name('team-card')[2].click()
```
Count your cards in Teams **left → right, top → bottom, starting at 0** (see `ORDER.jpg`).
Example: if Physics is the 6th card, use `[5]` in `physicsTHE.py`.

**5. Set how long each class lasts** (in seconds)
```python
time.sleep(3300)   # 55 min, then the bot hangs up
```

**6. Write your timetable in `monday.sh` … `friday.sh`**
```bash
classOne=$(date -d "08:00" +%s)   # class time (24h)
...
python pythonLAB.py               # file to run at that time
```
Change the times, the `.py` names and the `echo` labels to match your week.

**7. Make the scripts executable**
```bash
chmod +x *.sh
```

## Run it

```bash
./master.sh
```
Leave the terminal open and your PC awake (turn off sleep mode). That's it.

**Test one subject first:**
```bash
python physicsTHE.py
```
Chrome should open, log in, open the team and join the call.

## Adding a new subject

1. Copy any `.py` file → `chemistryTHE.py`
2. Change the team-card number (step 4) and the class length (step 5)
3. Call it from the right day script

## Good to know

- Classes must be **meetings started inside the team's channel**, because the bot clicks the channel's **Join** button.
- Accounts with **2-step verification / MFA** won't log in automatically.
- Saturday and Sunday run `friday.sh`.
- If Teams changes its layout, the XPaths in the `.py` files may need updating.
- Your password is stored as plain text, so **don't commit it** to a public repo.
