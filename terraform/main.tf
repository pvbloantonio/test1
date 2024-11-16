terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx.latest
  name  = "nginx_container"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
