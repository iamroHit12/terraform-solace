terraform {

  required_version = ">= 1.5.0"

  required_providers {

    solacebroker = {

      source = "SolaceProducts/solacebroker"

      version = "1.1.0"

    }

  }

}

provider "solacebroker" {

  url      = var.semp_url
  username = var.username
  password = var.password

}