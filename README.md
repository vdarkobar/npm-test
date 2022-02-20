# Nginx Proxy Manager
#### Expose your services easily and securely
---
  
Login to <a href="https://dash.cloudflare.com/">CloudFlare</a> add a website and point your root Domain to your WAN IP using an A record.  
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
SSL/TLS Mode - Full  

Edge Certificates:  
  Always Use HTTPS: ON  
  HTTP Strict Transport Security (HSTS): Enable (Be Cautious)  
  Minimum TLS Version: 1.2  
  Opportunistic Encryption: ON  
  TLS 1.3: ON  
  Automatic HTTPS Rewrites: ON  
  Certificate Transparency Monitoring: ON  
  HSTS: ON  
  
Firewall Settings:  
  Security Level: High  
  Bot Fight Mode: ON  
  Challenge Passage: 30 Minutes  
  Browser Integrity Check: ON  
</pre>
  
---

<p align="center">
  <b> Wait for DNS entries to propagate. Optionally, edit CloudFlare Firewall rules. </b><br>
  <b> In order to see if Let’s Encrypt is working pause CloudFlare on selected website before running docker-compose. </b><br>
  <b><i> (Overview > Advanced Actions > Pause Cloudflare on Site) </i></b><br>
</p>

---  
  
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

Enable: Use a DNS Challenge > CloudFlare > Credentials File Content * (paste Token after = sign
```
  
---  

<p align="center">
>> Enable port forwarding (80, 443) from your Router/Firewall to your Traefik instance (VM). <<
</p>

---  
  
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
  
### *Additional Services*:
<p align="left">
  <a href="https://github.com/vdarkobar/Vaultwarden">Vaultwarden</a> |  
  <a href="https://github.com/vdarkobar/NC">NextCloud</a> |  
  <a href="https://github.com/vdarkobar/WP">WordPress</a> |  
  <a href="https://github.com/vdarkobar/npm/blob/main/shared/404.md">404 page</a> |   
  <br><br>
</p>  
