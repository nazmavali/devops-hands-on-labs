# Lesson 02 – Bash Scripts

## 2A: What is a script?
- **What:** A file with a list of commands, run one after another.
- **Why:** So the computer does boring, repeated work instead of me.
- **When:** Any time I do the same task more than a few times.
- **Where:** In a file on Linux, usually ending in `.sh`.
- Like a recipe: I write the steps once, the computer follows them every time.

## 2B: My first script (hello.sh)
- `#!/bin/bash` – first line of every script: "this is a Bash script"
- `echo "text"` – print a sentence
- `date` – show the date and time (in UTC, server time)
- `chmod +x hello.sh` – give the file permission to run
- `./hello.sh` – run the script in this folder (`./` = "right here")
- One command ran two steps. That's automation!


## 2C: Script that checks my website (check.sh)
- `curl localhost` – visit a website from the terminal. Firefox is for people, curl is for scripts.
- `if ... then ... else ... fi` – the script makes a decision (like "if it rains, take an umbrella")
- `curl -s` – silent, no progress messages
- `> /dev/null` – throw away the page text; I only care whether it worked
- `sudo systemctl stop nginx` – turn the website off (clerk goes home)
- `sudo systemctl start nginx` – turn it back on
- Tested both: running → "UP ✅", stopped → "DOWN ❌"
- Always test the bad case too, to prove the script really works.
