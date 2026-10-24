# Lesson 01 – Linux Basics

## 1A: Linux and the terminal
- **Linux:** an operating system, like Windows.
- **Why DevOps needs it:** DevOps engineers look after servers, and most servers run Linux.
- **Terminal:** a window where I type instructions, and the computer replies.

## 1B: Moving around
- `pwd` – where am I? (map)
- `ls` – what's here? (eyes)
- `cd folder` – go into a folder (legs)
- `cd ..` – go back out one folder
- `cd ~` – go home, from anywhere
- `~` means my home folder: `/home/nazma`

## 1C: Files
- `mkdir name` – make a folder
- `touch name` – make an empty file
- `cat file` – read a file
- `echo "text" > file` – REPLACE everything in the file
- `echo "text" >> file` – ADD to the end of the file
- Careful: `>` erases old text. When in doubt, use `>>`.


## 1D: Installing software
- `apt` – Ubuntu's app store, used by typing
- `sudo` – "do this as the admin" (the manager's key)
- Why sudo: installing changes the whole computer, so only the admin can do it
- `sudo apt install <name> -y` – install a program (`-y` = yes, go ahead)
- Installed today: `tree` (draws folders) and `htop` (like Task Manager)
- Error "Unable to locate package" = no program with that name exists
- Use sudo only when needed. The admin can break things.


## 1E: Web server (Nginx)
- **What:** A program that hands webpages to people who ask for it.
- **Why:** Without it, a website is just a file nobody else can see.
- **When:** Whenever a company wants a website or app online.
- **Where:** On a server. Webpages live on the "shelf": `/var/www/html`
- Story: Firefox (customer) asks → Nginx (clerk) hands over the page.
- `sudo apt install nginx -y` – install the web server
- `http://localhost` – visit my own website ("this computer")
- `echo "<h1>Hi</h1>" | sudo tee /var/www/html/index.html` – put my own page on the shelf
