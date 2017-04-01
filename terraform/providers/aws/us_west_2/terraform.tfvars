# us-west-2 variables
name            = "us-west-2"
artifact_type   = "amazon.image"
region          = "us-west-2"

# VPC
vpc_cidr        = "10.0.0.0/16"
azs             = "us-west-2a,us-west-2b,us-west-2c"
private_subnets = "10.0.1.0/24,10.0.2.0/24,10.0.3.0/24"
public_subnets  = "10.0.11.0/24,10.0.12.0/24,10.0.13.0/24"
