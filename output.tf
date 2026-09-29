output "instance_public_ip" {
  value       = aws_instance.jenkin.public_ip
  description = "public IP of the ec2 instance"
  
}