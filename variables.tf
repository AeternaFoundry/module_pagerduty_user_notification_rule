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
}

