locals {
  vm_names = {
    web = "${var.vpc_name}-${var.zone_a}-platform-web"
    db  = "${var.vpc_name}-${var.zone_b}-platform-db"
  }
}

