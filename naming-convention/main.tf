module "name-formater" {
  source = "./modules/name-formater"
  environment = var.environment
  resource_type = var.resource
  custom_suffix = var.custom_suffix
}