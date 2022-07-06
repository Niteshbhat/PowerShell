resource "azurerm_resource_group" "az-rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_container_group" "notified-az-aci" {
  name                = var.notified-aci["name"]
  location            = azurerm_resource_group.az-rg.location
  resource_group_name = azurerm_resource_group.az-rg.name
  ip_address_type     = "Public"
  dns_name_label      = var.notified-aci["dns_label"]
  os_type             = "Linux"
 
  container {
    name   = var.notified-aci["container1_name"]
    image  = var.notified-aci["container1_image"]
    cpu    = "1.0"
    memory = "1.5"
    secure_environment_variables = {
      "VTT_DBHOST"        = var.notified-aci["DbHost"]
      "POSTGRES_PASSWORD" = "changeme"
      "VTT_LISTENHOST"    = var.notified-aci["ListenHost"]
    }

  }

  container {
    name     = var.notified-aci["container2_name"]
    image    = var.notified-aci["container2_image"]
    cpu      = "1.0"
    memory   = "1.5"
    commands = ["/bin/sh", "-c", "sleep 10 ;  ./TechChallengeApp updatedb; ./TechChallengeApp serve"]
    secure_environment_variables = {
      "VTT_DBHOST"     = var.notified-aci["DbHost"]
      "VTT_DBPASSWORD" = "changeme"
      "VTT_LISTENPORT" = var.notified-aci["ListenPort"]
      "VTT_LISTENHOST" = var.notified-aci["ListenHost"]
    }
    ports {
      port = 80
    }
  
  }

  tags = var.tags
}
