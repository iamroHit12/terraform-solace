variable "semp_url" {
  description = "SEMP URL of the Solace broker"
  type        = string
}

variable "username" {
  description = "SEMP username"
  type        = string
}

variable "password" {
  description = "SEMP password"
  type        = string
  sensitive   = true
}

variable "queue_names" {
  description = "List of queues"
  type        = list(string)
}

variable "msg_vpn_name" {
  description = "Message VPN Name"
  type        = string
}

variable "ingress_enabled" {
  type = bool
}

variable "egress_enabled" {
  type = bool
}