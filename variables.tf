variable "user_notification_rules" {
  description = <<EOT
Map of user_notification_rules, attributes below
Required:
    - start_delay_in_minutes
    - urgency
    - user_id
Optional:
    - contact_method (block):
        - id (required)
        - type (required)
EOT

  type = map(object({
    start_delay_in_minutes = number
    urgency                = string
    user_id                = string
    contact_method = optional(list(object({
      id   = string
      type = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.user_notification_rules : (
        contains(["high", "low"], v.urgency)
      )
    ])
    error_message = "must be one of: \"high\", \"low\""
  }
  validation {
    condition = alltrue([
      for k, v in var.user_notification_rules : (
        v.contact_method == null || alltrue([for item in v.contact_method : (contains(["email_contact_method", "phone_contact_method", "push_notification_contact_method", "sms_contact_method", "whatsapp_contact_method"], item.type))])
      )
    ])
    error_message = "must be one of: \"email_contact_method\", \"phone_contact_method\", \"push_notification_contact_method\", \"sms_contact_method\", \"whatsapp_contact_method\""
  }
}

