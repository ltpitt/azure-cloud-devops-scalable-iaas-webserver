variable "prefix" {
	description = "The prefix which should be used for all resources in this example"
	default = "prefix"
}

variable "location" {
	description = "The Azure Region in which all resources in this example should be created."
	default = "East US"
}

variable "username" {
	description = "The username which should be used for the admin account of the resources created in this example"
	default = "username"
}

variable "password" {
	description = "The password which should be used for the admin account of the resources created in this example"
	default = "!Password01"
}

variable "environment" {
	description = "The environment which should be used in this example"
	default = "test"
}

variable "virtual_machines_count" {
  description = "The number of virtual machines which should be used in this example"
  default = "2"
}

variable "packer_image_id" {
  description = "The ID for the image which will should be used in this example"
  default     = "/subscriptions/0f960931-a876-48d6-a2a6-895b88229aa6/resourceGroups/tagging-policy-rg/providers/Microsoft.Compute/images/myPackerImage"
}