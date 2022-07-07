## AWS Elastic Container Registry pull image onto local Docker

1. install AWS CLI so you can run in Powershell https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

2. in Powershell check AWS CLI version with `aws --version`

3. in Chrome log on to Medsphere's AWS tenant via https://myapplications.microsoft.com/ and look for the AWS SSO icon

4. log on to Medsphere's AWS tenant with `aws configure sso` this will launch a Chrome tab and attempt to SSO into the current Chrome session that is already signed in via Step 3

5. SSO start URL is https://aws-sso-medsphere.awsapps.com/start and SSO Region is us-east-1

![image.png](/.attachments/image-5ff99a74-7e0e-44ee-bb98-fd0004d245a6.png)

6. when asked for the CLI profile name, provide a username alias so that you don't have to keep retyping the very long default profile name (see above screenshot)

7. Log in to Elastic Container Registry by getting an Authentication Token this way:
`aws ecr get-login-password --region us-east-1 --profile patrick | docker login --username AWS --password-stdin 323535402866.dkr.ecr.us-east-1.amazonaws.com`

8. you can see all the images in the Elastic Container Registry this way `aws ecr describe-images --repository-name leadtools-service --profile patrick`

9. assuming you have Docker installed on your workstation, run this: `docker pull 323535402866.dkr.ecr.us-east-1.amazonaws.com/leadtools-service:leadtool_1.1.3`

10. now you can see it on your local Docker repository, but change the long name this way: `docker image tag 323535402866.dkr.ecr.us-east-1.amazonaws.com/leadtools-service:leadtool_1.1.3 leadtools-service:leadtool_1.1.3`

## Push local Docker image to Azure

1. create an Azure Container Registry via https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-portal?tabs=azure-cli

In the RCMLab the Azure Container Registry we created is called `rcmlab1.azurecr.io`

2. in Powershell do `az login` and a Chrome tab will launch for you to enter the Azure credentials to the proper tenant (in this case for RCMLab)

3. login to the Azure Container Registry this way `az acr login --name rcmlab1`

4. Before you can push an image to your registry, you must tag it with the fully qualified name of your registry login server. The login server name is in the format <registry-name>.azurecr.io (must be all lowercase).
`docker tag leadtools-service:leadtool_1.1.3 rcmlab1.azurecr.io/leadtools-service:leadtool_1.1.3`

6. `docker push rcmlab1.azurecr.io/leadtools-service:leadtool_1.1.3`

## Once the image is in the Azure Container Registry you can Deploy a container instance in Azure using the Azure portal via https://docs.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-portal