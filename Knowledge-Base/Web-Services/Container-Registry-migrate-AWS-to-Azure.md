1. install AWS CLI so you can run in Powershell https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

2. in Powershell check AWS CLI version with `aws --version`

3. in Chrome log on to Medsphere's AWS tenant via https://myapplications.microsoft.com/ and look for the AWS SSO icon

4. log on to Medsphere's AWS tenant with `aws configure sso` this will launch a Chrome tab and attempt to SSO into the current Chrome session that is already signed in via Step 3

5. 