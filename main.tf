terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
}

provider "vault" {}

data "vault_generic_secret" "digitalocean_pat"{
  path = "secret/digitalocean"
}

provider "digitalocean" {
  token = data.vault_generic_secret.digitalocean_pat.data.pat
}

/*
data "digitalocean_ssh_key" "terraform" {
  name = "terraform"
}
*/