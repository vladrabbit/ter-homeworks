###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "platform" {
  type        = string
  default     = "standard-v3"
  description = "VM processor family"
}

variable "cores" {
  type        = number
  default     = 2
  description = "VM processor cores"
}

variable "memory" {
  type        = number
  default     = 1
  description = "VM memory"
}

variable "fraction" {
  type        = number
  default     = 20
  description = "VM processor fraction"
}

variable "preemptible" {
  type        = bool
  default     = true
}

variable "family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image OS type"
}

variable "metadata" {
  type = map(string)
  default = {
    ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPeiljpbEqYj5M0crqLuP2wdQYujzraNUOL2dWYPJq5i blade@homemint"
  }
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cores       = number
    memory      = number
    size        = number
    preemptible = bool
    nat         = bool
    fraction    = number
    platform = string

  }))
  default = [
    { vm_name = "main", cores = 4, memory = 4,  size = 50, preemptible = false, nat = true , fraction = 20, platform = "standard-v3"},
    { vm_name = "replica", cores = 2, memory = 2,  size = 20, preemptible = true, nat = true , fraction = 20, platform = "standard-v3"}
  ]
}

variable "storage_vm" {
    type = list(object({
      vm_name     = string
      platform_id = string
      cores       = number
      memory      = number
      preemptible = bool
      nat         = bool
  }))
    default = [
      { 
        vm_name     = "storage"
        platform_id = "standard-v3" 
        cores       = 2 
        memory      = 2   
        preemptible = true
        nat         = true  
      }
    ]
}