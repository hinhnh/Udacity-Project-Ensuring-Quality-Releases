provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "tfstateudacityaccount"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    access_key           = "fjL+68Ode3aikf64+HCpNiSP9x+wtPPFTnNkM2thxQaNqKxwv9wWlEUm7Os9RtNYSnbcXSxp8ab0+ASt/VZdFQ=="
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}

module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  application_type     = "${var.application_type}"
  resource_type        = "vnet"
  resource_group       = "${var.resource_group}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = "${var.resource_group}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
 source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "app-service"
  resource_group   = "${var.resource_group}"
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "ip"
  resource_group   = "${var.resource_group}"
}

module "virtual_machine" {
  source               = "../../modules/vm"
  location             = "${var.location}"
  resource_group       = "${var.resource_group}"
  application_type     = "${var.application_type}"
  virtual_network_name = "${var.virtual_network_name}"
  address_prefix_test  = "${var.address_prefix_test}"
  address_space        = "${var.address_space}"
  subnet_id            = "${module.network.subnet_id_test}"
  public_ip_address_id = "${module.publicip.public_ip_address_id}"
  vm_username           = "${var.vm_username}"
  vm_password           = "${var.vm_password}"
}