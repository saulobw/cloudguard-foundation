output "kms_key_arn" {
  description = "ARN de la llave KMS principal"
  value       = aws_kms_key.main.arn
}

output "kms_key_alias" {
  description = "Alias de la llave KMS principal"
  value       = aws_kms_alias.main.name
}

output "db_secret_arn" {
  description = "ARN del secreto de base de datos"
  value       = aws_secretsmanager_secret.db_credentials.arn
}