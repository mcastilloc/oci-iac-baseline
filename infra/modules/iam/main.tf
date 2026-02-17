
variable "compartment_ocid" { type = string }

# NOTE: IAM in Terraform for OCI uses policy text blocks. This is an example policy granting minimal operator access within the project compartment.

resource "oci_identity_dynamic_group" "operators_dg" {
  compartment_id = var.compartment_ocid
  description    = "Dynamic group for project operators (example)"
  matching_rule  = "ALL {instance.id = 'ocid1.instance.oc1..exampleuniqueID'}" # TODO: adjust or remove; placeholder only
  name           = "dg-project-operators"
}

# Example policy (placeholder). Replace with actual least-privilege statements.
resource "oci_identity_policy" "project_policy" {
  compartment_id = var.compartment_ocid
  name           = "policy-project-operators"
  description    = "Least-privilege policy for project operators"
  statements = [
    "Allow group Administrators to manage all-resources in compartment id ${var.compartment_ocid}",
    "Allow dynamic-group dg-project-operators to read all-resources in compartment id ${var.compartment_ocid}"
  ]
}
