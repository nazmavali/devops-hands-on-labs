# Lesson 10 – Docker Compose

## 10A: What is Docker Compose?
- **What:** A tool that runs containers described in one file, docker-compose.yml
- **Why:** One command instead of long docker run commands; no forgotten flags; easy to share
- **When:** Any app with more than one container (website + database, etc.)
- **Where:** A docker-compose.yml file in the project folder
- Install on Ubuntu: `sudo apt install docker-compose-v2 -y`

## 10B: My first Compose file
- services: = the list of containers
- image: = which image | ports: "8081:80" = computer:container
- YAML uses spaces for indentation (no Tab!)
- `sudo docker compose up -d` – start everything in the background
- `sudo docker compose up -d --force-recreate` – fresh containers (after rebuilding an image)
- `sudo docker compose ps` – list Compose's containers
- `sudo docker compose down` – stop and remove them
- Compose must run in the folder that has docker-compose.yml

## Adding a picture to my website
- Copied my photo into my-website as photo.png
- Added `<img src="photo.png" style="width:100%">` to index.html
- Added `COPY photo.png ...` to the Dockerfile
- Rebuilt the image, then recreated the container
- The loop: change files → rebuild image → recreate container → check
- Kept my personal photo off GitHub with .gitignore
- Container name conflict: names must be unique → `docker rm -f <name>`


## 10C: Load balancer with 4 containers
- Rebuilt my Day 1 setup with Compose: 1 load balancer + 3 sites, one command
- `volumes: - ./site1:/usr/share/nginx/html` = show my folder inside the container (folder:container)
- `depends_on:` = start these services first
- Containers find each other BY NAME (site1, site2...) on Compose's private network (DNS!)
- Only the load balancer has `ports:` (8090). The sites are only reachable through it.
- Test: stopped site2 → visitors only got Server 1 and 3, website kept working
- `sudo docker compose stop <service>` / `start <service>` – stop or start one container
- `sudo docker compose logs <service>` – read a container's logs
