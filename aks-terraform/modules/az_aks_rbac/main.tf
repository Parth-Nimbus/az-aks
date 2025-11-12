# Get the security groups for the cluster
# locals {
#   all_security_group_ids = values(module.aad_security_groups.security_group_ids)
# }
resource "kubernetes_role" "namespace_admin" {
  for_each = toset(var.namespaces)

  metadata {
    name      = "namespace-admin"
    namespace = each.key
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "configmaps", "secrets"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["deployments", "replicasets"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }
}

resource "kubernetes_role_binding" "namespace_admin_binding" {
  for_each = toset(var.namespaces)

  metadata {
    name      = "namespace-admin-binding"
    namespace = each.key
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.namespace_admin[each.key].metadata[0].name
  }

  subject {
    kind      = "Group"
    # name      = var.azure_ad_group_name
    name      = one([ for k, v in var.all_security_group_ids : k  if contains(k, "devops")
                    ]) # Assuming the DevOps group is for ns-admin
    api_group = "rbac.authorization.k8s.io"
  }
}