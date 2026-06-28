terraform {
  cloud {
    organization = "rohit-platform"

    workspaces {
      name = "solace-dev"
    }
  }
}