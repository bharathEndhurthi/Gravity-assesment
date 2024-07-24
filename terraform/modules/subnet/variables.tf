variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "private_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnets"
  type        = string
}

