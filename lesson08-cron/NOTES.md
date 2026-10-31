# Lesson 08 – Cron

## 8A: What is cron?
- **What:** Linux's built-in scheduler. Runs commands automatically at set times ⏰
- **Why:** Repeated tasks happen without a person remembering to do them.
- **When:** Health checks, nightly backups, weekly log cleanup.
- **Where:** Every Linux server. Each user has a schedule list called a crontab.
- Cron = the scheduler. A cron job = one scheduled task.

## 8B: Reading a schedule
- Format: `minute hour day-of-month month day-of-week command`
- `*` = every, `*/5` = every 5
- `* * * * *` every minute | `*/5 * * * *` every 5 min | `0 2 * * *` daily 2 AM
- `0 0 * * 0` every Sunday at midnight
- crontab.guru translates schedules into plain English

## 8C: Automatic website monitoring
- `crontab -e` – edit my cron jobs | `crontab -l` – list them
- Use FULL paths in cron (cron doesn't know my current folder)
- `$(date '+%Y-%m-%d %H:%M')` – put the current time into a message
- `>> ~/check.log` – save every result, building a history
- Tested an outage: DOWN 17:20 → UP 17:24 UTC (~4 minutes)
- Changed to every 5 minutes so the log doesn't grow too fast.
