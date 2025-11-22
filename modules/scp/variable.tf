variable "name" {
	description = "Name of the Service Control Policy"
	type        = string
}

variable "description" {
	description = "Description for the SCP"
	type        = string
	default     = ""
}

variable "content" {
	description = "The JSON policy content for the SCP (string). Use jsonencode or file() when calling the module."
	type        = string
}

variable "targets" {
	description = "List of Organization target ids (root, ou-*, account ids) to attach the policy to"
	type        = list(string)
	default     = []
}

variable "tags" {
	description = "Tags to add to the policy"
	type        = map(string)
	default     = {}
}
