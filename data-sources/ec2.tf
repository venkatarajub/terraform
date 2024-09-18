resource "aws_instance" "expense" {
    ami =  data.aws_ami.joindevops.id
    instance_type = "t2.micro"
    #allow_all security id provided here  without creating new  SG
    vpc_security_group_ids = ["sg-0bb5c6e23141d9743"]
}