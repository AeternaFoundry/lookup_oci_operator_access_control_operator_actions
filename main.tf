data "oci_operator_access_control_operator_actions" "operator_access_control_operator_actions_lookup" {
  for_each = var.operator_access_control_operator_actions_lookup

  compartment_id = each.value.compartment_id
  name           = each.value.name
  resource_type  = each.value.resource_type
  state          = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

