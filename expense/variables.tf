variable "instance_name" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable environment {
    default = "dev"
}

variable "common_tags" {
    default = {
        project = "expense"
        terraform = "true"
    }
}

variable "zone_id" {
    default = "Z045465338QE67HP0ONIN"
}

variable "domain_name" {
    default = "vensa.online"
}