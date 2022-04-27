provider "aws" {
  region = var.region
}

resource "aws_db_parameter_group" "params" {
  name   = var.name
  family = var.family
  
  dynamic "parameter" {
    for_each = [for p in var.params.list: {
      name = p.name
      value = p.value
      method = p.method
    }]

    content {
      name = parameter.value.name
      value = parameter.value.value
      apply_method = parameter.value.method
    }
  }
}