variable "number_of_users" {
  description = "Number of IAM users to create"
  type = number
}

variable "user_name" {
  description = "Base name of IAM users"
  type = list(string)
}

