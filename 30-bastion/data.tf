data "aws_ssm_parameter" "bastion_sg_id" {
    #/expense/dev/bastion_sg_id
  name = "/${var.project_name}/${var.enivronment}/bastion_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
    #/expense/dev/public_subnet_ids
  name = "/${var.project_name}/${var.enivronment}/public_subnet_ids"
}

data "aws_ami" "joindevops" {
  most_recent = true
    owners = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "Root device type"
    values = ["EBS"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
