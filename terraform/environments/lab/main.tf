# CloudGuard Foundation — Fase 1: IAM
# Este archivo es el punto de entrada principal de Terraform

module "iam" {
  source = "../../modules/iam"
}

module "network" {
  source = "../../modules/network"
}

module "encryption" {
  source = "../../modules/encryption"
}