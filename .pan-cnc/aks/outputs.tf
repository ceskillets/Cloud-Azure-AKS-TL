output "fqdn" {
    value = "${azurerm_kubernetes_cluster.k8s.fqdn}"
}
output "host" {
    value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.host}"
}