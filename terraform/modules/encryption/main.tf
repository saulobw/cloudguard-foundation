# ─────────────────────────────────────────
# LLAVE KMS PRINCIPAL
# ─────────────────────────────────────────
resource "aws_kms_key" "main" {
  description             = "Llave maestra de cifrado — CloudGuard Foundation"
  deletion_window_in_days = var.key_deletion_window
  enable_key_rotation     = var.enable_key_rotation

  tags = {
    Name        = "cloudguard-main-key"
    Environment = var.environment
    Project     = "cloudguard-foundation"
  }
}

# ─────────────────────────────────────────
# ALIAS DE LA LLAVE
# ─────────────────────────────────────────
resource "aws_kms_alias" "main" {
  name          = "alias/cloudguard-main-key"
  target_key_id = aws_kms_key.main.key_id
}

# ─────────────────────────────────────────
# SECRETO DE EJEMPLO EN SECRETS MANAGER
# ─────────────────────────────────────────
resource "aws_secretsmanager_secret" "db_credentials" {
  name        = "cloudguard/lab/db-credentials"
  description = "Credenciales de base de datos — entorno lab"
  kms_key_id  = aws_kms_key.main.arn

  tags = {
    Name        = "cloudguard-db-credentials"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = aws_secretsmanager_secret.db_credentials.id

  secret_string = jsonencode({
    username = "cloudguard_admin"
    password = "Ch4ng3M3!nPr0duct10n"
    engine   = "postgres"
    host     = "db.internal.cloudguard.local"
    port     = 5432
  })
}