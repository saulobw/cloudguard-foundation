output "cloudtrail_bucket" {
  description = "Nombre del bucket S3 de logs"
  value       = aws_s3_bucket.cloudtrail_logs.id
}

output "cloudwatch_log_group" {
  description = "Nombre del log group de CloudWatch"
  value       = aws_cloudwatch_log_group.cloudtrail.name
}

output "root_alarm_name" {
  description = "Nombre de la alarma de uso de root"
  value       = aws_cloudwatch_metric_alarm.root_usage.alarm_name
}