# Error Message Summary (draft)

### issue is related to the `scorecards/EventActivity` references in the `REPORTS_REPORTING_PROPERTIES` table

```

The path of the item 'scorecards/EventActivity' is not valid. The full path must be less than 260 characters long; other restrictions apply. If the report server is in native mode, the path must start with slash. ---> Microsoft.ReportingServices.Diagnostics.Utilities.InvalidItemPathException: The path of the item 'scorecards/EventActivity' is not valid. The full path must be less than 260 characters long; other restrictions apply. If the report server is in native mode, the path must start with slash. at System.Web.Services.Protocols.SoapHttpClientProtocol.ReadResponse(SoapClientMessage message, WebResponse response, Stream responseStream, Boolean asyncCall) at System.Web.Services.Protocols.SoapHttpClientProtocol.Invoke(String methodName, Object[] parameters) at Insight.BR.Imaging.ReportingService2008.ReportingService2008.ListReportHistory(String Report) in E:\InsightCS\Release\2019.3\InsightWeb\Insight.BR\Imaging\ReportingService2008.cs:line 2737 at Insight.BR.Imaging.ReportingService2008Impl.GetReportHistory(String reportName) in E:\InsightCS\Release\2019.3\InsightWeb\Insight.BR\Imaging\ReportingService.cs:line 125 at Insight.BR.Imaging.Reporting.ReportHistoryInfo(String[] data, List`1& reportHistory) in E:\InsightCS\Release\2019.3\InsightWeb\Insight.BR\Imaging\Reporting.cs:line 123 System.Net.SystemNetworkCredential

```
### Work-around is to ....


@<C6D49B38-49FC-660D-A122-33267AE18473> SQL statement