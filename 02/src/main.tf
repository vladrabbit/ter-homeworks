resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop_a" {
  name           = "${var.vpc_name}-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cidr_a
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "${var.vpc_name}-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cidr_b
}

data "yandex_compute_image" "ubuntu" {
  family = var.family 
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_names.web
  platform_id = var.vms_resources.web.platform
  zone = var.vms_resources.web.zone
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources.web.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_a.id
    nat       = true
  }

  metadata = var.metadata

}





resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_names.db
  platform_id = var.vms_resources.db.platform
  zone = var.vms_resources.db.zone
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources.db.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = true
  }

  metadata = var.metadata

}
