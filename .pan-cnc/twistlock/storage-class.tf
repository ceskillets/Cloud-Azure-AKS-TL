resource "kubernetes_storage_class" "twistlock-console-storage-class" {
  metadata {
    name = "twistlock-console-storage-class"
  }
  storage_provisioner = "kubernetes.io/azure-disk"
  reclaim_policy      = "Retain"
  parameters = {
    kind = "managed",
    storageaccounttype = "Premium_LRS"
  }
}
