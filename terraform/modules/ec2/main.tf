resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  tags = {
    Name = "web-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  associate_public_ip_address = true
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

