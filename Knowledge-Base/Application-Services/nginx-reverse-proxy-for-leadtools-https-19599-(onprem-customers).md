Since leadtools does not natively support https, we establish an nginx service listening on https port 19599 and proxies it to http://localhost:19600 (the default http port of leadtools).

Pre-requisites
- leadtools installation
- crt file and key file -- separate certificate files that nginx references

1. Install nginx

`sudo dnf install nginx`

2. Enable and start nginx

sudo systemctl enable nginx
sudo systemctl start nginx

3. Adjust firewall rules

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --list-all
sudo firewall-cmd --reload
sudo systemctl stop firewalld
sudo systemctl start firewalld

4. Verify nginx is running

sudo systemctl status nginx
curl http://localhost

5. Place the crt file and the key file in appropriate folders

recommend put crt file in /etc/pki/nginx/
recommend put key file in /etc/pki/nginx/private/

6. Add modular config file (this is the whole point -- telling nginx to proxy https 19599 to http://localhost:19600)

place file in /etc/nginx/conf.d/

file contents:

server {
    listen 19599 ssl;
    server_name _;
    ssl_certificate     /etc/pki/nginx/server.crt;
    ssl_certificate_key /etc/pki/nginx/private/server.key;
    location / {
        proxy_pass http://localhost:19600;
    }
}

7. Edit standard config with client_max_body_size 100m

In the http portion of the standard config file (/etc/nginx/nginx.conf)