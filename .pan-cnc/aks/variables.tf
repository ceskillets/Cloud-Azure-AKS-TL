variable "resource_group_name" {
    description = "Azure Resource Group"
    default = "rg-changeme"
}

variable "location" {
    description = "Azure Region"
    default = "australiaeast"
}

variable "cluster_name" {
    description = "AKS Cluster Name"
    default = "changeme-aks-cluster"
}

variable "dns_prefix" {
    description = "DNS Prefix"
    default = "changeme-dns-aks-cluster"
}

variable "adminUsername" {
    description = "Admin Username"
    default = "put-in-your-username"
}

variable "ssh_public_key" {
    description = "SSH Authorized Key"
    default = "ssh-rsa SomeKeyDataStringHere"
}

variable "agent_count" {
    description = "AKS Cluster Node Pools"
    default = "3"
}

variable "client_id" {
    description = "Azure APPID Service Principal"
    default = "serviceprincipal"
}

variable "client_secret" {
    description = "Azure APPID Service Principal Password"
    default = "serviceprincipalpassword"
}

variable "vm_size" {
    description = "AKS Cluster Instance Size"
    default = "Standard_DS2_v2"
}
