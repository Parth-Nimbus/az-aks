cluster_name = "af-aks-cluster"

# resource_group_location = [

# ]
resource_prefix = "af-nonprod"
resource_group_name = "rg"
#kv_name = "af-aks-keyvault"
sp_name = "af-aks-service-principal"
namespaces = ["dev", "tst"]
# dns_prefix = [

# ]

# node_count = [

# ]

# vm_size = [

# ]

# client_id = [

# ]

# client_secret = [

# ]

kubernetes_version = "1.32.6"

# admin_group_object_id = [

# ]
security_groups = [
  {
    name        = "aks-admins"
    description = "Cluster administrators with full access"
  },
  {
    name        = "aks-devops"
    description = "DevOps team responsible for CI/CD and infra"
  },
  {
    name        = "aks-viewers"
    description = "Read-only access to AKS resources"
  }
]

