
# Reusable GitHub Actions (Terraform & Docker)

**ES** — Workflows reutilizables para `terraform plan` y `docker build/push`.

**EN** — Reusable workflows for `terraform plan` and `docker build/push`.

## Usage examples

### Terraform plan
```yaml
jobs:
  plan:
    uses: mcastilloc/gh-actions-reusable/.github/workflows/terraform-plan.yml@main
    with:
      working_directory: infra
      terraform_version: 1.5.7
```

### Docker build & push
```yaml
jobs:
  docker:
    uses: mcastilloc/gh-actions-reusable/.github/workflows/docker-build-push.yml@main
    with:
      image_name: my-app
      image_tags: latest
      registry: ghcr.io
    secrets:
      registry_username: ${{ secrets.REGISTRY_USER }}
      registry_password: ${{ secrets.REGISTRY_TOKEN }}
```
