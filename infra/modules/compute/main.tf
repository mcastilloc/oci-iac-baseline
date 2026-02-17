
variable "compartment_ocid" { type = string }
variable "subnet_id" { type = string }
variable "ssh_public_key" { type = string }
variable "cloud_init_file" { type = string }
variable "project_tags" { type = map(string) }

# NOTE: For image selection, consider using a data source filtered by shape/OS.
# This is a minimal example using an explicit image OCID or latest by shape-region.
# Replace the following with a proper data lookup as needed.

resource "oci_core_instance" "vm" {
  availability_domain = 1
  compartment_id      = var.compartment_ocid
  display_name        = "baseline-vm"
  shape               = "VM.Standard.A1.Flex" # Free Tier ARM shape, adjust if needed

  shape_config {
    ocpus = 1
    memory_in_gbs = 1
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = base64encode(file(var.cloud_init_file))
  }

  freeform_tags = var.project_tags
}

output "public_ip" {
  value = oci_core_instance.vm.public_ip
}
