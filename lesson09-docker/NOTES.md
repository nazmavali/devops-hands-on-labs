# Lesson 09 – Docker

## 9A: What is Docker?
- **What:** A tool that makes and runs software containers.
- **Why:** An app works on one computer but breaks on another ("it works on my machine")
  because the other computer is missing programs, versions, or settings.
- **Container:** the app + everything it needs, packed together, so it runs the same everywhere.
- **When:** Most modern companies ship their apps in containers.
- **Where:** Any Linux computer with Docker installed.
- Image = the packed app, saved, not running (game disc / book on the shelf)
- Container = the image running right now (playing the game / reading the book)
- One image can run as many containers.

## 9B: First container
- `sudo apt install docker.io -y` – install Docker on Ubuntu
- `sudo docker run hello-world` – download and run a test app
- "Unable to find image locally" = not on my computer yet
- Pull = download an image from Docker Hub (the online store of images)
- Digest (sha256) = the image's fingerprint, proves it downloaded correctly
- Docker client = the `docker` command I type (the remote)
- Docker daemon = the Docker service in the background that does the work (the TV)

## 9C: Nginx in a container
- `sudo docker run -d -p 8080:80 --name my-nginx nginx` – run Nginx in a container
  - `-d` = run in the background
  - `-p 8080:80` = computer door 8080 → container door 80 (format: computer:container)
  - `--name my-nginx` = give the container a name
  - `nginx` = the image from Docker Hub
- Used 8080 because Nginx on the computer already uses door 80 (two programs can't share one door)
- `sudo docker ps` – list running containers (ID, image, status, ports, name)
- `sudo docker stop my-nginx` / `sudo docker start my-nginx` – stop and start it
- Tested: stopped → "Could not connect", started → "Welcome to nginx!"
- In Firefox, type only the address (http://localhost:8080). `curl` is for the terminal.

## 9D: My own image
- Dockerfile = the recipe for building an image
- `FROM nginx` – start from the official Nginx image (like a cake mix)
- `COPY index.html /usr/share/nginx/html/index.html` – put my page on Nginx's shelf inside the image
- `sudo docker build -t nazma-website .` – build the image (`-t` = name, `.` = Dockerfile is in this folder)
- `sudo docker images` – list images on my computer
- `sudo docker run -d -p 8081:80 --name my-website nazma-website` – run my image
- Flow: Dockerfile → build → image → run → container → website
- Real world: an image is a packed app, not a server. It runs ON a server as a container.
