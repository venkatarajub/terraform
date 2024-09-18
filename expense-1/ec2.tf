resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = var.ami_id
    instance_type = var.envorinment == "dev" ?  "t2.micro" : "t3.nano"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = merge(
        var.commam_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allow ssh on port number 22"
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_ssh_e"
  }
}