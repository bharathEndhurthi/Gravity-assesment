provider "aws" {
  region = "us-west-2" # Change to your desired region
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  public_cidr_block = "10.0.1.0/24"
  private_cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2a"
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.subnet.public_subnet_id
  security_group_id = module.security_group.security_group_id
  ami = "ami-0c55b159cbfafe1f0" # Change to your desired AMI
}

output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}

