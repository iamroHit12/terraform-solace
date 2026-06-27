variable "queue_name" {
  description = "Queue Name"
  type        = string
}

variable "msg_vpn_name" {
  description = "Message VPN"
  type        = string
}

variable "ingress_enabled" {
  type = bool
}

variable "egress_enabled" {
  type = bool
}