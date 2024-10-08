# module "bastion" {
#   source  = "git::https://github.com/Raidi13/terraform-aws-vpc.git?ref=main"

#   ami =data.aws_ami.joindevops.id
#   name = local.resource_name

#   instance_type          = "t3.micro"
#   vpc_security_group_ids = [local.bastion_sg_id]
#   subnet_id              = local.public_subnet_id

#   tags = merge(
#     var.common_tags,
#     var.bastion_tags,
#     {
#         # Name = local
#     }
#   )
   
#   }
# }

module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  ami = data.aws_ami.joindevops.id
  name = "${local.resource_name}-mysql"

  instance_type          = "t3.micro"
 vpc_security_group_ids = [local.mysql_sg_id]
  subnet_id              = local.public_subnet_id

  tags = merge (
    var.common_tags,
    var.mysql_tags,
    {
        Name = "${local.resource_name}-mysql"
    }
  )
   
}
module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  ami = data.aws_ami.joindevops.id
  name = "${local.resource_name}-backend"

  instance_type          = "t3.micro"
 vpc_security_group_ids = [local.backend_sg_id]
  subnet_id              = local.private_subnet_id

  tags = merge (
    var.common_tags,
    var.backend_tags,
    {
        Name = "${local.resource_name}-backend"
    }
  )
   
}
module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  ami = data.aws_ami.joindevops.id
  name = "${local.resource_name}-frontend"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.frontend_sg_id]
  subnet_id              = local.public_subnet_id

  tags = merge (
    var.common_tags,
    var.frontend_tags,
    {
        Name = "${local.resource_name}-frontend"
    }
  )
   
}