
# Guía (ES)

- Configura tus credenciales OCI (tenancy OCID, user OCID, fingerprint, private key) fuera del repo.
- Usa un *compartment* específico para este proyecto.
- Elige `cloud-init` Nginx (demo HTTP) o `node_exporter` (métricas) cambiando la variable `cloud_init_file` en `infra/variables.tf`.
- Revisa límites de Free Tier antes de aplicar.
