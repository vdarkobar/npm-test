# npm
Nginx Proxy Manager
  
    
### Clone Traefik Git Repository:
```
RED='\033[0;31m'; echo -ne "${RED}Enter directory name: "; read DIR; \
mkdir -p "$DIR"; cd "$DIR" && git clone https://github.com/vdarkobar/npm.git .
```
  
#### Run:
```
chmod +x setup.sh && \
./setup.sh
```
  
### Start Traefik:
```
sudo docker-compose up -d
```
```
sudo docker-compose down                       # Stops containers and removes containers.
sudo docker-compose up -d --build              # Build images before creating containers.
sudo docker-compose up -d --force-recreate     # Recreate containers even if their configuration and image haven't changed.
sudo docker-compose pull                       # Pulls an image associated with a service defined in a docker-compose.yml
```
  
