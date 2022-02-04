# terraform
We're gonna do stuff with Terraform and probably ~~Proxmox~~ ESXI.
Uses the https://github.com/josenk/terraform-provider-esxi provider. Follow the instructions there and you should be good.  

## Using - specifically regarding the `basic_template` directory
1. Put creds in a file called `secrets.tfvars`.
    -   > esxi_username = [your username]
    -   > esxi_password = [your password]
2. Add `secrets.tfvars` to your `.gitignore` file.
3. `terraform fmt` (and push the changes)
4. `terraform plan -var-file="secret.tfvars"`
5. `terraform apply -var-file="secret.tfvars"`
6. `terraform destroy -var-file="secret.tfvars"`

## Notes
I wasn't aware at the time, but while this works, doing anything more complex or custom is difficult with the free version of Esxi due to how the API is paywalled.  This is functional, but since I can't create custom OVAs to take advantage of user-data, I'm abandoning this for now.