variable "prefix" {
	description = "The prefix which should be used for all resources in this example"
}

variable "location" {
	description = "The Azure Region in which all resources in this example should be creted."
	default = "Ease US"
}

variable "username" {
	description = "The username which should be used for the admin account of the resources created in this example"
}

variable "password" {
	description = "The password which should be used for the admin account of the resources created in this example"
}