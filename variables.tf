
variable "list_sg" {
  type        = list(string)
  default     = []
  description = "(optional) describe your variable"
}

variable "name" {
  type        = string
  default     = "SG-padrao"
  description = "(optional) describe your variable"
}

variable "enable_sg" {
  type        = bool
  default     = false
  description = "(optional) describe your variable"
}