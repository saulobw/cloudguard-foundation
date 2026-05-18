# ─────────────────────────────────────────
# POLÍTICA DE CONTRASEÑAS
# ─────────────────────────────────────────
resource "aws_iam_account_password_policy" "strong" {
  minimum_password_length        = var.password_min_length
  max_password_age               = var.max_password_age
  password_reuse_prevention      = var.password_reuse_prevention
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  allow_users_to_change_password = true
}

# ─────────────────────────────────────────
# GRUPOS IAM
# ─────────────────────────────────────────
resource "aws_iam_group" "security_admins" {
  name = "security-admins"
}

resource "aws_iam_group" "security_auditors" {
  name = "security-auditors"
}

# ─────────────────────────────────────────
# POLÍTICA PARA ADMINS
# ─────────────────────────────────────────
resource "aws_iam_policy" "security_admin_policy" {
  name        = "SecurityAdminPolicy"
  description = "Permisos administrativos controlados para el equipo de seguridad"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iam:Get*",
          "iam:List*",
          "iam:CreateUser",
          "iam:DeleteUser",
          "iam:AttachUserPolicy",
          "cloudtrail:*",
          "config:*",
          "securityhub:*"
        ]
        Resource = "*"
      }
    ]
  })
}

# ─────────────────────────────────────────
# POLÍTICA PARA AUDITORES
# ─────────────────────────────────────────
resource "aws_iam_policy" "security_auditor_policy" {
  name        = "SecurityAuditorPolicy"
  description = "Permisos de solo lectura para auditores de seguridad"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iam:Get*",
          "iam:List*",
          "cloudtrail:Get*",
          "cloudtrail:List*",
          "cloudtrail:Describe*",
          "config:Get*",
          "config:List*",
          "config:Describe*"
        ]
        Resource = "*"
      }
    ]
  })
}

# ─────────────────────────────────────────
# ADJUNTAR POLÍTICAS A GRUPOS
# ─────────────────────────────────────────
resource "aws_iam_group_policy_attachment" "admins_policy" {
  group      = aws_iam_group.security_admins.name
  policy_arn = aws_iam_policy.security_admin_policy.arn
}

resource "aws_iam_group_policy_attachment" "auditors_policy" {
  group      = aws_iam_group.security_auditors.name
  policy_arn = aws_iam_policy.security_auditor_policy.arn
}

# ─────────────────────────────────────────
# ROL IAM PARA SERVICIOS AUTOMATIZADOS
# ─────────────────────────────────────────
resource "aws_iam_role" "security_automation" {
  name = "security-automation-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "lambda.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}