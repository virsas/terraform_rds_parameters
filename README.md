# terraform_rds_parameters

Terraform module to create rds parameters' group.

## Dependencies

None 

## Terraform example

``` terraform
###################
# RDS params variable
###################
variable "aurora-mysql57-params" { 
  default = { 
    params = [
      { name = "max_connections", value = "1024", method = "pending-reboot" },
      { name = "character_set_client", value = "utf8mb4", method = "pending-reboot" }
    ]
  }
}

###################
# RDS params module
###################
module "rds_aurora57_params" {
  source = "./modules/rds_aurora_params"
  name   = "aurora57-params"
  family = "aurora-mysql5.7"
  params = var.aurora-mysql57-params
}
```
