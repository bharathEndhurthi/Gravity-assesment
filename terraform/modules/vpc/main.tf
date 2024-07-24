resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "main-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

