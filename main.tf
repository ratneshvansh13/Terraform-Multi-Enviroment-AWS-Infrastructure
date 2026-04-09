module "dev-app" {
  source         = "./modules/"
  my-env         = "dev"
  instance_type  = "t2.micro"
  ami_id         = "ami-051de6a4e7ae45f77"
  instance_count = 1
}
module "stg-app" {
  source         = "./modules"
  my-env         = "stg"
  instance_type  = "t2.small"
  ami_id         = "ami-051de6a4e7ae45f77"
  instance_count = 2
}
module "prd-app" {
  source         = "./modules"
  my-env         = "prd"
  instance_type  = "t2.small"
  ami_id         = "ami-051de6a4e7ae45f77"
  instance_count = 3
}
