
variable "cluster_name" {
    description = "AKS Cluster Name"
    default = "changeme-aks-cluster"
}

variable "resource_group_name" {
    description = "Azure Resource Group Name"
    default = "changeme-rg"
}

variable "access_token" {
    description = "Prisma Cloud Compute Access Token"
    default = "XXXXXXXXX"    
}

variable "twistlock_user" {
    description = "Prisma Cloud Compute User Name"
    default = "changeme-username"
}

variable "twistlock_password" {
    description = "Prisma Cloud Compute User Password"
    default = "changeme-password"
}

variable "twistlock_license" {
    description = "Prisma Cloud Compute License Key"
    default = "XXXXXX"
}