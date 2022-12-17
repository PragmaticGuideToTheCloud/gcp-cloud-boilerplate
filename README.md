01 INFRA
========

* GCP ✓
* PROJECT: PRODUCT/ENV ✓
* VPC ✓
* GKE ✓
* GSA ✓
* SQL ✓
* MEMORYSTORE ✓
* bastion + wireguard ✓

Cloud details:

```
PROJECT
    BUCKET
        google_storage_bucket
VPC
    NETWORK:
        google_compute_network
        google_compute_subnetwork (custom)
        google_compute_firewall (custom)
        google_compute_router
        google_compute_router_nat
        google_compute_global_address
        google_service_networking_connection
    BASTION:
        random_id
        google_compute_instance
        google_compute_firewall
        local_file
        null_resource

GKE
    INSTANCES
        google_container_cluster
        google_container_node_pool


GSA
    ACCOUNTS
        google_service_account
        google_project_iam_custom_role
        google_project_iam_member

SQL
    DATABASE
        google_sql_database_instance
        google_sql_user
        google_sql_database

MEMORYSTORE
    MEMORYSTORE
        google_redis_instance
```
