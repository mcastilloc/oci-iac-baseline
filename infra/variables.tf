
variable "region" { type = string }
variable "compartment_ocid" { type = string }
variable "ssh_public_key" { type = string }
variable "cloud_init_file" { type = string  default = "../scripts/cloud-init/cloud-init-nginx.yaml" }

# Optional tuning
variable "project_tags" {
  type = map(string)
  default = {
    cost_center = "demo"
    env         = "dev"
    owner       = "marcelo.castillo"
    project     = "oci-iac-baseline"
  }
}
