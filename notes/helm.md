## Get helm code from an existing chart
```bash
helm fetch repo/chart-name --untar

# example
helm repo add eks https://aws.github.io/eks-charts
helm fetch eks/aws-load-balancer-controller --untar
```
## Add a repo
```bash
helm repo add repo-name repo-url
```

## List charts under a repository
```bash
helm search repo repo-name
```

## List all installed charts
```bash
helm list -A
```

## Update repo
```bash
helm repo update repo-name
```

## Template local chart
```bash
helm template chart-name(any name) chart-path(can be . if in the same directory)
```

## Template chart in repo
```bash
helm template repo/chart-name --version 2024.1.6 --debug -f values.yaml
```

## Template specifig version
```bash
helm template chart-repo/chart-name --version 1.0.0
```
