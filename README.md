# Nginx Proxy Manager
#### Expose your services easily and securely
---
  
### *Run this command*:
```
RED='\033[0;31m'; echo -ne "${RED}Enter directory name: "; read DIR; \
mkdir -p "$DIR"; cd "$DIR" && git clone https://github.com/vdarkobar/npm.git . && \
chmod +x setup.sh && \
./setup.sh
```
  
### Create <a href="https://dash.cloudflare.com/profile/api-tokens">CloudFlare API Token</a>. 

Used for DNS Challenge to create Wildcard Certificates.
```
Nginx Proxy Manager > SSL Certificates > Add SL Certificate > Let's Encrypt > Domain Names: *.example.com example.com
```
