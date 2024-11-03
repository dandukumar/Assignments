# modules/alert/main.tf
variable "name" {
  description = "Name of the alert rule"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the alert rule"
  type        = string
}

variable "target_resource_id" {
  description = "The resource ID of the target resource to monitor"
  type        = string
}

variable "metric_name" {
  description = "The metric name for the alert (e.g., 'Percentage CPU')"
  type        = string
}

variable "operator" {
  description = "The operator to evaluate (e.g., GreaterThan, LessThan)"
  type        = string
}

variable "threshold" {
  description = "The threshold value for the alert"
  type        = number
}

variable "frequency" {
  description = "Frequency in minutes for evaluating the alert rule"
  type        = number
  default     = 5
}

# variable "alert_action_group_ids" {
#   description = "List of action group IDs to notify"
#   type        = list(string)
#   default     = []
# }

resource "azurerm_monitor_metric_alert" "metric_alert" {
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = [var.target_resource_id]
  description         = "Alert for ${var.metric_name}"
  severity            = 3
  #evaluation_frequency = "${var.frequency}m"
  #window_size = "${var.frequency}m"
  #window_size = var.frequency 

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines" # Adjust based on resource type
    metric_name      = var.metric_name
    aggregation      = "Average" # <- Required attribute
    operator         = var.operator
    threshold        = var.threshold
  }

  # action {
  #   action_group_id = var.alert_action_group_ids
  # }
  #action_group_id = var.alert_action_group_ids[0]

}
