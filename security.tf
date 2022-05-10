resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "${local.worker_group}_mgmt_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8"
    ]
  }
}

resource "aws_security_group" "worker_group_mgmt_two" {
  name_prefix = "${local.worker_group}_mgmt_two"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8"
    ]
  }
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_${local.worker_group}_mgmt"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8"
    ]
  }
}