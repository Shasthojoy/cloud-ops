variable "name"              { }
variable "artifact_type"     { }
variable "region"            { }

variable "vpc_cidr"         { }
variable "azs"              { }
variable "public_subnets"   { }

provider "aws" {
  region = "${var.region}"
}

module "network" {
  source = "../../../modules/aws/network"

  name            = "${var.name}"
  vpc_cidr        = "${var.vpc_cidr}"
  azs             = "${var.azs}"
  region          = "${var.region}"
  public_subnets  = "${var.public_subnets}"
}
