<P style="margin:0in;font-family:&quot;Calibri Light&quot;;font-size:20.0pt">AAT: SPNs
&amp; SQL Instances</P>

<P style="margin:0in;font-family:Calibri;font-size:10.0pt;color:#767676">Wednesday,
January 8, 2020</P>

<P style="margin:0in;font-family:Calibri;font-size:10.0pt;color:#767676">5:54
PM</P>

<P style="margin:0in">&nbsp;</P>

<P style="margin:0in"><SPAN style="font-family:SFMono-Regular;font-size:10.5pt;color:#D0D0FF;background:#FAFAFA">SELECT</SPAN><SPAN style="font-family:Calibri;font-size:11.0pt"> auth_scheme </SPAN><SPAN style="font-family:SFMono-Regular;font-size:10.5pt;color:#D0D0FF;background:#FAFAFA">FROM</SPAN><SPAN style="font-family:Calibri;font-size:11.0pt"> sys.dm_exec_connections </SPAN><SPAN style="font-family:SFMono-Regular;font-size:10.5pt;color:#D0D0FF;background:
#FAFAFA">WHERE</SPAN><SPAN style="font-family:Calibri;font-size:11.0pt">
session_id = @@spid ; </SPAN></P>

<P style="margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</P>

<P><CITE style="margin:0in;font-family:Calibri;font-size:9.0pt;color:#595959">From
&lt;<A 
href="https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/register-a-service-principal-name-for-kerberos-connections?redirectedfrom=MSDN&amp;view=sql-server-ver15">https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/register-a-service-principal-name-for-kerberos-connections?redirectedfrom=MSDN&amp;view=sql-server-ver15</A>&gt;
</CITE></P>

<P style="margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</P>

<P style="margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</P>

<P style="margin:0in;font-family:Calibri;font-size:11.0pt"><A 
href="https://docs.microsoft.com/en-us/archive/blogs/tysonpaul/install-standalone-ca-certificate-authority-on-windows-server-2012-r2-for-use-with-operations-manager">https://docs.microsoft.com/en-us/archive/blogs/tysonpaul/install-standalone-ca-certificate-authority-on-windows-server-2012-r2-for-use-with-operations-manager</A></P>

<P style="margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</P>