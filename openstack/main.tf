terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "1.46.0"
    }
  }
}

provider "openstack" {
  user_name   = var.os_username
  tenant_name = var.os_username
  password    = var.os_password
  auth_url    = "https://192.168.1.49:5000/v3/"
  region      = "RegionOne"
}

resource "openstack_compute_instance_v2" "test" {
    name        = "test"
    image_id    = "08313400-bc7b-46fb-9570-e91853bff0d0"
    flavor_name = "m1.medium"
    user_data   = "${file("user-data")}"

    network {
        name = "external"
    }
}

