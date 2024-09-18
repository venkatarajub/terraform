variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"] 
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable "envorinment" {
    default = "dev"
}

variable "commam_tags" {
    default =  {
        project = "expense"
        terraform = true
    }
}

variable "zone_id" {
    default = "Z045465338QE67HP0ONIN"
}

variable "domain_name" {
    default =  "vensa.online"
}