
# Configure the Microsoft Azure Provider
provider "azurerm" {
    version = "~>1.5"
}


data "azurerm_kubernetes_cluster" "mycluster" {
  name                = "${var.cluster_name}"
  resource_group_name = "${var.resource_group_name}"
}


provider "kubernetes" {
  load_config_file       = "false"
  host                   = "${data.azurerm_kubernetes_cluster.mycluster.kube_config.0.host}"
  username               = "${data.azurerm_kubernetes_cluster.mycluster.kube_config.0.username}"
  password               = "${data.azurerm_kubernetes_cluster.mycluster.kube_config.0.password}"
  client_certificate     = "${base64decode(data.azurerm_kubernetes_cluster.mycluster.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(data.azurerm_kubernetes_cluster.mycluster.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(data.azurerm_kubernetes_cluster.mycluster.kube_config.0.cluster_ca_certificate)}"
}
