Since leadtools does not natively support https, we establish an nginx service listening on https port 19599 and proxies it to http://localhost:19600 (the default http port of leadtools).

Pre-requisites
- leadtools installation
- crt file and key file -- separate certificate files that nginx references

1. Install nginx

```
sudo dnf install nginx
```

2. Enable and start nginx


```
sudo systemctl enable nginx
sudo systemctl start nginx
```


3. Adjust firewall rules


```
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --list-all
sudo firewall-cmd --reload
sudo systemctl stop firewalld
sudo systemctl start firewalld
```


4. Verify nginx is running


```
sudo systemctl status nginx
curl http://localhost
```


5. Place the crt file and the key file in appropriate folders

recommend put crt file in **/etc/pki/nginx/**
recommend put key file in **/etc/pki/nginx/private/**

6. Add modular config file (this is **the whole point** -- telling nginx to proxy https 19599 to http://localhost:19600)

place file in /etc/nginx/conf.d/

file contents:


```
server {
    listen 19599 ssl;
    server_name _;
    ssl_certificate     /etc/pki/nginx/server.crt;
    ssl_certificate_key /etc/pki/nginx/private/server.key;
    location / {
        proxy_pass http://localhost:19600;
    }
}
```


7. Edit standard config with client_max_body_size 100m

In the http portion of the standard config file (**/etc/nginx/nginx.conf**) add the line "client_max_body_size 100m;" so it looks like this:

    
```
sendfile            on;
tcp_nopush          on;
tcp_nodelay         on;
keepalive_timeout   65;
types_hash_max_size 2048;
client_max_body_size 100m;
```


8. Restart nginx


```
sudo systemctl start nginx
sudo systemctl status nginx
```


9. If nginx is unable to start due to binding permissions, you may have to configure SELinux

Restarting nginx with the modular config may result in this error (as shown by the "sudo systemctl status nginx" statement):

```
bind() to 0.0.0.0:19599 failed (13: Permission denied)
```

If so, find the list of ports that SELinux allows to bind to http with this command:

```
sudo semanage port -l | grep http_port_t
```

If 19599 is not listed, add it with this command:

```
sudo semanage port -a -t http_port_t  -p tcp 19599
```

Also make sure that you flip this SE boolean variable to true:

```
setsebool -P httpd_can_network_connect 1
```

For additional troubleshooting, you may want to see the last few lines of the nginx error log:

```
sudo tail -30 /var/log/nginx/error.log
```
