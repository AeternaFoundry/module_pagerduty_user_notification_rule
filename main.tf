resource "pagerduty_user_notification_rule" "user_notification_rules" {
  for_each = var.user_notification_rules

  start_delay_in_minutes = each.value.start_delay_in_minutes
  urgency                = each.value.urgency
  user_id                = each.value.user_id

  dynamic "contact_method" {
    for_each = each.value.contact_method != null ? each.value.contact_method : []
    content {
      id   = contact_method.value.id
      type = contact_method.value.type
    }
  }
}

