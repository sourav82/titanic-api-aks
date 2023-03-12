variable "location" {
  default     = "westeurope"
  description = "Source location of the VMs."
}
variable "rgName" {
  default = "Hub-RG"
  description = "Target resource group for DR"
}

variable "appId" {
  description = "Application ID."
}

variable "password" {
    description = "Password of app id"
}