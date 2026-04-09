variable "my-env" {
    description = "This is teh enviroment for infra"
    type = string
  
}

variable "ami_id" {
    description = "this is the AMI ID for EC2"
    type = string  
}

variable "instance_type" {
    description = "This is the type of Instance for ec2"
    type = string
}
variable "instance_count" {
    description = "This is the number of instances for ec2"
    type = number
}