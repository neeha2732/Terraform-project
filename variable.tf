# variables.tf

# VPC
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

# Subnets
variable "pub_sub_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "pub_sub_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "pvt_sub_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "pvt_sub_name" {
  description = "Name of the private subnet"
  type        = string
}

# Route Table
variable "Route_table_cidr" {
  description = "CIDR block for the route table"
  type        = string
}

variable "pub_rt" {
  description = "Name of the public route table"
  type        = string
}

variable "pvt_rt" {
  description = "Name of the private route table"
  type        = string
}

# Internet Gateway
variable "pub_igw" {
  description = "Name of the public internet gateway"
  type        = string
}

# NAT Gateway
variable "nat_Eastic_Ip" {
  description = "Name for the NAT Elastic IP"
  type        = string
}

variable "pvt_nat" {
  description = "Name of the NAT gateway"
  type        = string
}

# Security Group
variable "Sec_Group" {
  description = "Name of the security group"
  type        = string
}

# EC2 Instances
variable "ami_id" {
  description = "AMI ID to use for instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "pub_instance_name" {
  description = "Name of the public instance"
  type        = string
}

variable "pvt_instance_name" {
  description = "Name of the private instance"
  type        = string
}

# SSH Key
variable "key_name_ssh" {
  description = "Name of the SSH key pair"
  type        = string
}
