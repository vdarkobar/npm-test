<p align="left">
  <a href="https://github.com/vdarkobar/npm#nginx-proxy-manager">Home</a>
  <br><br>
</p> 
  
### Create <a href="https://dash.cloudflare.com/profile/api-tokens">CloudFlare API Token</a>. 

Used for *DNS Challenge* to create *Wildcard Certificates* for your services.
```
CloudFlare > Profile > API Tokens > Edit zone DNS - Template
Create Token (edit name: *.example.com) > 
Permissions: Zone-DNS-EDIT > Zone Resources: INCLUDE-ALL ZONES > Continue to summary > Create Token
```
Copy Token and paste to:
```
Nginx Proxy Manager > SSL Certificates > Add SL Certificate > Let's Encrypt > Domain Names: *.example.com example.com
```
