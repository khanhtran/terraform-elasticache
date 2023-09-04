resource "aws_security_group" "default" {
  name_prefix = "${var.namespace}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.namespace}-cache-subnet"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = "${var.cluster_id}"
  description = "test redis cluster"
  node_type            = "cache.t3.micro"
  port                 = 6379
  snapshot_retention_limit = 5
  snapshot_window          = "00:00-05:00"
  subnet_group_name          = "${aws_elasticache_subnet_group.default.name}"
  automatic_failover_enabled = false
  transit_encryption_enabled = true
  num_node_groups         = 1
  security_group_ids   = [aws_security_group.default.id]
}

# resource "aws_elasticache_cluster" "example" {
#   cluster_id           = "cluster-example"
#   engine               = "redis"
#   node_type            = "cache.t3.micro"
#   num_cache_nodes      = 2
#   # parameter_group_name = "default.redis3.2"
#   # engine_version       = "3.2.10"
#   port                 = 6379
#   security_group_ids   = [aws_security_group.default.id]
#   subnet_group_name    = "${aws_elasticache_subnet_group.default.name}"
# }