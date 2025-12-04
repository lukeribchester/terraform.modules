# Terraform Modules

This repository contains the following shared Terraform modules:

## Google Cloud Platform

- `org_policy`
- `project`
- `iam_workload_identity_pool`
- `artifact_registry_repository`
- `cloud_run_service`

# Usage

Create a `module` block that uses this Git repository as the source:

```hcl
module "project" {
  source = "git@github.com:lukeribchester/terraform.modules.git//modules/project?ref=v1.0.0"
}
```
