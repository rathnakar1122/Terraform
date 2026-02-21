terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "2.3.0"  # You can specify the version you need
    }
  }
}

provider "random" {
  # Configuration options for the provider (if needed)
}
