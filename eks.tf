module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.21"


  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # self_managed_node_groups = {
  #   one = {
  #     name         = "mixed-1"
  #     max_size     = 5
  #     desired_size = 2

  #     instance_type = "t3a.xlarge"

  #     user_mixed_instances_policy = true
  #     mixed_instances_policy = {
  #       instance_distribution = {
  #         on_demand_base_capacity                  = 0
  #         on_demand_percentage_above_base_capacity = 10
  #         spot_allocation_strategy                 = "capacity-optimized"
  #       }

  #       override = [
  #         {
  #           instance_type     = "t3a.xlarge"
  #           weighted_capacity = "1"
  #         }
  #       ]
  #     }

  #     tags = {
  #       "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  #     }
  #   }
  # }

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size      = 50
    instance_types = ["t3a.xlarge"]
  }

  eks_managed_node_groups = {
    eks_group_1 = {
      min_size     = 1
      max_size     = 10
      desired_size = 2

      instance_types = ["t3a.xlarge"]
      capacity_type  = "ON_DEMAND"
    }
  }

  create_aws_auth_configmap = false
  manage_aws_auth_configmap = true

  aws_auth_users = [
    {
      "groups" : [
        "system:masters"
      ],
      "userarn" : "arn:aws:iam::208150260265:user/chris",
      "username" : "chris"
    },
    {
      "groups" : [
        "system:masters"
      ],
      "userarn" : "arn:aws:iam::208150260265:user/iac",
      "username" : "iac"
    }
  ]

  tags = {
    Name = local.cluster_name
    Env  = local.env
  }
}