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

5. 