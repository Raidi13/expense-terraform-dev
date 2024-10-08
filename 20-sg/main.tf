module "mysql_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  enivronment =  var.enivronment
  sg_name = "mysql"
  vpc_id = local.vpc_id
  common_tags = var.common_tags
  sg_tags = var.mysql_sg_tags

}
module "backend_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  enivronment =  var.enivronment
  sg_name = "backend"
  vpc_id = local.vpc_id
  common_tags = var.common_tags
  sg_tags = var.backend_sg_tags

}
module "frontend_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  enivronment =  var.enivronment
  sg_name = "frontend"
  vpc_id = local.vpc_id
  common_tags = var.common_tags
  sg_tags = var.frontend_sg_tags

}  
module "bastion_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  enivronment =  var.enivronment
  sg_name = "bastion"
  vpc_id = local.vpc_id
  common_tags = var.common_tags
  sg_tags = var.bastion_sg_tags

}  

#mysql allowing connections on 3306 from the instance attached to backend SG
resource "aws_security_group_rule" "mysql-backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id   = module.backend_sg.id
  security_group_id = module.mysql_sg.id
}
resource "aws_security_group_rule" "backend-frontend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id   = module.frontend_sg.id
  security_group_id = module.backend_sg.id
}
resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_sg.id
}

resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id   = module.bastion_sg.id
  security_group_id = module.mysql_sg.id
}
resource "aws_security_group_rule" "backend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id   = module.bastion_sg.id
  security_group_id = module.backend_sg.id
}
resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id   = module.bastion_sg.id
  security_group_id = module.frontend_sg.id
}