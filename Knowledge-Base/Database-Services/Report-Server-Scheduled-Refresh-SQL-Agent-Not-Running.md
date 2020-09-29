<IMG  src="https://community.powerbi.com/t5/image/serverpage/image-id/115859i6C0B7473E871DCA3/image-size/medium?v=1.0&amp;px=400"  alt="1.jpg"/>

make sure that the account running the SQL Agent has SQLAgentOperatorRole on the MAIN server -- the one that has the ReportServerPBIRS and ReportServerPBIRSTempDB.

For example, in rcm-db02e1\crmc the SQL Agent is running as openvista\crmcsql and the PBI Server is running as openvista\crmcpbi. It is openvista\crmcsql (not crmcpbi) that needs to have SQLAgentOperatorRole in the main instance where the SSRS databases live.
