# LinuxGSM Terraform for LinuxGSM

## Introduction
This folder contains the information required to quickly spin up a development or production game server using LinuxGSM. 

This script will: 
* Use a file-based Linode APIv4 key to authenticate against Linode
* Automatically generate a secure ED25519 private/public key for authentication to the terraformed server
* Can be defined for any valid game server under any repository or branch
* Will automatically start the server once the provisioning is complete

## What is Terraform and why use it?
 Terraform does what the name suggests, it will build and transform an environment to support life, in this case, LinuxGSM. 
 
 This project is aimed at LinuxGSM developers wanting to quickly spin up their game server from their own repository with minimal effort of provisioning their own server. 
 
## Requirements
* A Linode Account ([free trail accepted](https://linuxgsm.com/lgsm-linode))
* [Terraform Installation](https://learn.hashicorp.com/terraform/getting-started/install)

##Usage Instructions

**Please be aware that this will use your Free Trial Allowance or will cost you money! Please check with Linode if you are unsure what this means before continuing!**

1. [Download Terraform](https://learn.hashicorp.com/terraform/getting-started/install) and link to the Path variable
2. Download or clone this repository and navigate to this folder
3. Open up [cloud.linode.com](https://cloud.linode.com/profile/tokens) and create a new API Personal Access Token with Linode Write access and Images read access
4. Save the API key to `.linodeapikey`
5. Review `settings.sh` and configure the variables. 
6. Run `./setup.sh`
7. Review the Terraform prompt for what virtual machines are being created and destroyed. **It is your responsibility to ensure what the plan says is what you exect it to do!**
8. Type `yes` to accept the plan and watch the Linode environment be created! 

## Tear Down
Use the command `terraform destroy` to destroy all created images using this script. Keeping servers alive will use your free trial allocation to will cost money!