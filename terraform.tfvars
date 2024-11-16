# terraform.tfvars

vpc_cidr_block      = "10.0.0.0/16"
vpc_name            = "demo-vpc"

pub_sub_cidr        = "10.0.1.0/24"
pub_sub_name        = "demo-public-subnet"
pvt_sub_cidr        = "10.0.2.0/24"
pvt_sub_name        = "demo-private-subnet"

Route_table_cidr    = "0.0.0.0/0"
pub_rt              = "demo-public-RT"
pvt_rt              = "demo-private-RT"

pub_igw             = "demo-igw"
nat_Eastic_Ip       = "demo-nat-eip"
pvt_nat             = "demo-nat-gateway"

Sec_Group           = "demo-ec2-sg"

ami_id              = "ami-017095afb82994ac7"
instance_type       = "t2.micro"
pub_instance_name   = "demo-public-instance"
pvt_instance_name   = "demo-private-instance"

key_name_ssh          = "neeha2"
