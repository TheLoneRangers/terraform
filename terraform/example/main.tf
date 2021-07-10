terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.7.3"
    }
  }
}

#proxmox creds are exposed via environment vars
provider "proxmox" {
  pm_api_url = "https://192.168.1.53:8006/api2/json"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "cloudinit-test" {
  name = "terraform-vm-test"
  desc = "test to see if this works"

  target_node = "vm"

  pool = "vm1"

  clone = "VM 9000"

  agent = 1

  os_type = "cloud-init"
  cores = 2
  sockets = 1
  vcpus = 0
  cpu = "host"
  memory = 2048
  scsihw =  "lsi"

  disk {
    size = "10G"
    type = "virtio"
    // storage = "ceph-storage-pool"
    iothread = 1
    ssd = 1
    discard = "on"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
    tag = 256
  }

  ipconfig0 = "ip=192.168.1.90/24,gw=192.168.0.1"

  sshkeys = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMa9BkreshcNcL0bVKR5xEtH/JoGOv/h3rEFF90FuCl1 jhargr200@gmail.com
  EOF

}