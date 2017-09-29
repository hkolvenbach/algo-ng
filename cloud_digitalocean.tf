variable "do_token" {}

variable "do_image" {
  default = "ubuntu-16-04-x64"
}

variable "do_size" {
  default = "512mb"
}

variable "do_region" {
  default = "ams3"
}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_ssh_key" "algo" {
  count      = "${var.cloud_digitalocean == "true" ? 1 : 0}"
  name       = "algo-ng"
  public_key = "${tls_private_key.algo_ssh.public_key_openssh}"
}

resource "digitalocean_droplet" "algo" {
  count     = "${var.cloud_digitalocean == "true" ? 1 : 0}"
  image     = "ubuntu-16-04-x64"
  name      = "algo-ng"
  region    = "ams3"
  size      = "512mb"
  ipv6      = true
  user_data = "${data.template_cloudinit_config.cloud_init.rendered}"
  private_networking = true
  ssh_keys  = [
    "${digitalocean_ssh_key.algo.id}"
  ]
}

resource "digitalocean_floating_ip" "algo" {
  droplet_id = "${digitalocean_droplet.algo.id}"
  region     = "${digitalocean_droplet.algo.region}"
}

output "INSTANCE" {
  value = "${digitalocean_floating_ip.algo.ip_address}"
}