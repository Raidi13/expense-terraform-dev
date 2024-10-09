data "aws_ssm_parameter" "mysql_sg_id" {
    #/expense/dev/bastion_sg_id
  name = "/${var.project_name}/${var.enivronment}/mysql_sg_id"
}
data "aws_ssm_parameter" "backend_sg_id" {
    
  name = "/${var.project_name}/${var.enivronment}/backend_sg_id"
}

data "aws_ssm_parameter" "frontend_sg_id" {
    #/expense/dev/frontend_sg_id
  name = "/${var.project_name}/${var.enivronment}/frontend_sg_id"
}

data "aws_ssm_parameter" "ansible_sg_id" {
    #/expense/dev/frontend_sg_id
  name = "/${var.project_name}/${var.enivronment}/ansible_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
   
  name = "/${var.project_name}/${var.enivronment}/public_subnet_ids"
}

data "aws_ssm_parameter" "private_subnet_ids" {
    #/expense/dev/public_subnet_ids
  name = "/${var.project_name}/${var.enivronment}/private_subnet_ids"

}

data "aws_ssm_parameter" "database_subnet_ids" {
   
  name = "/${var.project_name}/${var.enivronment}/database_subnet_ids"
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
