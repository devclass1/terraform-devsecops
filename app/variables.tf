variable "prefix" {
  type        = string
  default = "aem-lab"
  description = "The prefix used for all resources in this example"
}

variable "location" {
  type        = string
  default = "East US 2"
  description = "The Azure location where all resources in this example should be created"
}
