variable "instance_name" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    type = map
    default = {
        project = "expense"
        environment = "dev"
        terraform = "true"
    }
}

