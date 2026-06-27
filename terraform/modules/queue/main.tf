resource "solacebroker_msg_vpn_queue" "queue" {
  msg_vpn_name    = var.msg_vpn_name
  queue_name      = var.queue_name
  ingress_enabled = var.ingress_enabled
  egress_enabled  = var.egress_enabled
}
