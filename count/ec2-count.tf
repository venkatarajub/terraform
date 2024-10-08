resource "aws_instance" "terraform" {
    count = length(var.instance_name)
    ami = var.ami_id
    instance_type = var.environment == "dev" ? "t2.micro" : "t3.nano"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    # tags = {
    #     Name = var.instance_name[count.index]
    # }
    #by merging tags wecan pass common tags and secific  tags
    tags = merge(
        var.common_tags, 
        {
           Name = var.instance_name[count.index]
        }
    )
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_sssh"
    description =  "allow ssh on port number 22"

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
   tags = merge(
    var.common_tags,
    {
        Name = "allow sshh"
    }
   )
        
}

