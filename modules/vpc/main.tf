resource "aws_vpc" "example_class_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "example_security_group" {
  vpc_id = aws_vpc.example_class_vpc.id

  // Regla de egreso para permitir todo el tráfico
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Regla de ingreso para permitir todo el tráfico
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform Security Group"
  }

  depends_on = [aws_vpc.example_class_vpc]
}

resource "aws_subnet" "example_class_subnet" {
  vpc_id            = aws_vpc.example_class_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  depends_on = [aws_vpc.example_class_vpc]
}

output "subnet_id" {
  value = aws_subnet.example_class_subnet.id
}