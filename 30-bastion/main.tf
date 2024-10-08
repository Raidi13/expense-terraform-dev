module "bastion" {
  source  = "git::https://github.com/Raidi13/terraform-aws-vpc.git?ref=main"

  name = local.resource_name

  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}