packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

variable "docker_image" {
  type = string
  default = "ubuntu:focal"
}

source "docker" "ubuntu" {
  image  = var.docker_image
  commit = true
}

build {
  sources = [
    "source.docker.ubuntu"
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=Hello world",
    ]
    inline = [
      "echo Adding file to docker container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }
  provisioner "shell" {
    inline = ["echo Running ${var.docker_image} Docker image."]
  }
  post-processor "docker-tag" {
    repository = "learn-packer"
    tags = ["ubuntu-focal", "packer-rocks"]
    only = ["docker.ubuntu"]
  }
}
