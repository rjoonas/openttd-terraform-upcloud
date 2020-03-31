variable "hostname" {
  description = "Server hostname"
  default     = "openttd.example.com"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to a SSH public key that you want to use for managing the server"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to a SSH private key that you want to use for managing the server"
  type        = string
}

variable "upcloud_zone" {
  description = "UpCloud zone to use – default is Helsinki, Finland"
  default     = "fi-hel1"
  type        = string
}
