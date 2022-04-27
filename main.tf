provider "aws" {
  region = var.region
}

resource "aws_db_parameter_group" "params" {
  name   = var.name
  family = var.family
  
  dynamic "attribute" {
    for_each = [for p in var.params.list: {
      name = p.name
      value = p.value
      method = p.method
    }]

    parameter {
      name = attribute.value.name
      value = attribute.value.value
      apply_method = attribute.value.method
    }
  }
}