![image.png](/.attachments/image-5587dd74-9496-4571-bb64-1f5f99a68ee2.png)

Note that this is from the ApplicationHost.config instead of the Web.config!

Better yet, update the Web.config so it has the <windowsAuthentication useAppPoolCredentials="true" /> tag in it:

![image.png](/.attachments/image-28b1f48d-83b1-4277-8731-9f3a96e0ae61.png)

In the first screenshot, you can see the settings for Web.config instead of ApplicationHost.config but you may need to Unlock Section first -- look at the Action pane on the right of the screenshot.

With some IIS configurations the Maintenance Sites (both Backend and Frontend) also need the App Pool Credentials **explicitly** set. Their web.configs should look something like:


```
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.web>
		<identity impersonate="false" />
		<authentication mode="Windows"></authentication>
    </system.web>
    <system.webServer>
        <security>
            <authentication>
                <windowsAuthentication useAppPoolCredentials="true" />
            </authentication>
        </security>
    </system.webServer>
</configuration>
```

Note that only the web.config for Maint Frontend is shown; copy the security tag into the Maint Backend web.config.