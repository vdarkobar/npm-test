<p align="left">
  <a href="https://github.com/vdarkobar/home-cloud">Home</a>
  <br><br>
</p> 
  
# Nginx Proxy Manager
### *As a Reverse Proxy for all of your Services!*  
  
---
  
Login to <a href="https://dash.cloudflare.com/">CloudFlare</a>, add a website and point your root Domain to your WAN IP using an A record.  
```
    A | example.com | YOUR WAN IP
```
<p align="center">
  <img src="https://github.com/vdarkobar/NPM/blob/main/shared/A-record.webp">
</p>
  
Add individual *subdomains*, for all services, pointing to your root Domain (@ for the host).  
```
    CNAME | * | @ (or example.com)
```
<p align="center">
  <img src="https://github.com/vdarkobar/NPM/blob/main/shared/sub-domain.webp">
</p>
  
Add for non-WWW to WWW redirect.  
```
    CNAME | www | YOUR WAN IP
```
<p align="center">
  <img src="https://github.com/vdarkobar/NPM/blob/main/shared/www.webp">
</p>
  
#### Site settings:  

<pre>
SSL/TLS Mode - Full (strict)  

Edge Certificates:  
  Always Use HTTPS: ON  
  HTTP Strict Transport Security (HSTS): Enable (Be Cautious)  
  Minimum TLS Version: 1.2  
  Opportunistic Encryption: ON  
  TLS 1.3: ON  
  Automatic HTTPS Rewrites: ON  
  Certificate Transparency Monitoring: ON   
  
Firewall Settings:  
  Security Level: High  
  Bot Fight Mode: ON  
  Challenge Passage: 30 Minutes  
  Browser Integrity Check: ON  
</pre>
   
---  
  
#### *Decide what you will use for*:
```
Time Zone nad NPM Port Number.
```
  
### *Run this command*:
```
RED='\033[0;31m'; echo -ne "${RED}Enter directory name: "; read DIR; \
mkdir -p "$DIR"; cd "$DIR" && git clone https://github.com/vdarkobar/npm.git . && \
chmod +x setup.sh && \
./setup.sh
```
  
Visit your *server local ip* + *port* designated during setup:
```
http://<LocalIP>:<PORT>
```

### Create <a href="https://dash.cloudflare.com/profile/api-tokens">CloudFlare API Token</a>. 

Used for *DNS Challenge* to create *Wildcard Certificates* for your services.
```
CloudFlare > Profile > API Tokens > Edit zone DNS - Template
Create Token (edit name: *.example.com) > 
Permissions: Zone-DNS-EDIT > Zone Resources: INCLUDE-ALL ZONES > Continue to summary > Create Token
```
Copy *Token* and paste it to:
```
Nginx Proxy Manager > SSL Certificates > Add SSL Certificate > Let's Encrypt > Domain Names (enter: *.example.com example.com) 

Enable: Use a DNS Challenge > CloudFlare > Credentials File Content * (paste Token after = sign).
```
