# Lesson 04 – Processes

## 4A: What is a process?
- **What:** A program that is running right now.
- **Why:** To see what's using the computer, and stop things that are stuck.
- **When:** Server is slow, a program froze, or checking something is running.
- **Where:** Every Linux computer runs many processes at once.
- Program = a book on the shelf 📕. Process = reading it right now 📖.
- PID = Process ID, a token number 🎟️ for each running process.

## 4B: Seeing processes
- `pgrep -a <name>` – find running processes by name, with their PIDs
- Nginx is a team: 1 master (manager) + workers (clerks)
- `sudo systemctl restart nginx` – stop and start again → NEW PID
- PIDs are temporary. Always look them up fresh.

## 4C: Stopping a stuck process
- `sleep 1000 &` – a harmless fake "stuck" process for practice
- `kill <PID>` – stop a process (like "End task" in Task Manager)
- After kill, `pgrep` shows nothing = it's gone
- Frozen program at work: 1) find PID with pgrep, 2) kill it
