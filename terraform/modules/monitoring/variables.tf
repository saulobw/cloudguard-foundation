variable "environment" {
  description = "Nombre del entorno"
  type        = string
  default     = "lab"
}

variable "cloudtrail_name" {
  description = "Nombre del trail de CloudTrail"
  type        = string
  default     = "cloudguard-trail"
}

variable "log_retention_days" {
  description = "Días de retención de logs en CloudWatch"
  type        = number
  default     = 90
}

variable "s3_bucket_name" {
  description = "Nombre del bucket S3 para logs de CloudTrail"
  type        = string
  default     = "cloudguard-cloudtrail-logs"
}