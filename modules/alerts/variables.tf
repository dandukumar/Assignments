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
