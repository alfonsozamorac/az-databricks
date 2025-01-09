

provider "databricks" {
  host = var.host
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

data "azurerm_client_config" "config" {}
data "azuread_client_config" "config" {}
data "databricks_current_user" "me" {}


data "databricks_node_type" "smallest" {
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "single_node" {
  count = var.create_cluster ? 1 : 0

  cluster_name            = "Single Node Example"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 20

  spark_conf = {
    "spark.databricks.cluster.profile" : "singleNode"
    "spark.master" : "local[*]"
  }

  custom_tags = {
    "ResourceClass" = "SingleNode"
  }
}
