# az-databricks

## Overview
This repository provides Terraform configurations to automate the provisioning of an Azure Databricks workspace and a single-node cluster, tailored for development, testing, or prototyping. It simplifies the process of setting up a functional Databricks environment in Azure with minimal effort and configuration.

## Documentation
* [Databricks Terraform Registry](https://registry.terraform.io/providers/databricks/databricks/latest/docs)
* [Azure Terraform Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Prerequisites
The Azure CLI must be set up and credentials configured

## Installation

1. Replace and export with your correct value:

  ```bash
  export TF_VAR_resourge="?"
  ```

2. Create databricks workspace:

  ```bash
  terraform -chdir="./terraform/modules/workspace" init -upgrade
  terraform -chdir="./terraform/modules/workspace" apply --auto-approve
  ```

3. Export host variable:

  ```bash
  export TF_VAR_host="$(terraform -chdir="./terraform/modules/workspace" output -raw workspace_url)"
  ```

4. Create single node cluster:

  ```bash
  terraform -chdir="./terraform/modules/databricks" init -upgrade
  terraform -chdir="./terraform/modules/databricks" apply --auto-approve
  ```

## Clean resources

  ```bash
  terraform -chdir="./terraform/modules/databricks" destroy --auto-approve
  terraform -chdir="./terraform/modules/workspace" destroy --auto-approve
  ```
