# Support Client Guide Report
---

- Article ID: 198
- Posted - Apr 25, 2017 at 6:00 AM
- Online URL: [http://stlvmonlinehelp/KB/article.php?id=198](http://stlvmonlinehelp/KB/article.php?id=198)


## Application Summary

* * *
The Support Client Guide is a report that contains a summary of most information you might need for a particular client.  Most data used for the report is stored on the srvsql\sql2012 server in the SUPPORT database.  There are other reports that display the same information, sometimes in a more specific or easier to read fashion.  The purpose of the Support Client Guide Report is to pull all of this information into one location.The report was designed to be easily updated through a SQL Stored procedure rather than require a need to updated the .rdl anytime a new item is needed for the report.  This guide will provide information on how the report is put together.

## Technical Guide
---

### RPT\_GET\_CLIENT\_INFO Stored Procedure

This stored procedure is the main data gathering stored procedure for the report.  It receives the client&#39;s full name and will get the client code from the CLIENT\_MSTR table.It starts by creating a temporary table to store all the data to be shown on the report.

This temp table holds the following fields:

- **ENVIRONMENT\_CD** - Indicates if production or test
- **PRODUCT\_AREA** - Used to indicated which product area the note is going to be for.  Effectively used for one of the expandable headers. **CATEGORY** - The next expandable header.
- **HEADER\_ONE, HEADER\_TWO, HEADER\_THREE** - The headers under Category
- **FIELD\_ONE, FIELD\_TWO, FIELD\_THREE** - The fields under the above headers
- **SUB\_CATEGORY** - The next expandable header.
- **SUB\_HEADER\_ONE, SUB\_HEADER\_TWO, SUB\_HEADER\_THREE** - The headers under the SUB\_CATEGORY **SUB\_FIELD\_ONE, SUB\_FIELD\_TWO, **SUB\_FIELD\_THREE** - The fields under the SUB\_HEADER&#39;s

Looking at the report you can see how each of these fields are used.   ![](http://stkl-onlinehelp/KB/assets/img_58ffc4ad7022a.png)

As mentioned above this allows the report to be customized just by using this SQL Stored Procedure and not requiring an RDL update. For example, say we want to add a new category called &quot;Client Test&quot; that contains two categories, &quot;Test 1&quot; and &quot;Test 2&quot;. In these categories we want three headers, &quot;Header One&quot;, &quot;Header Two&quot;, and &quot;Header Three&quot;.

To do this an update needs to be made to this stored procedure adding these lines into the temporary table #ClientInfo.  For this example we only want to add these for the Ashley Treatment Center client.insert into #ClientInfo

```SQL
 select &#39;ICSP&#39;, &#39;Client Test&#39;, --Environment Code, Product Area
 &#39;Test 1&#39;, --Category
 &#39;Header One&#39;,&#39;Header Two&#39;,&#39;Header Three&#39;, --Headers
 &#39;Item 1&#39;,&#39;Item 2&#39;, &#39;Item 3&#39;, --Fields
 null, -- Sub Category
 null,null,null, --Sub Headers
 null,null,null --Sub Fields
 where @client\_cd = &#39;AAT&#39;

 insert into #ClientInfo
 select &#39;ICSP&#39;, &#39;Client Test&#39;, --Environment Code, Product Area
 &#39;Test 2&#39;, --Category
 &#39;Header One&#39;,&#39;Header Two&#39;,&#39;Header Three&#39;, --Headers
 &#39;Item 4&#39;,&#39;Item 5&#39;, &#39;Item 3&#39;, --Fields
 null, -- Sub Category
 null,null,null, --Sub Headers
 null,null,null --Sub Fields
 where @client\_cd = &#39;AAT&#39;
```

Once the stored procedure update is complete we can immediately see the updates made to the Client Guide Report.

## Related Stored Procedures/Tables

---

### Stored Procedures

- RPT\_GET\_CLIENT\_HEADER\_INFO - ** Populates the header of the client guide report.  Takes the client&#39;s full name as a parameter.
- RPT\_GET\_CLIENT\_INFO**  - Populates the body of the client guide report.  Takes the client&#39;s full name as a parameter.


### Tables

- **CLIENT\_FILE\_LOCATIONS**  - Contains where the client&#39;s files are stored
- **CLIENT\_CONTROL\_WORKSTATIONS**  - Contains list of workstations, including IP Addresses
- **CLIENT\_WORKSTATION\_DETAILS**  - Contains details of the client workstations
- **CLIENT\_SERVICES**  - Contains interfaces, nightly processes, background services, and scheduled tasks at client sites
- **CLIENT\_REPORTS**  - Contains list of custom reports supported by Stockell at client sites
- **CLIENT\_HOT\_FIXES**  - Contains active hot fixes based on client version
- **CLIENT\_VERSION\_HISTORY**  - Contains the history of the client&#39;s versions
- **CLIENT\_CONTACTS**  - Contains list of client contacts, phones, and emails.  Also indicates if a client contact is required on all email chains.
- **CLIENT\_JOBS**  - Contains a list of custom client jobs at a client site.
