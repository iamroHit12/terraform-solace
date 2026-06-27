moved {
  from = module.order_queue.solacebroker_msg_vpn_queue.queue
  to   = module.queues["ORDER_QUEUE"].solacebroker_msg_vpn_queue.queue
}