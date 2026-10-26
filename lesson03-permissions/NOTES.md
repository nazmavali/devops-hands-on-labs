# Lesson 03 – Permissions

## 3A: What are permissions?
- **What:** Rules on every file: who can read, write, or run it.
- **Why:** To protect files. Not everyone should change or run everything.
- **When:** Making scripts runnable, protecting secrets, fixing "Permission denied".
- **Where:** Every file and folder on Linux.
- `r` = read 👀, `w` = write ✏️, `x` = execute (run) 🏃
- Like a school: students read the notice board, teachers can write on it.

## 3B: Reading permissions
- `ls -l` – list files with details
- Look for `x`: if it's there, the file can run.
- Scripts need `x`. Notes and normal files don't.
- `x` comes from `chmod +x`, not from the name `.sh`.

## 3C: Changing permissions
- `chmod +x file` – GIVE permission to run ➕
- `chmod -x file` – TAKE AWAY permission to run ➖
- No `x` → "Permission denied" when running it
- Fix "Permission denied" on a script: `chmod +x <file>`
