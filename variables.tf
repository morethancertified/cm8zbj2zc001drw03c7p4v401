# Project variables
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "terraform-lab"
}

# Network variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = map(string)
  default = {
    "subnet1" = "10.0.1.0/24",
    "subnet2" = "10.0.2.0/24"
  }
}

variable "availability_zones" {
  description = "Availability zones for the subnets"
  type        = map(string)
  default = {
    "subnet1" = "us-east-1a",
    "subnet2" = "us-east-1b"
  }
}

# Compute variables
variable "instances" {
  description = "Map of EC2 instance configurations"
  type        = map(string)
  default = {
    "instance1" = "subnet1",
    "instance2" = "subnet2"
  }
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}