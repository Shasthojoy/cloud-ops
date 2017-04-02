# us-west-2 variables
name            = "us-west-2"
artifact_type   = "amazon.image"
region          = "us-west-2"

# VPC
azs             = "us-west-2a,us-west-2b,us-west-2c"
private_subnets = "10.0.1.0/24,10.0.2.0/24,10.0.3.0/24"
public_subnets  = "10.0.11.0/24,10.0.12.0/24,10.0.13.0/24"
vpc_cidr        = "10.0.0.0/16"

# Docker Swarm
swarm_ami_id        = "ami-a4e97ec4"
swarm_instance_type = "t2.micro"
swarm_managers      = 3
swarm_workers       = 2
