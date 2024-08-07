###cloud vars

variable "zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image OS type"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM name"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v1"
  description = "VM processor family"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "VM processor cores"
}

variable "vm_db_memory" {
  type        = number
  default     = 1
  description = "VM memory"
}

variable "vm_db_fraction" {
  type        = number
  default     = 5
  description = "VM processor fraction"
}

