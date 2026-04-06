data "azurerm_resource_group" "grp1" {
  name = var.rgName
}

data "azurerm_log_analytics_workspace" "lawork1" {
    name = var.logAnalyticsName
    resource_group_name = data.azurerm_resource_group.grp1.name
}

data "azurerm_container_app_environment" "cont-app-env" {
  name = var.contAppEnvName
  resource_group_name = data.azurerm_resource_group.grp1.name
}

resource "azurerm_container_app" "contApp1" {
  name = var.contAppName
  container_app_environment_id = data.azurerm_container_app_environment.cont-app-env.id
  resource_group_name = data.azurerm_resource_group.grp1.name
  revision_mode = "Single"
  template {
    container {
        name = var.containerName
        image = "ghcr.io/vickyr16/docker-vm-app/dev/app-image:v1"
        memory = "0.5Gi"
        cpu = 0.25
    }
  }
  ingress {
    target_port = 3000
    external_enabled = true
    traffic_weight {
        revision_suffix = "v1"
        percentage = 100
    }
  }
}