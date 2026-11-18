
provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  description = "This is the type of instance we create"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "This is the AMI of the EC2"
  type        = string
}

variable "instance_name" {
  description = "This is the name of the EC2 instance"
  type        = string
  default     = "dev-instance"
}

variable "tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)

  default = {
    Environment = "dev"
    Project     = "terraform"
    Owner       = "admin"
  }
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
