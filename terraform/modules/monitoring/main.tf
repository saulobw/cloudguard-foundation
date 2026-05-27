# ─────────────────────────────────────────
# S3 BUCKET PARA LOGS DE CLOUDTRAIL
# ─────────────────────────────────────────
resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket        = var.s3_bucket_name
  force_destroy = true

  tags = {
    Name        = "cloudguard-cloudtrail-logs"
    Environment = var.environment
    Project     = "cloudguard-foundation"
  }
}

resource "aws_s3_bucket_versioning" "cloudtrail_logs" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail_logs" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloudtrail_logs" {
  bucket = aws_s3_bucket.cloudtrail_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ─────────────────────────────────────────
# CLOUDWATCH LOG GROUP
# ─────────────────────────────────────────
resource "aws_cloudwatch_log_group" "cloudtrail" {
  name              = "/cloudguard/cloudtrail"
  retention_in_days = var.log_retention_days

  tags = {
    Name        = "cloudguard-cloudtrail-logs"
    Environment = var.environment
  }
}

# ─────────────────────────────────────────
# CLOUDWATCH ALARM — USO DE ROOT
# ─────────────────────────────────────────
resource "aws_cloudwatch_metric_alarm" "root_usage" {
  alarm_name          = "cloudguard-root-account-usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "RootAccountUsage"
  namespace           = "CloudGuardSecurity"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alerta: se detectó uso del usuario root"

  tags = {
    Name        = "cloudguard-root-alarm"
    Environment = var.environment
  }
}