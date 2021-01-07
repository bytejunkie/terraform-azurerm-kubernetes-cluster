variable "name_separator" {
  description = "the character to use to separate the strings used to build the name - override with empty string if none required"
  type        = string
  default     = "-"
}

variable "name_strings" {
  description = "a list of strings to concatenate into a name - useful when templating a naming convention"
  type        = list(string)
}

variable "location" {
  description = "the character to use to separate the strings used to build the name - override with empty string if none required"
  type        = string
}

variable "resource_group_name" {
  description = "the name of the resource group to place the resource in"
  type        = string
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A map of tags to assign to the resource."
  default     = {}
}
