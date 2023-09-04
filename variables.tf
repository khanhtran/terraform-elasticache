variable "vpc_cidr_block" {
  description = "The top-level CIDR block for the VPC."
  default     = "10.1.0.0/16"
}

variable "cidr_blocks" {
  description = "The CIDR blocks to create the workstations in."
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "namespace" {
  description = "Default namespace"
  default = "khanh"
}

variable "cluster_id" {
  description = "Id to assign the new cluster"
}

variable "node_groups" {
  description = "Number of nodes groups to create in the cluster"
  default     = 1
}

variable "vpc_id" {
  description = "VPC id"
  default     = "vpc-0bf95010f1cd5f60a"
}

variable subnet_ids {
  type        = list(string)
  description = "subnet ids"
  default     = ["subnet-0488f2b2afec8e5a2"]
}