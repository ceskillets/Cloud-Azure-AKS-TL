output "Load_Balancer-IP" {
    value = "${kubernetes_service.twistlock_console.load_balancer_ingress.0.ip}"
}

output "Twistlock_Console-IP" {
    value = "https://${kubernetes_service.twistlock_console.load_balancer_ingress.0.ip}:8083"
}