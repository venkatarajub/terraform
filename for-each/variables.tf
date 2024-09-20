variable "instances" {
    type = map
    default = {
        mysql = "t2.micro"
        backend  = "t2.micro"
        frontend = "t2.micro"
    }
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable "zone_id" {
    default = "Z045465338QE67HP0ONIN"
}

variable "domain" {
    default = "vensa.online"
}