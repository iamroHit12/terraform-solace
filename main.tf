resource "solacebroker_msg_vpn_queue" "order_queue" {

  msg_vpn_name = var.msg_vpn_name

  queue_name = var.queue_name

  ingress_enabled = true

  egress_enabled = true

}