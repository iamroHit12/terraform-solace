module "queues" {

  for_each        = toset(var.queue_names)
  source          = "./modules/queue"
  queue_name      = each.value
  msg_vpn_name    = var.msg_vpn_name
  ingress_enabled = var.ingress_enabled
  egress_enabled  = var.egress_enabled
}
