
# Guide (EN)

- Configure OCI credentials (tenancy OCID, user OCID, fingerprint, private key) outside the repo.
- Use a dedicated *compartment* for this project.
- Choose `cloud-init` Nginx (HTTP demo) or `node_exporter` (metrics) via `cloud_init_file` variable in `infra/variables.tf`.
- Check Free Tier limits before applying.
