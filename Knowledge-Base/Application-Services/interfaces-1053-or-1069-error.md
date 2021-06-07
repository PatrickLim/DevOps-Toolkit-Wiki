if you cannot start the interfaces with a service account but it starts with Local System, add the service account to the appserver's Administrator group in Computer Management.

Also check whether service account has "Log on as a Service" permission. Go to Administrative Tools, click Local Security Policy. Expand Local Policy, click User Rights Assignment.

For versions 2020 onward, you need the Visual C++ Redist 2015-2019 (x86) -- x64 by itself is insufficient.
