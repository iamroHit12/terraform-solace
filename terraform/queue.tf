module "queues" {

  for_each        = toset(local.queue_list)
  source          = "./modules/queue"
  queue_name      = each.value
  msg_vpn_name    = var.msg_vpn_name
  ingress_enabled = var.ingress_enabled
  egress_enabled  = var.egress_enabled
}
