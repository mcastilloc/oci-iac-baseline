
variable "compartment_ocid" { type = string }
variable "project_tags" { type = map(string) }

# Budget (example) — adjust amount and thresholds
resource "oci_budget_budget" "project" {
  compartment_id = var.compartment_ocid
  target_type    = "COMPARTMENT"
  targets        = [var.compartment_ocid]
  amount         = 5
  reset_period   = "MONTHLY"
  display_name   = "budget-baseline"
  freeform_tags  = var.project_tags
}

resource "oci_budget_alert_rule" "warn80" {
  budget_id     = oci_budget_budget.project.id
  display_name  = "warn-80"
  type          = "ACTUAL"
  threshold     = 80
  threshold_type = "PERCENTAGE"
  message       = "Budget usage over 80%"
  recipients    = "owner@example.com" # TODO: replace with your email or notification service
  description   = "Warn when usage exceeds 80%"
}
