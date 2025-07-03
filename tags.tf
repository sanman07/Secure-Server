# Define common tags for all resources
locals {
  common_tags = {
    Environment     = "production"
    Project         = "secure-server"
    Owner           = "cloud-engineering-team"
    CostCenter      = "IT-001"
    ManagedBy       = "terraform"
    BackupPolicy    = "daily"
    SecurityLevel   = "high"
    Compliance      = "SOC2"
    Version         = "1.0.0"
  }
}

# Apply tags to all resources by updating the existing resources
# This would be done by adding tags = local.common_tags to each resource 