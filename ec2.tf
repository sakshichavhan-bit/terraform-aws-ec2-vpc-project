resource "aws_instance" "jenkin" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.my-sgroup.id]
  associate_public_ip_address = true
  tags = {
    Name = "jenkins"
  }
}