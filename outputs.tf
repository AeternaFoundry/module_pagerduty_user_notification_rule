output "user_notification_rules_id" {
  description = "Map of id values across all user_notification_rules, keyed the same as var.user_notification_rules"
  value       = { for k, v in pagerduty_user_notification_rule.user_notification_rules : k => v.id }
}
output "user_notification_rules_contact_method" {
  description = "Map of contact_method values across all user_notification_rules, keyed the same as var.user_notification_rules"
  value       = { for k, v in pagerduty_user_notification_rule.user_notification_rules : k => v.contact_method }
}
output "user_notification_rules_start_delay_in_minutes" {
  description = "Map of start_delay_in_minutes values across all user_notification_rules, keyed the same as var.user_notification_rules"
  value       = { for k, v in pagerduty_user_notification_rule.user_notification_rules : k => v.start_delay_in_minutes }
}
output "user_notification_rules_urgency" {
  description = "Map of urgency values across all user_notification_rules, keyed the same as var.user_notification_rules"
  value       = { for k, v in pagerduty_user_notification_rule.user_notification_rules : k => v.urgency }
}
output "user_notification_rules_user_id" {
  description = "Map of user_id values across all user_notification_rules, keyed the same as var.user_notification_rules"
  value       = { for k, v in pagerduty_user_notification_rule.user_notification_rules : k => v.user_id }
}

