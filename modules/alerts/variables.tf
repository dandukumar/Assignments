# variable "resource_group_name" {
#   type        = string
#   description = "Name of the resource group"
# }

# variable "target_resource_id" {
#   type        = string
#   description = "Resource ID for the target resource to monitor"
# }

variable "alert_action_group_ids" {
  type        = list(string)
  description = "Action group IDs for alert notifications"
  default     = []
}
# variable "alert_action_group_ids" {
#   description = "List of Action Group IDs for alerts."
#   type        = list(string)
# }
# In your variables.tf for the alerts module
# variable "frequency1" {
#   description = "The frequency for the metric alert, in ISO 8601 format."
#   type        = string
#   validation {
#     condition     = contains(["PT1M", "PT5M", "PT15M", "PT30M", "PT1H", "PT6H", "PT12H", "P1D"], var.frequency1)
#     error_message = "The frequency must be one of: PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H, or P1D."
#   }
# }
