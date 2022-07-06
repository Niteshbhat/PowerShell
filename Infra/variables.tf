/*****************************************************
             Variables Configuration
 ****************************************************/


variable "rg_name" {
  type    = string
  default = "az-notified-rg"
}

variable "tags" {
  type = map
  default = {
    "env" = "dev"
  }
}

variable "location" {
  type    = string
  default = "West US"
}


variable "notified-aci" {
  type = map
  default = {
    "name"             = "notified-techchallenge"
    "dns_label"        = "notified-techchallenge"
    "container1_name"  = "postgres"
    "container1_image" = "postgres:latest"
    "container2_name"  = "az-test"
    "container2_image" = "evila/az-test:15"
    "DbHost"           = "localhost"
    "ListenHost"       = "0.0.0.0"
    "ListenPort"       = "80"
  }
}