# terraform
We're gonna do stuff with Terraform and probably ~~Proxmox~~ ESXI.

## Using
1. Put creds in a file called `secrets.tfvars`.
2. Add `secrets.tfvars` to your `.gitignore` file.
3. terraform apply -var-file="secret.tfvars"