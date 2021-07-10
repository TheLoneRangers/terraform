terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.7.3"
    }
  }
}

provider "docker" {}

#proxmox creds are exposed via environment vars
provider "proxmox" {
  pm_api_url = "https://192.168.1.53:8006/api2/json"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
