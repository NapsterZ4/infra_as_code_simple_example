module "vpc" {
  source = "../../modules/vpc"
}

module "class_example_server" {
  source = "../../modules/ec2_instance"
  ami    = "ami-0d7a109bf30624c99"
  instance_type = "t2.micro"
  subnet_id = module.vpc.subnet_id

  depends_on = [module.vpc]
}
