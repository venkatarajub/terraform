output public_ip {
  value       = aws_instance.terraform.public_ip
  sensitive   = false
  description = "this is the  public ip of  terraform instance"
  }
