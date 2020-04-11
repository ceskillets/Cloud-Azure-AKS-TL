# Deploy AKS Cluster in Azure with Prisma Cloud Compute
This is to deploy an AKS cluster in Azure with Prisma Cloud Compute

## Prequisites:
- Valid Prisma Cloud Compute license
- Need to have Azure CLI installed in order to login to Azure via command line (az login) and create Service Principal (as per below instructions).

- You need to create a Service Principal
    - az ad sp create-for-rbac --skip-assignment --name <service-principal-name>
        - Use appId as the client_id in the terraform.tfvars file
        - Use password as the client_secret in the terraform.tfvars file

# Support Policy
The code and templates in the repo are released under an as-is, best effort, support policy. These scripts should be seen as community supported and Palo Alto Networks will contribute our expertise as and when possible. We do not provide technical support or help in using or troubleshooting the components of the project through our normal support options such as Palo Alto Networks support teams, or ASC (Authorized Support Centers) partners and backline support options. The underlying product used (the VM-Series firewall) by the scripts or templates are still supported, but the support is only for the product functionality and not for help in deploying or using the template or script itself. Unless explicitly tagged, all projects or work posted in our GitHub repository (at https://github.com/PaloAltoNetworks) or sites other than our official Downloads page on https://support.paloaltonetworks.com are provided under the best effort policy.