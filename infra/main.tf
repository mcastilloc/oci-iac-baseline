
module "network" {
  source           = "./modules/network"
  compartment_ocid = var.compartment_ocid
  region           = var.region
  project_tags     = var.project_tags
}

module "compute" {
  source           = "./modules/compute"
  compartment_ocid = var.compartment_ocid
  subnet_id        = module.network.public_subnet_id
  ssh_public_key   = var.ssh_public_key
  cloud_init_file  = var.cloud_init_file
  project_tags     = var.project_tags
}

module "governance" {
  source           = "./modules/governance"
  compartment_ocid = var.compartment_ocid
  project_tags     = var.project_tags
}

module "iam" {
  source           = "./modules/iam"
  compartment_ocid = var.compartment_ocid
}
