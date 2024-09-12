variable name {
  type        = string
  default     = "allow_ssh"
  }


variable description {
    default = "allow ssh on port number 22"
}

variable from_port {
    type  = number
    default = 22
}

variable to_port {
    type = number
    default = 22
}

variable ami_id {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable instance_type {
    type = string
    default = "t2.micro"
}

variable tags {
    type = map
    default = {
        Name  = "backend"
        project = "expense"
        component = "backend"
        envorinment = "DEV"
    }
}