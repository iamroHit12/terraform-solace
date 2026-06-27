resource "solacebroker_msg_vpn_queue" "order_queue" {

  msg_vpn_name = "service01"

  queue_name = var.queue_name

  ingress_enabled = true

  egress_enabled = true

}