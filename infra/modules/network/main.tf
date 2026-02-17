
variable "compartment_ocid" { type = string }
variable "region" { type = string }
variable "project_tags" { type = map(string) }

# VCN
resource "oci_core_vcn" "this" {
  cidr_block     = "10.10.0.0/16"
  compartment_id = var.compartment_ocid
  display_name   = "vcn-baseline"
  freeform_tags  = var.project_tags
}

# Internet Gateway
resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.this.id
  display_name   = "igw-baseline"
  is_enabled     = true
  freeform_tags  = var.project_tags
}

# Route Table
resource "oci_core_route_table" "public" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.this.id
  display_name   = "rt-public"
  route_rules {
    network_entity_id = oci_core_internet_gateway.igw.id
    destination       = "0.0.0.0/0"
  }
  freeform_tags = var.project_tags
}

# Subnets
resource "oci_core_subnet" "public" {
  cidr_block                 = "10.10.1.0/24"
  compartment_id            = var.compartment_ocid
  vcn_id                    = oci_core_vcn.this.id
  display_name              = "subnet-public"
  prohibit_public_ip_on_vnic = false
  route_table_id            = oci_core_route_table.public.id
  freeform_tags             = var.project_tags
}

resource "oci_core_subnet" "private" {
  cidr_block                 = "10.10.2.0/24"
  compartment_id            = var.compartment_ocid
  vcn_id                    = oci_core_vcn.this.id
  display_name              = "subnet-private"
  prohibit_public_ip_on_vnic = true
  freeform_tags             = var.project_tags
}

output "public_subnet_id" { value = oci_core_subnet.public.id }
