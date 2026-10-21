# Day 01 Notes – Nginx Load Balancer



# PART 1: CONCEPTS



## Nginx (web server)

- **What:** A program that sends webpages to visitors.

- **Why:** Without it, a website's files just sit there; nobody can see them.

- **When:** Any time you host a website or app. Also used as a load balancer.

- **Where:** Runs on the server. Config: `/etc/nginx/`. Webpages: `/var/www/`.



## Port

- **What:** A "door number" on a server (80 = websites, 22 = SSH).

- **Why:** One server runs many services; ports keep them separate.

- **When:** Every time you set up or connect to a service.

- **Where:** Set in the config file, e.g. `listen 80;` in Nginx.



## Load balancer

- **What:** Sends each visitor to one of several servers (like a restaurant host).

- **Why:** Shares the work, and if one server dies the site stays up.

- **When:** Any website with more than one server.

- **Where:** In my lab: `/etc/nginx/conf.d/loadbalancer.conf` (the `upstream` block).



## Logs

- **What:** A server's diary of every visit and error.

- **Why:** First place to look when something is wrong, or seems fine but isn't.

- **When:** Whenever something breaks, and regularly to catch hidden problems.

- **Where:** `/var/log/`. For Nginx: `/var/log/nginx/error.log` and `access.log`.

- **How to read:** When? How bad? What happened? Where?



## Idempotency

- **What:** Running a command twice gives the same result and breaks nothing.

- **Why:** Automation tools rerun commands constantly; they must be safe.

- **When:** Writing scripts, using Ansible/Terraform later.

- **Where:** Saw it with `apt install nginx` when it was already installed.



# PART 2: COMMANDS



## whoami / pwd

- **What:** Show my username / show my current folder.

- **Why:** Avoid running commands as the wrong user or in the wrong place.

- **When:** First thing after logging into any server.

- **Where:** Any Linux terminal.



## sudo

- **What:** Run a command as the admin.

- **Why:** System files and services are protected from normal users.

- **When:** Installing software, editing `/etc/` files, controlling services.

- **Where:** Any Linux terminal. Use carefully.



## apt update / apt install

- **What:** Refresh the software list / install software.

- **Why:** Servers need software installed and kept up to date.

- **When:** Setting up a new server, or applying security fixes.

- **Where:** Ubuntu/Debian. (CentOS uses `dnf` instead.)



## systemctl status / reload

- **What:** Check a service / apply new config without dropping visitors.

- **Why:** Installed doesn't mean running. Reload avoids downtime.

- **When:** After installing, after config changes, when something's down.

- **Where:** Any modern Linux server.



## nginx -t

- **What:** Test Nginx config for mistakes.

- **Why:** A broken config can take the whole website down.

- **When:** ALWAYS before reloading: `sudo nginx -t && sudo systemctl reload nginx`

- **Where:** On the server running Nginx.



## curl

- **What:** Fetch a webpage from the terminal.

- **Why:** Servers have no browser; quick way to test if a site responds.

- **When:** After deploying, while troubleshooting, in health-check scripts.

- **Where:** Any terminal. `curl localhost` = this machine.



## tail -n 5

- **What:** Show the last 5 lines of a file.

- **Why:** Newest log entries are at the bottom.

- **When:** Checking recent errors.

- **Where:** Mostly on files in `/var/log/`.



## grep -rl "text" /folder

- **What:** Find which files contain some text.

- **Why:** Configs can be spread across many files.

- **When:** "Where is this setting coming from?"

- **Where:** Found my load balancer in `/etc/nginx/conf.d/`.



## for loop

- **What:** Repeat a command: `for i in 1 2 3; do curl localhost; done`

- **Why:** Let the computer do repetitive work. The start of automation.

- **When:** Testing many times, checking many servers.

- **Where:** Any Bash terminal or script.



## ; vs &&

- **What:** `;` = run next no matter what. `&&` = run next only if this worked.

- **Why:** `&&` stops you from continuing after a failure.

- **When:** Chaining commands, especially test-then-apply.

- **Where:** Any Bash terminal or script.



# PART 3: ERRORS I HIT



| Error | Why it happened | Fix |
|---|---|---|
| `Is a directory` | Ran `cat` on a folder | Add the file name |
| `Could not resolve host` | Typed `local host` with a space | `localhost` |
| `unexpected token 'sudo'` | Two commands on one line | Use `;` or `&&` |
| `'status': command not found` | Typo | `systemctl` |
| `Connection refused` | Port 8083 had no server | Built Server 3 |


# PART 4: THE BUG I FIXED

- **What:** Load balancer listed 3 servers, but only 2 existed.

- **Why hidden:** Nginx silently retried other servers, so the site "worked."

- **When found:** Error log showed it going back 9 days.

- **Where:** `/etc/nginx/conf.d/loadbalancer.conf` and `/var/log/nginx/error.log`

- **Fix:** Added Server 3 → `nginx -t` → reload → confirmed no new errors.



