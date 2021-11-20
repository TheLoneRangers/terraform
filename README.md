# terraform
We're gonna do stuff with Terraform and probably ~~Proxmox~~ ESXI.
Uses the https://github.com/josenk/terraform-provider-esxi provider. Follow the instructions there and you should be good.  

## Using
1. Put creds in a file called `secrets.tfvars`.
    -   > esxi_username = [your username]
    -   > esxi_password = [your password]
2. Add `secrets.tfvars` to your `.gitignore` file.
3. `terraform fmt` (and push the changes)
4. `terraform plan -var-file="secret.tfvars"`
5. `terraform apply -var-file="secret.tfvars"`
6. `terraform destroy -var-file="secret.tfvars"`