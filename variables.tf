variable "name" {
  type        = string
  description = "description"
}

variable "vpc_id" {
  type        = string
  description = "description"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "description"
}