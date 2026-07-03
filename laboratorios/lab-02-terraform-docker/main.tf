terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_network" "lab_network" {
  name = "lab_network"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "web_nginx" {
  name  = "web-nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 9090
  }

  networks_advanced {
    name = docker_network.lab_network.name
  }
}

resource "docker_container" "internal_service_1" {
  name  = "internal-service-1"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.lab_network.name
  }
}

resource "docker_container" "internal_service_2" {
  name  = "internal-service-2"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.lab_network.name
  }
}