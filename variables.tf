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

variable "queue_name" {
  description = "Queue Name"
  type        = string
}

variable "msg_vpn_name" {
  description = "Message VPN Name"
  type        = string
}