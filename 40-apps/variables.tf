variable "project_name" {
  default     = "expense"
}
variable "enivronment"{
    default   = "dev"
}

variable "common_tags"{
    default = {
        project     = "expense"
        terraform   = "true"
        enivronment = "dev"
    }
}

variable "mysql_tags" {
  default = {
    component = "mysql"
  }
}
variable "backend_tags" {
  default = {
    component = "backend"
  }
}

variable "frontend_tags" {
  default = {
    component = "frontend"
  }
}
variable "ansible_tags" {
  default = {
    component = "ansible"
  }
}


