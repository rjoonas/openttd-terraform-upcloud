provider "upcloud" {
  # Terraform can prompt for UpCloud credentials interactively
  # or you can set them with environment variables UPCLOUD_USERNAME & UPCLOUD_PASSWORD
}

resource "upcloud_server" "openttd" {
  hostname = var.hostname
  zone     = var.upcloud_zone
  plan     = "1xCPU-1GB"

  storage_devices {
    size    = 25
    storage = "Debian GNU/Linux 10 (Buster)"
    tier    = "maxiops"
    action  = "clone"
  }

  login {
    user = "root"
    keys = [
      # chomp has to be used here because upcloud_server will fail with
      # SSH_KEYS_INVALID if key has a trailing newline
      chomp(file(var.ssh_public_key_path))
    ]
    create_password = false
  }

  connection {
    host        = self.ipv4_address
    type        = "ssh"
    user        = "root"
    private_key = file(var.ssh_private_key_path)
  }

  provisioner "file" {
    source      = "openttd.service"
    destination = "/etc/systemd/system/openttd.service"
  }

  provisioner "remote-exec" {
    script = "provision-openttd.sh"
  }

  provisioner "file" {
    source      = "openttd.cfg"
    destination = "/home/openttd/.openttd/openttd.cfg"
  }

  provisioner "remote-exec" {
    script = "download-newgrf.sh"
  }

  provisioner "remote-exec" {
    inline = ["systemctl start openttd"]
  }

}
