variable "password_min_length" {
  description = "Longitud mínima de contraseña para usuarios IAM"
  type        = number
  default     = 14
}

variable "max_password_age" {
  description = "Días máximos antes de que expire una contraseña"
  type        = number
  default     = 90
}

variable "password_reuse_prevention" {
  description = "Cantidad de contraseñas anteriores que no se pueden reutilizar"
  type        = number
  default     = 24
}