![Terraform](https://img.shields.io/badge/Terraform-1.15+-623CE4?logo=terraform&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-CI-D24939?logo=jenkins&logoColor=white)
![Solace](https://img.shields.io/badge/Solace-PubSub+-00C7B7)
![CI/CD](https://img.shields.io/badge/CI/CD-Automated-blue)
![IaC](https://img.shields.io/badge/IaC-Terraform-purple)
![License](https://img.shields.io/badge/License-MIT-green)

# 🚀 Terraform Solace Queue Automation

> Enterprise-ready Infrastructure as Code (IaC) solution for automating Solace PubSub+ Queue provisioning using Terraform and Jenkins.

---

### ✨ Highlights

- 🏗️ Infrastructure as Code using Terraform
- 🚀 Automated Jenkins CI/CD Pipeline
- 🔐 Secure Credential Management
- 🌍 Environment-specific Configuration
- 📦 Reusable Terraform Modules
- ✅ Manual Approval Workflow
- 📋 Archived Terraform Plans

---

## 🏗️ Architecture

```mermaid
flowchart TB

    DEV[👨‍💻 Developer]

    GIT[GitHub Repository]

    JENKINS[Jenkins CI/CD Pipeline]

    INIT[Terraform Init]

    FMT[Terraform Format Check]

    VALIDATE[Terraform Validate]

    PLAN[Terraform Plan]

    APPROVAL[Manual Approval]

    APPLY[Terraform Apply]

    MODULE[Terraform Queue Module]

    PROVIDER[Solace Terraform Provider]

    SOLACE[(Solace PubSub+ Cloud)]

    QUEUE[(Queue Created)]

    DEV -->|Push Code| GIT
    GIT --> JENKINS

    JENKINS --> INIT
    INIT --> FMT
    FMT --> VALIDATE
    VALIDATE --> PLAN
    PLAN --> APPROVAL
    APPROVAL --> APPLY

    APPLY --> MODULE
    MODULE --> PROVIDER
    PROVIDER --> SOLACE
    SOLACE --> QUEUE

    classDef github fill:#24292e,color:#ffffff
    classDef jenkins fill:#D24939,color:#ffffff
    classDef terraform fill:#623CE4,color:#ffffff
    classDef solace fill:#00A3E0,color:#ffffff
    classDef developer fill:#2ECC71,color:#ffffff

    class DEV developer
    class GIT github
    class JENKINS jenkins
    class INIT,FMT,VALIDATE,PLAN,APPROVAL,APPLY,MODULE terraform
    class PROVIDER,SOLACE,QUEUE solace
```

---

## Features

- Infrastructure as Code using Terraform
- Automated Solace PubSub+ Queue Creation
- Jenkins CI/CD Pipeline
- Reusable Terraform Modules
- Multi-Queue Deployment using `for_each`
- Environment-specific Configuration
- Secure Jenkins Credentials
- Terraform Format Validation
- Terraform Configuration Validation
- Manual Approval before Deployment
- Archived Terraform Execution Plan
- Timestamped Jenkins Builds
- Build Retention Policy
- Concurrent Build Protection

---

## Project Structure

```text
terraform-solace-queue-automation/
│
├── Jenkinsfile
│
├── terraform/
│   ├── environments/
│   │   ├── dev.tfvars
│   │   ├── pqa.tfvars
│   │   ├── qa.tfvars
│   │   └── prod.tfvars
│   │
│   ├── modules/
│   │   └── queue/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
│   │
│   ├── providers.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── queue.tf
│   ├── outputs.tf
│   └── versions.tf
│
└── README.md
```

---

## Technologies Used

| Technology | Purpose |
|------------|---------|
| Terraform | Infrastructure as Code |
| Jenkins | CI/CD Pipeline |
| Solace PubSub+ | Messaging Platform |
| GitHub | Source Code Management |

---

## Pipeline Flow

```text
Checkout
    │
Terraform Init
    │
Terraform Format Check
    │
Terraform Validate
    │
Terraform Plan
    │
Archive tfplan
    │
Manual Approval
    │
Terraform Apply
    │
Solace Queue Created
```

---

## Prerequisites

- Terraform
- Jenkins
- Git
- Solace PubSub+ Cloud
- Jenkins Credentials
- GitHub Repository

---

## Setup

### Clone Repository

```bash
git clone https://github.com/your-repository.git
```

### Initialize Terraform

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

---

## Jenkins Pipeline

Describe how the pipeline works.

(Add screenshots later.)

---

## Screenshots

- Jenkins Dashboard
- Pipeline Execution
- Solace Queue
- GitHub Repository

(Add later.)

---

## 📈 Project Status

| Component | Status | Remarks |
|-----------|--------|---------|
| Terraform Queue Provisioning | ✅ Complete | Production Ready |
| Jenkins CI/CD Pipeline | ✅ Complete | Production Ready |
| Terraform Modules | ✅ Complete | Reusable |
| Multi Queue Support | ✅ Complete | `for_each` |
| Environment Configuration | ✅ Complete | DEV |
| Manual Approval | ✅ Complete | Jenkins Input Step |
| Terraform Format Check | ✅ Complete | `terraform fmt` |
| Terraform Validation | ✅ Complete | `terraform validate` |
| Plan Archive | ✅ Complete | tfplan archived |
| PQA Environment | 🚧 Planned | Next Phase |
| QA Environment | 🚧 Planned | Next Phase |
| PROD Environment | 🚧 Planned | Next Phase |
| Remote Terraform State | 📋 Planned | Future Enhancement |
| Queue Subscription Support | 📋 Planned | Future Enhancement |

## Future Enhancements

- Remote Terraform State
- Queue Subscriptions
- Topic Endpoints
- ACL Profiles
- Client Usernames
- Multiple Environment Pipelines
- Pull Request Validation
- Email Notifications
- Teams Notifications

---

## Author

**Rohit Prasad**

SAP BTP Integration Suite Developer | Terraform | Jenkins | Solace PubSub+
