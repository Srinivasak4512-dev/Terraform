variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is the AMi ID of DevOps-Practice which is RHEL"
}


variable "instance_type" {
    type = string
    default = "t3.micro"
}


variable "tags" {
  type  = map #optional
  default = {
      Name = "backend"
      Project = "expense"
      Component = "backend"
      Environment = "Dev"
      Terraform = "true"
  }
  }


variable "sg_name" {
  default = "allow_sshh"
}


variable "sg_description" {
  default = "Allow port number 22 for SSH access"
}

variable "from_port" {
  default = 22
  type = number
}

variable "to_port" {
  default = 22
  type = number
}

variable "protocol" {
  default = "tcp"
}

variable "ingress_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
