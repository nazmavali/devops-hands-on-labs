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
