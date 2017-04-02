variable "swarm_ami_id"         { }
variable "swarm_instance_type"  { }
variable "swarm_managers"       { }
variable "swarm_workers"        { }

resource "aws_security_group" "docker" {
  name    = "docker"
  vpc_id  = "${module.network.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 2377
    to_port   = 2377
    protocol  = "tcp"
    self      = true
  }
  ingress {
    from_port = 7946
    to_port   = 7946
    protocol  = "tcp"
    self      = true
  }
  ingress {
    from_port = 7946
    to_port   = 7946
    protocol  = "udp"
    self      = true
  }
  ingress {
    from_port = 4789
    to_port   = 4789
    protocol  = "tcp"
    self      = true
  }
  ingress {
    from_port = 4789
    to_port   = 4789
    protocol  = "udp"
    self      = true
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags { Name = "docker-sg" }
}

resource "aws_instance" "swarm-manager" {
  count                   = "${var.swarm_managers}"
  ami                     = "${var.swarm_ami_id}"
  availability_zone       = "${element(split(",", var.azs), count.index)}"
  instance_type           = "${var.swarm_instance_type}"
  key_name                = "pswarm"
  subnet_id               = "${element(split(",", module.network.public_subnet_ids), count.index)}"
  vpc_security_group_ids  = [ "${aws_security_group.docker.id}" ]

  connection        { user = "ubuntu" private_key = "${file("pswarm.pem")}" }
  root_block_device { volume_size = 20 }
  tags              { Name = "swarm-manager-${count.index}" }
}

resource "aws_instance" "swarm-worker" {
  count                   = "${var.swarm_workers}"
  ami                     = "${var.swarm_ami_id}"
  availability_zone       = "${element(split(",", var.azs), count.index)}"
  instance_type           = "${var.swarm_instance_type}"
  key_name                = "pswarm"
  subnet_id               = "${element(split(",", module.network.public_subnet_ids), count.index)}"
  vpc_security_group_ids  = [ "${aws_security_group.docker.id}" ]

  connection        { user = "ubuntu" private_key = "${file("pswarm.pem")}" }
  root_block_device { volume_size = 20 }
  tags              { Name = "swarm-worker-${count.index}" }
}

output "swarm_manager_public_ips"   { value = "${join(",", aws_instance.swarm-manager.*.public_ip)}" }
output "swarm_manager_private_ips"  { value = "${join(",", aws_instance.swarm-manager.*.private_ip)}" }
output "swarm_worker_public_ips"    { value = "${join(",", aws_instance.swarm-worker.*.public_ip)}" }
output "swarm_worker_private_ips"   { value = "${join(",", aws_instance.swarm-worker.*.private_ip)}" }
