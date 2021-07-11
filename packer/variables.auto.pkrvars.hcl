proxmox_host = "192.168.1.53:8006"
proxmox_node_name = "vm"
proxmox_api_user = "{{ env `PM_USER` }}"
proxmox_api_password = "{{ env `PM_PASS` }}"

template_name = "20.04-{{ isotime \"2006-01-02-T15-04-05\" }}"
template_description = "ubuntu-20.04"

ssh_fullname = "packer"
ssh_username = "packer"
ssh_password = "packer"

hostname = "ubuntu-cloudinit"
vmid = "VM 9000"
locale = "en_US"
cores = 1
sockets = 1
memory = 2048
disk_size = "10G"
datastore = "local"
datastore_type = "directory"

iso = "vm:isos/focal-server-cloudimg-amd64.img"
