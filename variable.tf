# variables.tf

variable "region" {
  description = "AWS region where the resources will be deployed"
  type        = string
  default     = "us-east-1" 
}


variable "script_name" {
  description = "Name of the script to run after task creation"
  type        = string
  default     = "push_image.sh"
}
