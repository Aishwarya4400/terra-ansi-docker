variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
 default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
 default = "mykey.pub"
}
variable "AMIS" {
 type = map(string)
 default = {
 ap-south-1 = "ami-04bde106886a53080"
}
}
variable "subnet_id"{
default = "subnet-0d2ff1d62cba951ef"
}
variable "vpc_id"{
default = "vpc-0f85aafcb3fb5068d"
}
