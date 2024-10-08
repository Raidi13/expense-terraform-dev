locals {
    resource_name = "${var.project_name}-${var.enivronment}-bastion"
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
}