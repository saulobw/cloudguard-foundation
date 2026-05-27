# CloudGuard Foundation 🛡️

> Infraestructura cloud segura desde cero — Proyecto 1 de 3 del portafolio Cloud Security Engineering

## ¿Qué es este proyecto?

CloudGuard Foundation es una infraestructura AWS desplegada con Terraform que implementa los controles de seguridad fundamentales de la industria. Forma parte de un portafolio de tres proyectos diseñado para demostrar competencias reales en Cloud Security Engineering.

## Infraestructura desplegada

| Componente | Tecnología | Descripción |
|---|---|---|
| Gestión de identidades | AWS IAM | Grupos, políticas y roles con mínimo privilegio |
| Red segura | AWS VPC | Subredes pública/privada, Internet Gateway, Route Tables |
| Cifrado | AWS KMS | Llave maestra con rotación automática |
| Gestión de secretos | AWS Secrets Manager | Credenciales cifradas con KMS |
| Monitoreo | AWS CloudWatch | Logs centralizados y alarma de uso de root |
| Almacenamiento seguro | AWS S3 | Bucket cifrado, versionado y bloqueado públicamente |

## Stack técnico

- **IaC:** Terraform 1.x
- **Simulador:** LocalStack (100% compatible con AWS real)
- **Lenguaje:** HCL + Python
- **Estándar de seguridad:** CIS AWS Benchmark

## Estructura del proyecto
cloudguard-foundation/
├── terraform/
│   ├── environments/lab/    ← punto de entrada
│   └── modules/
│       ├── iam/             ← identidades y accesos
│       ├── network/         ← VPC y segmentación
│       ├── encryption/      ← KMS y Secrets Manager
│       └── monitoring/      ← CloudWatch y alertas
├── scripts/                 ← automatización Python
├── reports/                 ← reportes de auditoría
└── docs/                    ← arquitectura y decisiones

## Cómo ejecutar

```bash
# 1. Iniciar LocalStack
localstack start -d

# 2. Inicializar Terraform
cd terraform/environments/lab
terraform init

# 3. Desplegar infraestructura
terraform apply
```

## Portafolio completo

| # | Proyecto | Descripción | Estado |
|---|---|---|---|
| 1 | **CloudGuard Foundation** | Infraestructura cloud segura | ✅ Completado |
| 2 | **CloudStrike RedBlue Lab** | Red Team + Blue Team en AWS | 🔄 En progreso |
| 3 | **CloudMind AI-SOC** | SOC con Inteligencia Artificial | ⏳ Próximamente |

## Autor

**saulobw** — Cloud Security Engineering Portfolio  

---
*Construido con fines educativos y de portafolio profesional*
