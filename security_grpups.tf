resource "aws_security_group" "my-sgroup" {
  vpc_id = aws_vpc.my-vpc.id

  #Inboud rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outboud rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # (-) means all protocol is allowd
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-sg"
  }

}