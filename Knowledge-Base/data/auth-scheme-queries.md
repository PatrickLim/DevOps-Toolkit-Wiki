select @@SERVERNAME
SELECT * FROM sys.dm_exec_connections where auth_scheme = 'KERBEROS'

sp_dropserver 'real-server-name'
go

sp_addserver 'db01w1-chlb', LOCAL
go

SELECT auth_scheme FROM sys.dm_exec_connections WHERE session_id = @@spid
SELECT * FROM sys.dm_exec_connections

select
s.session_id,s.original_login_name,c.net_transport,c.auth_scheme,c.local_net_address,c.local_tcp_port,s.host_name,s.program_name
from sys.dm_exec_sessions s
left outer join sys.dm_exec_connections c
on s.session_id = c.session_id
where s.is_user_process = 1


```
select
s.session_id,s.original_login_name,c.net_transport,c.auth_scheme,c.local_net_address,c.local_tcp_port,s.host_name,s.program_name,s.last_request_start_time,s.last_request_end_time
from sys.dm_exec_sessions s
left outer join sys.dm_exec_connections c
on s.session_id = c.session_id
where s.is_user_process = 1
and c.auth_scheme = 'KERBEROS'
order by s.last_request_end_time desc
```


nltest /dsgetdc:openvista.net

EC2AMAZ-5PL6K14

EC2AMAZ-24STU9D.openvista.net
administrator password:
PPeZO4.TQRLeELQPL((;9t2;MSJ8)H47
10.251.3.115

mscadmin
NsbjTUEbBSxXJtI5ngqu