# Lesson 06 – Networking Basics

## 6A: IP address
- **What:** A number address for a computer on a network (the building 🏢).
- **Why:** So computers know where to find and talk to each other.
- **When:** Every connection: websites, SSH, everything.
- **Where:** Every device on a network has one.
- `hostname -I` – show my IP addresses
- `127.0.0.1` / `::1` / `localhost` = "this computer, myself"
- I opened my VM's website from Windows: `http://192.168.56.101`

## 6B: Ports
- **What:** A numbered door on a computer (the door 🚪).
- **Why:** One computer runs many services; each gets its own door.
- 80 = website, 22 = SSH, 443 = secure website (https)
- Door 8080 with nobody there → "refused to connect"
- Full address = IP + port, e.g. `192.168.56.101:80`

## 6C: DNS
- **What:** Turns names (youtube.com) into IP numbers. The internet's contacts list 📇
- **Why:** Humans remember names, computers need numbers.
- `getent hosts <name>` – look up a name's IP address
- Big sites (amazon.com) have many IPs = many servers sharing visitors.

## 6D: Ping
- **What:** Sends "are you there?" and waits for a reply 🏓
- **Why:** First check when something seems broken.
- `ping -c 4 <name or IP>` – send 4 pings (Ctrl + C stops endless ping)
- `0% packet loss` = computer is reachable
- "Name or service not known" = DNS couldn't find the name
- Ping works but website doesn't → check the service/door, not the network.
