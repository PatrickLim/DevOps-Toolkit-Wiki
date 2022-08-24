after upgrading to Version: 2.1.0p10 the Dashboard will show a WARN that says you have to REGISTER the host again with the mother ship.

to do so:

open ADMIN cmd (or powershell) on the host and run:

cmk-agent-ctl register --hostname rcm-db01e1.openvista.net --server checkmk.openvista.net:8000 --site msc --user openvista\patrick.lim

.\cmk-agent-ctl.exe register --hostname rcm-db01e1.openvista.net --server checkmk.openvista.net:443 --site msc --user openvista\patrick.lim

need to use the original automation user!

automation --password YCNQBAUNVUGMAKUCRBIF

need port 8000 available!
