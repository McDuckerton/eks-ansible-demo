locals {
  cluster_name = "eks-demo-cluster-${terraform.workspace}"
  worker_group = "worker-group-${terraform.workspace}"
  vpc_name     = "eks-demo-${terraform.workspace}"
  env          = terraform.workspace
}