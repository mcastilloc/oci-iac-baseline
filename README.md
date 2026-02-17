
# OCI IaC Baseline (Terraform)

**ES** — Baseline de infraestructura en Oracle Cloud Infrastructure mediante Terraform: VCN + subredes pública/privada, instancia de cómputo con `cloud-init`, gobierno de costos (Budget), etiquetado y políticas IAM de mínimo privilegio. Incluye `outputs` claros y `destroy` seguro.

**EN** — OCI infrastructure baseline using Terraform: VCN + public/private subnets, a compute instance with `cloud-init`, cost governance (Budget), tagging, and least-privilege IAM policies. Includes clear `outputs` and a safe `destroy` process.

## Objetivos / Goals
- Reproducibilidad (Terraform modules)
- Seguridad (mínimo privilegio, reglas de red mínimas)
- Gobernanza (Budget + etiquetas obligatorias)
- Operabilidad (cloud-init, health, teardown)

## Estructura / Structure
```
infra/
  providers.tf
  main.tf
  variables.tf
  outputs.tf
  terraform.tfvars.example
  modules/
    network/
    compute/
    governance/
    iam/
scripts/
  cloud-init/
    cloud-init-nginx.yaml
    cloud-init-node-exporter.yaml
```

## Uso / Usage
1. Copia `infra/terraform.tfvars.example` a `infra/terraform.tfvars` y completa valores (no lo subas al repo).
2. Ejecuta:
```bash
cd infra
terraform init
terraform fmt -check
terraform validate
terraform plan -out tfplan
# terraform apply tfplan
```
3. Destruir:
```bash
terraform destroy
```

> **Nota / Note:** No incluyas secretos en el repositorio. Usa variables de entorno o `terraform.tfvars` ignorado por Git.

## Evidencias sugeridas / Suggested Evidence
- Capturas de Budget/Alerta, VCN/Subnets, reglas de seguridad, instancia con `cloud-init` aplicado.
- Salida de `plan/apply` (resumen) y página de Nginx o `/metrics` de node_exporter.

## Licencia / License
MIT
