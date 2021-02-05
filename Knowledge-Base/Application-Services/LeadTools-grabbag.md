installing ssl cert:

https://www.leadtools.com/blog/document-imaging/enable-https-web-scanning-host-demo/

CORS is enabled via the CorsFilter class in CorsFilter.java. The class is marked with the @Provider and
@PreMatching annotations to designate that it is used as a filter before the URL is matched to a path and method.
Changing the values in this method (programmatically or manually) will allow fine-grained control over CORS. By default,
all origins are allowed via allowedOrigins.add("*");

https://www.leadtools.com/support/forum/posts/t12154-