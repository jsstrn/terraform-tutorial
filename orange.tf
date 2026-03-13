module "my_first_instance" {
  source = "./modules/ec2-instance"
  name_prefix = "tutorial"
  instance_type = "t2.micro"
}

module "my_second_instance" {
  source = "./modules/ec2-instance"
  name_prefix = "jsrn"
  instance_type = "t3.micro"
}

module "my_third_instance" {
  source = "./modules/ec2-instance"
  name_prefix = "ce12"
  instance_type = "t3.micro"
}
