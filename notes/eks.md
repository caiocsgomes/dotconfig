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

## How to get root access to a bottlerocket ami using ssm session manager

- Bottlerocket comes by default with the ssm agent
- We need to provide the EC2 instance with the role to access ssm -> https://github.com/bottlerocket-os/bottlerocket/blob/develop/QUICKSTART-EKS.md#enabling-ssm
- Access the instance using the AWS CLI -> https://github.com/bottlerocket-os/bottlerocket?tab=readme-ov-file#control-container
```bash
aws ssm start-session --target i-0e65b23d43ced3673
```
- Then enter the admin container and gain a shell as root -> https://github.com/bottlerocket-os/bottlerocket?tab=readme-ov-file#admin-container
```bash
enter-admin-container
sheltie
```
