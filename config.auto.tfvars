vpn_users = "dan,jack"
algo_ssh_private = "algo_ssh.pem"
ca_password = ""
algo_name = "algo-local"
components = {
    "dns_adblocking"  = true
    "ssh_tunneling"   = true
    "security"        = true
}
image = {
    "digitalocean"    = "ubuntu-16-04-x64"
    "ec2.name"        = "ubuntu-xenial-16.04"
    "ec2.owner"       = ""
    "gce"             = "ubuntu-os-cloud/ubuntu-1604-lts"
    "azure.offer"     = "UbuntuServer"
    "azure.publisher" = "Canonical"
    "azure.sku"       = "16.04-LTS"
    "azure.version"   = "latest"
}
size = {
    "digitalocean"    = "s-1vcpu-1gb"
    "ec2"             = "t2.micro"
    "gce"             = "f1-micro"
    "azure"           = "Basic_A0"
}
