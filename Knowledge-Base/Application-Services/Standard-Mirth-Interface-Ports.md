Based on conversations in the Systems Admin/Interface Teams thread (extract below), the following port range should be implemented as a standard for RCM Interface Services configurations.

**Interface Port Range: 19000-19299**

```
[1:23 PM] Adam Craft
    Could be a firewall issue. What ports need to be opened up? Do you have a range for all Channels? We could start with just the ADT port
(1 liked)​[1:31 PM] Terri Kozlowski
    ADT is 9500
​[1:32 PM] Terri Kozlowski
    i am thinking to be consistent with other customers we should use the interface port number range of 19000 - 19299
​[1:34 PM] Brian Stockell
    Terri Kozlowski - If you think Jonathan needs some assistance, please let Patrick Lim and I know
​[1:35 PM] Terri Kozlowski
    will do - all he did was change the ip address for the RCM--> CV in TEST
(1 liked)​[1:35 PM] Terri Kozlowski
    the connection request is timing out
​[1:38 PM] Terri Kozlowski
    lets open the range of 19000-19299 for interfaces
​[1:39 PM] Terri Kozlowski
    Jonathan is going to change the RCM side to use 19005
​[1:42 PM] Brent Freeman
    
  ports: 80/tcp 443/tcp 3306/tcp 4848/tcp 4949/tcp 7070/tcp 7071/tcp 18080/tcp 18081/tcp 18280/tcp 18181/tcp 18248/tcp 19191/tcp 19193/tcp 19000-19299/tcp
done
```

