<img src="https://raw.githubusercontent.com/OpenTTD/OpenTTD/1.9.3/media/openttd.256.png" alt="OpenTTD" width="128" align="right" />

# openttd-terraform-upcloud

***Motivation:*** *why configure local firewalls and NAT tables to host a quick game if you can just spin up a dedicated server at the push of a button?*

----

Terraform configuration to deploy an [OpenTTD](https://github.com/OpenTTD/OpenTTD) game server on [UpCloud](https://upcloud.com/). The server will be running **Debian 10**, with **openttd 1.10.1** compiled from source.

## Prerequisites

* **[UpCloud](https://upcloud.com/) account**
  * Register at https://upcloud.com/signup/
* **[Terraform](https://www.terraform.io/)**
  * Can be installed eg. using Homebrew on Mac OS: `brew install terraform`
* **[terraform-provider-upcloud](https://github.com/UpCloudLtd/terraform-provider-upcloud)**
  * Mac OS installation goes something like this:

```
brew install go
go get github.com/UpCloudLtd/terraform-provider-upcloud
go install github.com/UpCloudLtd/terraform-provider-upcloud
mkdir -p ~/.terraform.d/plugins/
ln -s ~/go/bin/terraform-provider-upcloud ~/.terraform.d/plugins/
```

* **SSH key without a passphrase**
  * If you don't have one at hand, try something like `ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_upcloud` on a *NIX system. Leave passphrase empty so Terraform knows how to use it.

## Deployment

To play on a dedicated openttd server, clone the repo and:

1. Modify [openttd.cfg](openttd.cfg) with your preferred game settings. Custom NewGRF downloads need to be added to [download-newgrf.sh](download-newgrf.sh).
2. Run `terraform init` in the repo root directory to prepare Terraform.
3. Run `terraform apply`. You're first prompted for missing config variables and then you'll get a preview of the cloud resources about to be created. Accept the execution plan by typing `yes`.
4. Wait a few minutes while Terraform creates and configures the server.
5. Copy the server IP that Terraform prints on exit (`openttd_server_ip` in module outputs)
6. Connect OpenTTD clients by entering this IP in *Main menu → Multiplayer → Add server*.

UpCloud will bill your credit card monthly until you delete the server with `terraform destroy`.

## Control server with rcon

Many server administration tasks can be done using rcon in [OpenTTD in-game console](https://wiki.openttd.org/Console). To enable it, you have to set a `rcon_password` in [openttd.cfg](openttd.cfg).

For example, to initialize server with a saved game:

1. Transfer `filename.sav` to `/home/openttd/.openttd/` (eg. using SFTP)
2. Connect a client to the server and open the in-game console
3. Type `rcon <your-password-here> "load filename"`

## General server administration

You can ssh to the server as root with the SSH key you set during provisioning. Common tasks:

* Browse openttd logs with journalctl, eg. `journalctl -o short-iso -n 500 --no-hostname --utc -u openttd`
* To edit configuration live:
  * Stop openttd – otherwise it will overwrite config on exit: `systemctl stop openttd`
  * Make desired changes to `/home/openttd/.openttd/openttd.cfg`
  * Start openttd `systemctl start openttd`

## Configuration variables

| Variable               |  Description                                                           |
|------------------------|------------------------------------------------------------------------|
| `ssh_public_key_path`  | Path to a SSH public key that you want to use for managing the server  |
| `ssh_private_key_path` | Path to a SSH private key that you want to use for managing the server |
| `upcloud_zone`         | UpCloud zone to use – default is Helsinki, Finland                     |
| `hostname`             | Server hostname                                                        |
