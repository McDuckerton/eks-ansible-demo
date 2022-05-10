output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "db_subnet_group_name" {
  value = module.vpc.database_subnet_group_name
}

output "db_endpoint_address" {
  value = aws_db_instance.awx_db.endpoint
}