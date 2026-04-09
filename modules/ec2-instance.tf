#EC2 instance

resource "aws_instance" "my-ec2" {
  count           = var.instance_count
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.terra-key.key_name
  security_groups = [aws_security_group.pj-terra-sg.name]
  tags = {
    Name = "${var.my-env}-terra-automate"
  }

}


#Security Group
resource "aws_security_group" "pj-terra-sg" {
  name        = "${var.my-env}-sg"
  description = "This SG is to open Ports for EC2 Instance"
  vpc_id      = aws_default_vpc.default-vpc.id

  ingress {
    description = "This is for SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "This is for outgoing internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#key-pair
resource "aws_key_pair" "terra-key"  {
  key_name   = "pj-terra-key"
  public_key = file("C:/Users/Ratnesh Vansh Saxena/Desktop/Terraform/terra-key.pub")
}


#Default VPC
resource "aws_default_vpc" "default-vpc" {

}
