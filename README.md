# Nginx Proxy Manager
#### Expose your services easily and securely
---
  
Login to <a href="https://dash.cloudflare.com/">CloudFlare</a> and point your root Domain to your WAN IP using an A record.  
```
    A | example.com | YOUR WAN IP
```
<p align="center">
  <img src="https://github.com/vdarkobar/misc/blob/main/A-record.webp">
</p>
  
Add individual *subdomains*, for all services, pointing to your root Domain (@ for the host).  
```
    CNAME | * | @ (or example.com)
```
<p align="center">
  <img src="https://github.com/vdarkobar/misc/blob/main/sub-domain.webp">
</p>
  
Add for non-WWW to WWW redirect.  
```
    CNAME | www | YOUR WAN IP
```
<p align="center">
  <img src="https://github.com/vdarkobar/misc/blob/main/www.webp">
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
  
<p align="center">
  <b> Wait for DNS entries to propagate. Optionally, edit CloudFlare Firewall rules. </b><br>
  <b> In order to see if Let’s Encrypt is working pause CloudFlare on selected website before running docker-compose. </b><br>
  <b><i> (Overview > Advanced Actions > Pause Cloudflare on Site) </i></b><br>
</p>
  
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
  
#### *Additional setup*:
<p align="left">
  <a href="https://github.com/vdarkobar/npm/blob/main/shared/CloudFlare.md#create-cloudflare-api-token">CloudFlare</a> |  
  <a href="https://github.com/vdarkobar/Vaultwarden">Vaultwarden</a> |  
  <a href="https://github.com/vdarkobar/NC">NextCloud</a> |  
  <a href="https://github.com/vdarkobar/npm/blob/main/shared/404.md">404 page</a> |   
  <br><br>
</p>  
