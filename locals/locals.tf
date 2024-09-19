locals {
#   environment = "dev"
  instance_type = var.environment == "dev" ? "t2.micro" : "t3.nano"
  from_port = 22
  to_port = 22
}
