# Kubernetes RBAC

This prototype uses namespace-scoped RBAC instead of cluster-wide permissions.

The OpenCTI workload uses a dedicated ServiceAccount bound to a minimal Role through a RoleBinding. This follows least privilege principles and avoids using the default service account or cluster-admin permissions.
