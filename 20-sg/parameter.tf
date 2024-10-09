resource "aws_ssm_parameter" "mysql_sg_id" {
  ## /expense/dev/mysql_sg_id
  name  = "/${var.project_name}/${var.enivronment}/mysql_sg_id"
  type  = "String"
  value = module.mysql_sg.id
}
resource "aws_ssm_parameter" "backend_sg_id" {
  ## /expense/dev/mysql_sg_id
  name  = "/${var.project_name}/${var.enivronment}/backend_sg_id"
  type  = "String"
  value = module.backend_sg.id
}
resource "aws_ssm_parameter" "frontend_sg_id" {
  ## /expense/dev/mysql_sg_id
  name  = "/${var.project_name}/${var.enivronment}/frontend_sg_id"
  type  = "String"
  value = module.frontend_sg.id
}
resource "aws_ssm_parameter" "bastion_sg_id" {
  ## /expense/dev/mysql_sg_id
  name  = "/${var.project_name}/${var.enivronment}/bastion_sg_id"
  type  = "String"
  value = module.bastion_sg.id
}
resource "aws_ssm_parameter" "ansible_sg_id" {
  ## /expense/dev/mysql_sg_id
  name  = "/${var.project_name}/${var.enivronment}/ansible_sg_id"
  type  = "String"
  value = module.ansible_sg.id
}