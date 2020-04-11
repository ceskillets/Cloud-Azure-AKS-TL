resource "null_resource" "twistlock-add-firstuser" {
  provisioner "local-exec" {
    command = <<EOH
curl -k -H 'Content-Type: application/json' -X POST -d '{"username": "${var.twistlock_user}", "password": "${var.twistlock_password}"}' https://${kubernetes_service.twistlock_console.load_balancer_ingress.0.ip}:8083/api/v1/signup
EOH
  }
  depends_on = [ "kubernetes_deployment.twistlock_console" ]
}

resource "null_resource" "twistlock-add-license" {
  provisioner "local-exec" {
    command = <<EOH
curl -k -u ${var.twistlock_user}:${var.twistlock_password} -H 'Content-Type: application/json' POST -d '{"key": "'"${var.twistlock_license}"'"}' https://${kubernetes_service.twistlock_console.load_balancer_ingress.0.ip}:8083/api/v1/settings/license
EOH
  }
  depends_on = [ "kubernetes_deployment.twistlock_console",
                 "null_resource.twistlock-add-firstuser" ]
}