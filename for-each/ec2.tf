resource "aws_instance" "expense" {
    for_each = var.instances
    ami = var.ami_id
    #for mysql t3.nano others t2.micro
    instance_type = each.value
    vpc_security_group_ids =  [aws_security_group.allow_ssh.id]

    tags = {
        Name = each.key
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allow assh on port no 22"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "t_allow_ssh"
    }
}