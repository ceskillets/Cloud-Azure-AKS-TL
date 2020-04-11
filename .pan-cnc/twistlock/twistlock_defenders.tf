resource "null_resource" "defenders" {
  provisioner "local-exec" {
    command = <<EOH
curl -k -u ${var.twistlock_user}:${var.twistlock_password} 'https://${kubernetes_service.twistlock_console.load_balancer_ingress.0.ip}:8083/api/v1/defenders/daemonset.yaml?consoleaddr=twistlock-console&namespace=twistlock&orchestration=kubernetes&privileged=true' > /tmp/defender.yaml
EOH
  }
  provisioner "local-exec" {
    command = "cd /tmp && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl"
  }
  provisioner "local-exec" {
    command = "chmod +x /tmp/kubectl"
  }
  provisioner "local-exec" {
    command = "rm -rf ~/.kube && az aks get-credentials -n ${var.cluster_name} -g ${var.resource_group_name}"
  }
  provisioner "local-exec" {
    command = "export KUBECONFIG=~/.kube/config"
  }
  provisioner "local-exec" {
    command = "/tmp/kubectl create -f /tmp/defender.yaml"
  }
  provisioner "local-exec" {
    command = "rm -rf /tmp/defender.yaml ~/.kube /tmp/kubectl"
  }
  depends_on = [ "kubernetes_deployment.twistlock_console",
                 "null_resource.twistlock-add-firstuser",
                 "null_resource.twistlock-add-license" ]
}