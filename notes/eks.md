## How to access k8s api in EKS

1. In some way login from the terminal in AWS CLI, credential keys, assume role, etc

```bash
#Confirm identity
aws sts get-caller-identity
```

2. Update kubeconfig (~/.kube/config) with:

```bash
aws eks --region <region> update-kubeconfig --name <cluster_name>
```
