provider "aws" {
  region = var.region
}

resource "aws_db_parameter_group" "params" {
  name   = var.name
  family = var.family
  
  dynamic "param" {
    for_each = [for p in var.params.list: {
      name = s.name
      value = s.value
      method = s.method
    }]

    parameter {
      name = param.value.name
      value = param.value.value
      apply_method = param.value.method
    }
  }
}