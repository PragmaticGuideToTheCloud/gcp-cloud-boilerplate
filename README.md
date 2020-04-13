01 INFRA
========

* GCP ✓
* VPC ✓
* GKE ✓
* SQL ✓
* MEMORYSTORE ✓
* bastion + wireguard ✓

Cloud details:

```
VPC
    NETWORK:
        google_compute_network
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
    ACCOUNTS
        google_service_account
        google_project_iam_member
    FIREWALL
        google_compute_firewall
    INSTANCES
        google_container_cluster
        google_container_node_pool
    PROVISIONING
        kubernetes_service_account
        kubernetes_cluster_role_binding

SQL
    DATABASE
        google_sql_database_instance
        google_sql_user
        google_sql_database

MEMORYSTORE
    MEMORYSTORE
        google_redis_instance
```

Parameters:

* GKE in zone / GKE in region
* GKE with autoscaling / GKE without autoscaling
* GKE nodes: regular / preemptible
* GKE node: n1-standard-1, n1-standard-2, etc.
* GKE number of nodes
* GKE number of pods
