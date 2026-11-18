
provider "aws" {
    region = "us-east-1"
}

variable "ami" {
  description = "this is ami"

}
variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "prod" = "t2.large"
    "stage" = "t2.small"
}
}
module "ec2-instance" {
    source = "./modules/ec2-instance"
    ami = var.ami
    instance_type = var.instance_type
}
