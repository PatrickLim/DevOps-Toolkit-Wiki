Version 2.1.0p10 is here:

https://checkmk.openvista.net/msc/check_mk/agents/windows/check_mk_agent.msi

after upgrading to Version: 2.1.0p10 the Dashboard will show a WARN that says you have to REGISTER the host again with the mother ship.

to do so:

open ADMIN cmd (or powershell) on the host and run:

cmk-agent-ctl register --hostname rcm-db01e1.openvista.net --server checkmk.openvista.net:8000 --site msc --user openvista\patrick.lim

.\cmk-agent-ctl.exe register --hostname rcm-db01e1.openvista.net --server checkmk.openvista.net:443 --site msc --user openvista\patrick.lim

need to use the original automation user!

automation --password YCNQBAUNVUGMAKUCRBIF

need port 8000 available!

also, to activate a plugin copy it (such as mssql.vbs) 
from `C:\Program Files (x86)\checkmk\service\plugins` 
to `C:\ProgramData\checkmk\agent\plugins`