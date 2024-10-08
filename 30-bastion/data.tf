data "aws_ssm_parameter" "bastion_sg_id" {
    #/expense/dev/bastion_sg_id
  name = "/${var.project_name}/${var.enivronment}/bastion_sg_id"
}