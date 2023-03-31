Parallels icon startup parameters:

```
target: %ProgramFiles%\Google\Chrome\Application\chrome.exe
start in: %ProgramFiles%\Google\Chrome\Application
parameters: --user-data-dir="%appdata%\Google\Chrome\User Data" --disk-cache-dir="%localappdata%\google\chrome\user data" "https://ash-rcm-web.openvista.net:2747"
```


make sure RoamingProfileSupportEnabled REG_DWORD is enabled in HKLM\software\policies\google\chrome in all RD nodes in the cluster
