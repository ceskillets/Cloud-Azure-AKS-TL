resource "azurerm_kubernetes_cluster" "k8s" {
    name                = "${var.cluster_name}"
    location            = "${azurerm_resource_group.main.location}"
    resource_group_name = "${azurerm_resource_group.main.name}"
    dns_prefix          = "${var.dns_prefix}-${random_id.randomId.hex}"

    linux_profile {
        admin_username = "${var.adminUsername}"

        ssh_key {
            key_data = "${var.ssh_public_key}"
        }
    }

    default_node_pool {
        name                  = "mynodepool"
        node_count            = "${var.agent_count}"
        vm_size               = "${var.vm_size}"
        type                  = "AvailabilitySet"
        os_disk_size_gb       = 100
    }

    service_principal {
        client_id     = "${var.client_id}"
        client_secret = "${var.client_secret}"
    }
}
