# 🤖 DevOps Job-Alert Bot

A Bash script that automatically finds **new remote DevOps job listings** (open to the USA), remembers which ones it has already seen, and saves only the new ones to a log. It runs on a schedule with **cron**, every 6 hours, with no human needed.

## How it works

1. ⏰ **cron** runs `job-bot.sh` every 6 hours
2. 🌐 **curl** downloads job listings from two free job APIs: Remotive and Jobicy
3. 🔎 **jq** keeps only DevOps-type roles (DevOps, SRE, Cloud, Platform, Infrastructure)
4. 🧠 **grep** checks `seen.txt`, so jobs already shown are skipped
5. 📓 New jobs are written to `jobs.log` with a timestamp, title, company, source, and link

## Example output

    2026-11-02 00:00 NEW JOB: Sr. DevOps Engineer at Cyware (Jobicy)
        https://jobicy.com/jobs/157082-sr-devops-engineer

## Usage

    ./job-bot.sh                    # live mode: download real jobs
    ./job-bot.sh test-jobs.json     # test mode: use fake jobs, no API calls

## Schedule (crontab)

    0 */6 * * * /path/to/job-bot.sh >> /path/to/jobs.log 2>&1

## Tools used

Bash, curl, jq, grep, cron, Git

## What I learned

- Calling REST APIs and reading JSON with `jq`
- Testing with fake data before trusting real results
- Making scripts cron-friendly (full paths, logging errors with `2>&1`)
- Respecting API rate limits (Jobicy: at most once an hour)
- Evaluating APIs: Adzuna turned out to be paid, and The Muse blocked requests (403), so I chose sources that worked

## Data sources

Job listings come from the public APIs of [Remotive](https://remotive.com) and [Jobicy](https://jobicy.com). All links point to the original job postings. This is a personal, non-commercial learning project.
