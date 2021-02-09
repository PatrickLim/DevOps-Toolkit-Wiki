installing ssl cert:

https://www.leadtools.com/blog/document-imaging/enable-https-web-scanning-host-demo/

CORS is enabled via the CorsFilter class in CorsFilter.java. The class is marked with the @Provider and
@PreMatching annotations to designate that it is used as a filter before the URL is matched to a path and method.
Changing the values in this method (programmatically or manually) will allow fine-grained control over CORS. By default,
all origins are allowed via allowedOrigins.add("*");

https://www.leadtools.com/support/forum/posts/t12154-

From Matt:


    all an on-prem customer needs to do is symlink or copy their cert and key to /etc/nginx/leadtools.pem and /etc/nginx/leadtools.key and restart nginx

    in AWS we use ELB TLS listeners and ACM certs

    completely different paradigm
​
    oh, and modify the server name in /etc/nginx/conf.d/leadtools_ssl.conf

Turns out that the CORS error thrown by the RCM Cloud webapp was not a leadtools issue but rather an NGINX issue.

In the /etc/nginx/nginx.conf file set the max allowable file size:

http {
    ...
    client_max_body_size 100M;
}

https://www.tecmint.com/limit-file-upload-size-in-nginx/
