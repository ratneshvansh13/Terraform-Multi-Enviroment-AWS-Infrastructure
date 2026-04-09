output "instance_ids" {
    value = aws_instance.my-ec2[*].id
  
}