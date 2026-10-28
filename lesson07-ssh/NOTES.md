# Lesson 07 – SSH

## 7A: What is SSH?
- **What:** Secure Shell, a secure remote control for another computer's terminal 🔐
- **Why:** Servers are far away with no screen. SSH lets me control them remotely.
- **When:** Almost daily in DevOps: fixing, checking, setting up, updating servers.
- **Where:** Connects to the server's IP address on port 22 🚪

## 7B: Connecting
- `ssh <user>@<IP>` – connect, e.g. `ssh nazma@192.168.56.103`
- First time: type `yes` to trust the server's fingerprint
- The prompt changes: `nazma@Ubuntu` → `nazma@ubuntu-server`
- `exit` – close the connection and go back
- My keyboard is here 💻, but the commands run there 🖥️
- File I made over SSH was on the server, not the desktop.
- Mistake I made: ran ssh while already on the server (connected to itself). Always check the prompt!

## 7C: Key login 🔑
- Public key = lock 🔒 (put on the server). Private key = key 🔑 (never share).
- `ssh-copy-id <user>@<IP>` – copy my lock to the server
- After that, ssh logs in with no password
- Keys are safer than passwords, faster, and work in scripts.
