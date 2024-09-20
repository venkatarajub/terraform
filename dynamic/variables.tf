variable "ingress_rules" {
    default = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "open 22"

        },
        {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "open 8080" 
        },
        {
            from_port = 3306
            to_port = 3306
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "open 3306"
        }
    ]
}