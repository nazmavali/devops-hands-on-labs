# DevOps Hands-On Labs

My hands-on journey to becoming a DevOps Engineer.

## Day 01 – Nginx Load Balancer
- Investigated an existing Nginx setup on Ubuntu Server
- Found a load balancer sending traffic to 3 backend servers (ports 8081–8083)
- Found a hidden bug in the error log: server 8083 was missing ("Connection refused")
- Fixed it by adding Server 3, tested with `nginx -t`, reloaded, verified with curl
- Commands learned: systemctl, curl, tail, grep, nginx -t, for loops
