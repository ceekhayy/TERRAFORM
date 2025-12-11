# **Terraform is an Infrastructure as Code (IaC) tool that lets you create cloud resources (VPCs, subnets, EC2, load balancers, etc.) using simple configuration files instead of clicking around in the AWS console.**

This repository houses all my Terraform projects


**Installing terraform for windows**


 **1. Download Terraform**
- Go to the Terraform official download page:
  https://developer.hashicorp.com/terraform/downloads
- Under Windows (AMD64), download the .zip file.

 **2. Extract the ZIP file**
- Right-click → Extract All
- Inside the folder you’ll see terraform.exe

**3. Move terraform.exe to a permanent location**
- Move it to:
  C:\Program Files\Terraform\

**4. Add Terraform to PATH**
- Press Windows Key
- Search Environment Variables
- Click “Edit the system environment variables”
- Click Environment Variables
- Under System variables, select Path
- Click Edit
- Click New
- Paste the folder:
- C:\Program Files\Terraform\
- Click OK until all windows close.

5. Verify Installation
- Open Git Bash or PowerShell:
- Type in "terraform -version"
- You should see the version printed.
