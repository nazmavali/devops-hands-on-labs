# Lesson 05 – Users

## 5A: What are users?
- **What:** An account on the computer: name, password, home folder.
- **Why:** To keep people (and programs) separate and safe.
- **When:** A new teammate joins, or a program needs its own account.
- **Where:** Every Linux computer. Homes live in `/home/`.
- Like an apartment building: each user has their own apartment and key 🏠🔑
- `root` = the building manager, can do anything 🧑‍💼
- `sudo` = borrowing the manager's master key for one command

## 5B: Seeing users
- `whoami` – my username
- `id` – my ID card: user number + groups (teams) 🪪
- `ls /home` – all the users' homes 🏢
- I'm in the `sudo` group (27), so I can use sudo.

## 5C: Creating a user
- `sudo adduser <name>` – create a new user
- `su - <name>` – switch to that user (prompt changes)
- `exit` – go back to my own user
- New users are NOT in the sudo group → "I can't do that" 🚫
- Least privilege: give each person only the access they need.
- `sudo deluser --remove-home <name>` – remove a user and their home
