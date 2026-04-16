terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "suplor"
  region  = "us-central1"
  zone    = "us-central1-a"
}

variable "project" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

output "ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}
