# Secure Server Infrastructure - Azure Cloud Engineering Project

## 🏗️ **Project Overview**

This project demonstrates a production-ready, secure infrastructure setup on Azure using Infrastructure as Code (IaC) principles. It showcases best practices for cloud engineering including security, monitoring, backup, and CI/CD.

## 🎯 **Key Features**

### **Security-First Architecture**
- ✅ **Bastion Host Pattern**: Secure access to private resources
- ✅ **Network Segmentation**: Public/Private subnet isolation
- ✅ **Azure Key Vault**: Centralized secrets management
- ✅ **Advanced Threat Protection**: Microsoft Defender for Cloud
- ✅ **Network Security Groups**: Granular traffic control

### **Monitoring & Observability**
- ✅ **Azure Monitor**: Comprehensive monitoring and alerting
- ✅ **Application Insights**: Application performance monitoring
- ✅ **Log Analytics**: Centralized logging and analysis
- ✅ **Custom Alerts**: Proactive issue detection

### **Disaster Recovery**
- ✅ **Azure Backup**: Automated backup with retention policies
- ✅ **Geo-Redundant Storage**: Cross-region data protection
- ✅ **Recovery Procedures**: Documented DR processes

### **DevOps & Automation**
- ✅ **Terraform IaC**: Version-controlled infrastructure
- ✅ **GitHub Actions**: Automated CI/CD pipeline
- ✅ **Code Quality**: Format checking and validation
- ✅ **Environment Management**: Staging/Production separation

## 🏛️ **Architecture Diagram**

```
Internet
    │
    ▼
┌─────────────────┐
│   Bastion Host  │ ← Public IP: 172.202.46.67
│   (10.0.1.4)    │
└─────────────────┘
    │
    ▼ (SSH)
┌─────────────────┐
│   App Server    │ ← Private IP: 10.0.2.4
│   (10.0.2.4)    │
└─────────────────┘
    │
    ▼ (Database)
┌─────────────────┐
│   MySQL DB      │ ← Private Endpoint
│   (10.0.2.5)    │
└─────────────────┘
```

## 🚀 **Quick Start**

### **Prerequisites**
- Azure CLI installed and authenticated
- Terraform >= 1.0.0
- SSH key pair
- **Before running `terraform apply`, see the [Providing Sensitive and Required Variables](#-providing-sensitive-and-required-variables) section below to supply your own credentials and secrets.**

### **Deployment**
```bash
# Clone the repository
git clone <repository-url>
cd SecureServer

# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the infrastructure
# ⚠️ Make sure you have provided all required variables as described in the [Providing Sensitive and Required Variables](#-providing-sensitive-and-required-variables) section.
terraform apply
```

### **Access the Infrastructure**
```bash
# Connect to bastion host
ssh adminuser@172.202.46.67

# From bastion, connect to app server
ssh adminuser@10.0.2.4
```

## 📊 **Infrastructure Components**

| Component | Purpose | Location |
|-----------|---------|----------|
| **Bastion Host** | Secure jump server | Public Subnet (10.0.1.0/24) |
| **App Server** | Application hosting | Private Subnet (10.0.2.0/24) |
| **MySQL Database** | Data persistence | Private Subnet |
| **Key Vault** | Secrets management | Private with service endpoints |
| **Backup Vault** | Disaster recovery | Geo-redundant |
| **Monitor** | Observability | Global |

## 🔒 **Security Features**

### **Network Security**
- **Zero Trust Architecture**: No direct internet access to private resources
- **Network Security Groups**: Restrictive traffic policies
- **Private Endpoints**: Secure database connectivity

### **Identity & Access**
- **SSH Key Authentication**: No password-based access
- **Azure Key Vault**: Secure credential storage
- **Managed Identities**: Service-to-service authentication

### **Compliance & Governance**
- **Resource Tagging**: Cost allocation and governance
- **Audit Logging**: Complete activity tracking
- **Security Center**: Continuous security assessment

## 📈 **Monitoring & Alerting**

### **Metrics Tracked**
- VM CPU/Memory utilization
- Database performance
- Network traffic patterns
- Security events

### **Alert Conditions**
- High CPU usage (>90%)
- Failed authentication attempts
- Backup failures
- Security threats detected

## 🔄 **CI/CD Pipeline**

### **Automated Workflows**
1. **Code Quality**: Terraform format and validation
2. **Security Scan**: Dependency and configuration scanning
3. **Infrastructure Testing**: Plan review and approval
4. **Automated Deployment**: Safe infrastructure updates

### **Environment Strategy**
- **Development**: Feature testing
- **Staging**: Pre-production validation
- **Production**: Live infrastructure

## 💰 **Cost Optimization**

### **Resource Sizing**
- **Bastion**: Standard_B1s (minimal resources)
- **App Server**: Standard_B1s (scalable)
- **Database**: B_Standard_B1ms (burstable)

### **Cost Monitoring**
- **Azure Cost Management**: Budget tracking
- **Resource Tagging**: Cost allocation
- **Right-sizing**: Performance-based scaling

## 🛠️ **Maintenance & Operations**

### **Backup Strategy**
- **Daily Backups**: Automated at 23:00 UTC
- **Retention Policy**: 7 daily, 4 weekly, 12 monthly
- **Geo-redundant**: Cross-region protection

### **Update Management**
- **Automated Patching**: Security updates
- **Maintenance Windows**: Scheduled downtime
- **Rollback Procedures**: Quick recovery

## 📚 **Documentation**

- [Architecture Decision Records](./docs/adr/)
- [Security Guidelines](./docs/security.md)
- [Troubleshooting Guide](./docs/troubleshooting.md)
- [Cost Optimization](./docs/cost-optimization.md)

## 🤝 **Contributing**

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests and documentation
5. Submit a pull request

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔑 Providing Sensitive and Required Variables

Some variables (such as `db_admin_password`, `subscription_id`, and `ssh_public_key`) are required and should be provided securely. You can supply them in one of the following ways:

### 1. Using the CLI

Pass variables directly when running Terraform:
```sh
terraform apply \
  -var="db_admin_password=YOUR_DB_PASSWORD" \
  -var="subscription_id=YOUR_SUBSCRIPTION_ID" \
  -var="ssh_public_key=YOUR_PUBLIC_KEY"
```

### 2. Using a `.tfvars` File

Create a file named `terraform.tfvars` (which is gitignored by default):
```hcl
db_admin_password   = "YOUR_DB_PASSWORD"
subscription_id     = "YOUR_SUBSCRIPTION_ID"
ssh_public_key      = "YOUR_PUBLIC_KEY"
```
Then run:
```sh
terraform apply
```

### 3. Using Environment Variables

Terraform will automatically pick up variables set as environment variables with the `TF_VAR_` prefix:
```sh
export TF_VAR_db_admin_password=YOUR_DB_PASSWORD
export TF_VAR_subscription_id=YOUR_SUBSCRIPTION_ID
export TF_VAR_ssh_public_key=YOUR_PUBLIC_KEY
terraform apply
```

**Never commit sensitive values or `.tfvars` files to version control.**

## 🏆 **Cloud Engineering Skills Demonstrated**

- **Infrastructure as Code**: Terraform best practices
- **Security Architecture**: Defense in depth
- **Monitoring & Observability**: Full-stack visibility
- **DevOps Practices**: CI/CD automation
- **Cost Management**: Resource optimization
- **Disaster Recovery**: Business continuity
- **Compliance**: Security and governance
- **Documentation**: Professional standards

---
