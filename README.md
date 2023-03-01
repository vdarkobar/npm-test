<p align="left">
  <a href="https://github.com/vdarkobar/Home-Cloud#self-hosted-cloud">Home</a>
  <br><br>
</p> 
  
# Nginx Proxy Manager
### *as a Reverse Proxy for all of your Services!*  

<p align="center">
  <img src="https://github.com/vdarkobar/Home-Cloud/blob/main/shared/reverse-proxy.png">
</p>
  
---  
<p align="center">
Enable Port forwarding (80, 443) from your Router/Firewall to your NPM instance (VM).
</p>  
---  
  
#### Decide what you will use for:
  
> *Directory name, Time Zone* and *NPM Port Number*.
  
### *Run this command*:
```
RED='\033[0;32m'; echo -ne "${GREEN}Enter directory name: "; read DIR; \
mkdir -p "$DIR"; cd "$DIR" && git clone https://github.com/vdarkobar/npm.git . && \
chmod +x setup.sh && \
./setup.sh
```
  
Visit your *server local ip* + *port number* designated during setup:  
```Bash
http://LocalIP:PortNumber  
```
  
Default Administrator User:  
```bash
Email:    admin@example.com  
Password: changeme  
```
  
### Create <a href="https://dash.cloudflare.com/profile/api-tokens">CloudFlare API Token</a>. 

Used for *DNS Challenge* to create *Wildcard Certificates* for your entire Domain (*unlimited Subdomains*).
  
> CloudFlare: Profile > API Tokens > Create Token > Edit zone DNS - Use Template  
  
> Create Token: change the name (use Domain name with the star in front: *.example.com)  
  
> Permissions: Zone > DNS > Edit
  
> Zone Resources: Include > Specific Zone > example.com
  
> Client IP Address Filtering: *skip or set up if you have fixed ip address
  
> TTL: skip or define how long this token will stay active
  
> Continue to summary > Create Token
  
### Copy *Token* and paste it to:
  
> Nginx Proxy Manager > SSL Certificates > Add SSL Certificate > Let's Encrypt > Domain Names (enter: *.example.com example.com) 

> Enable: Use a DNS Challenge > CloudFlare > Credentials File Content * (paste Token after = sign) > Save  
  
  <br><br>
---
  
### Run CrowdSec setup again, in order to detect NPM services and install available Collections:
```bash
sudo /usr/share/crowdsec/wizard.sh -c
```
  
or do it manualy:

### Nginx collection:
A collection to defend nginx against common attacks
```bash
sudo cscli collections install crowdsecurity/nginx
```
  
### Nginx Proxy Manager collection:
A collection to defend nginx against common attacks
```bash
sudo cscli collections install crowdsecurity/nginx-proxy-manager
```
  
### Parse Nginx Proxy Manager access and error logs:
```bash
sudo cscli parsers install crowdsecurity/nginx-proxy-manager-logs
```
  
## Install Nginx Bouncer:
```bash
sudo apt install nginx lua5.1 libnginx-mod-http-lua luarocks gettext-base lua-cjson
sudo apt install crowdsec-nginx-bouncer
```
  
```bash
sudo systemctl restart nginx
sudo systemctl reload crowdsec
```  
  
### Debug:
```bash
sudo tail -f /var/log/crowdsec.log
sudo cscli bouncers list
sudo cscli decisions list
cscli
```  
  
    
<a href="https://github.com/vdarkobar/NPM/blob/main/README.md#nginx-proxy-manager">top of the page</a>  
