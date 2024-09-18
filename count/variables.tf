variable "instance_name" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    type = map
    default = {
        project = "expense"
        environment = "dev"
        terraform = "true"
    }
}

