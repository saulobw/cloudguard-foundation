output "security_admins_group" {
  description = "Nombre del grupo de administradores de seguridad"
  value       = aws_iam_group.security_admins.name
}

output "security_auditors_group" {
  description = "Nombre del grupo de auditores de seguridad"
  value       = aws_iam_group.security_auditors.name
}

output "security_automation_role_arn" {
  description = "ARN del rol para servicios automatizados"
  value       = aws_iam_role.security_automation.arn
}