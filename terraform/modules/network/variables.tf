variable "vpc_cidr" {
  description = "Bloque CIDR principal de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Bloque CIDR de la subred pública"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Bloque CIDR de la subred privada"
  type        = string
  default     = "10.0.2.0/24"
}

variable "environment" {
  description = "Nombre del entorno"
  type        = string
  default     = "lab"
}