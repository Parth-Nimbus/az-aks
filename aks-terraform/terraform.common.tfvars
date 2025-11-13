cluster_name = "af-aks-cluster"

# resource_group_location = [

# ]

resource_group_name = "af-aks-resource-group"
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
    name        = "af-aks-admins"
    description = "Cluster administrators with full access"
  },
  {
    name        = "af-aks-devops"
    description = "DevOps team responsible for CI/CD and infra"
  },
  {
    name        = "af-aks-viewers"
    description = "Read-only access to AKS resources"
  }
]

