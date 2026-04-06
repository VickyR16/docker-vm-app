terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {

  }
}

module "container-apps" {
  source           = "./modules/container-apps"
  logAnalyticsName = "workspacegrp2a1ba"
  rgName           = "grp2"
  contAppEnvName   = "managedEnvironment-grp2-860a"
  contAppName      = "cont-app2"
  containerName    = "github-container1"
}
