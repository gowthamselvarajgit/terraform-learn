locals {
  sanitized_resource_type = replace(lower(var.resource_type), " ","-")

  base_name = format("%s-%s", lower(var.environment), local.sanitized_resource_type)

  final_name = var.custom_suffix != "" ? format("%s-%s",local.base_name, var.custom_suffix) : local.base_name
}