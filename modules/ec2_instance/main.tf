resource "aws_instance" "class_example_server" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "First-Ec2-With-Terraform"
    User = "ec2-user"
  }

  associate_public_ip_address = true
}

output "general_data" {
  value = {
    public_ip         = aws_instance.class_example_server.public_ip
    instance_host     = aws_instance.class_example_server.public_dns
    instance_key_name = aws_instance.class_example_server.key_name
    password          = aws_instance.class_example_server.password_data
  }
}
