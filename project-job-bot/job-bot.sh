#!/bin/bash
# DevOps Job-Alert Bot: Remotive + Jobicy (remote jobs, USA)

cd /home/nazma/devops-hands-on-labs/project-job-bot
touch seen.txt

if [ -n "$1" ]
then
  # TEST MODE: use the test file you give it
  jq -r '.jobs[] | select(.title | test("devops|sre|site reliability|cloud|platform|infrastructure"; "i")) | "\(.url) \(.title) at \(.company_name)"' "$1" > all.txt
else
  # LIVE MODE: download from both job sites
  curl -s "https://remotive.com/api/remote-jobs" > remotive.json
  curl -s "https://jobicy.com/api/v2/remote-jobs?count=50&tag=devops&geo=usa" > jobicy.json

  # Put all DevOps jobs into one list: link, title, company, source
  jq -r '.jobs[] | select(.title | test("devops|sre|site reliability|cloud|platform|infrastructure"; "i")) | "\(.url) \(.title) at \(.company_name) (Remotive)"' remotive.json > all.txt
  jq -r '.jobs[] | "\(.url) \(.jobTitle) at \(.companyName) (Jobicy)"' jobicy.json >> all.txt
fi

# Show only jobs whose link is NOT in seen.txt yet
while read -r url rest
do
  if ! grep -q "$url" seen.txt
  then
    echo "$(date '+%Y-%m-%d %H:%M') NEW JOB: $rest"
    echo "    $url"
    echo "$url" >> seen.txt
  fi
done < all.txt
