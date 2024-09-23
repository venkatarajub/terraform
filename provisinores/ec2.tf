resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = "terraform"
    }
    provisioner "local-exec" {
        command = "echo The server's IP address is ${self.public_ip} > public_ip.txt "
    }
    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
  provisioner "remote-exec" {
    when =  destroy
    inline = [
        "sudo systemctl stop nginx"
    ]
  }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allow ssh on port no 22"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #for_each =  var.ingress_rules
    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = ingress.value ["from_port"]
            to_port = ingress.value ["to_port"]
            protocol = ingress.value ["protocol"]
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
    tags = {
        Name = "t_allow_ssh"
    }

}