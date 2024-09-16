terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"  # Specify the version you prefer
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "ctf_droplet" {
  image  = "docker-20-04"
  name   = "ctf-droplet"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [var.ssh_key]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.ssh_private_key)
    host        = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "apt-get update && apt-get install docker.io -y",
      "apt-get install docker-compose -y",
      "git clone https://github.com/Famington/ctf_challenges",
      "cd ctf_challenges && docker-compose up -d"
    ]
  }
}

output "ctf_ip" {
  value = digitalocean_droplet.ctf_droplet.ipv4_address
}
