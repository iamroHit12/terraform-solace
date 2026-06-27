terraform {
  required_version = ">= 1.5.0"

  required_providers {
    solacebroker = {
      source  = "SolaceProducts/solacebroker"
      version = "1.1.0"
    }
  }
}
