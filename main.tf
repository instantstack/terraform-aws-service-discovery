## Service Discovery
resource "aws_service_discovery_private_dns_namespace" "this" {
  name = var.name
  vpc  = var.vpc_id

  tags = var.tags
}

resource "aws_service_discovery_service" "this" {
  name = var.name

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.this.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }

  tags = var.tags
}
