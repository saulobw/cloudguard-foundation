variable "environment" {
  description = "Nombre del entorno"
  type        = string
  default     = "lab"
}

variable "key_deletion_window" {
  description = "Días de espera antes de eliminar una llave KMS"
  type        = number
  default     = 7
}

variable "enable_key_rotation" {
  description = "Activar rotación automática de llaves KMS"
  type        = bool
  default     = true
}