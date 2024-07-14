## Remove namespace with pending resources

This is usually due to resources that have finalizers pending that were not removed by the proper controller. First go over all the remaining resources in the namespace:


```sh
kubectl api-resources --verbs=list --namespaced -o name \
| xargs -n 1 kubectl get --show-kind --ignore-not-found -n <namespace>
```

Then edit them and remove the finalizers in the resource's metadata.


## Using Secret Store CSI Driver with EKS

Assuming the controller is already installed...

```yaml
# First be sure to have the service account with access to the secrets in secrets manager
apiVersion: v1
kind: ServiceAccount
metadata:
  name: service-account-name
  namespace: namespace-name
  annotations:
    eks.amazonaws.com/role-arn: "secret-resource-arn"
```
```yaml
apiVersion: secrets-store.csi.x-k8s.io/v1
kind: SecretProviderClass
metadata:
  name: secret-provider-name
  namespace: namespace-name
spec:
  provider: aws
  secretObjects: # Option to sync the secrets manager secret with a k8s secret
  - secretName: k8s-secret-object-name # k8s secret created
    type: Opaque
    data:
    - key: k8s-object-key # k8s secret key
      objectName: object-alias # This is the alias created below or it could be the name too for secrets that don't have keys
    - key: k8s-object-key-1
      objectName: object-alias-1
    - key: k8s-object-key-2
      objectName: secrets-manager-resource-arn-1
  parameters:
    objects: |
      - objectName: "secrets-manager-resource-arn"
        objectType: "secretsmanager"
        jmesPath:
          - path: secrets-manager-secret-key
            objectAlias: object-alias
          - path: secrets-manager-secret-key-1
            objectAlias: object-alias-1
      - objectName: "secrets-manager-resource-arn-1"
        objectType: "secretsmanager"
```

And then mount the secret: https://github.com/kubernetes-sigs/secrets-store-csi-driver/blob/release-1.4/test/bats/tests/vault/pod-vault-inline-volume-secretproviderclass.yaml

The secret will only be sync (created as a k8s resource) as a k8s secret if mounted on a pod

## Port forwarding

```sh
kubectl -n kube-prometheus-stack port-forward svc/kube-prometheus-stack-prometheus 9090:8080
```

## Remove finalizers of all pods 

```sh
kc get po | grep -i term |  awk -F' ' '{print $1}' | xargs -I {}  kubectl -n runners patch pod {} -p '{"metadata":{"finalizers":null}}'
```

## Fast dns test in pod
```sh
kubectl run test-nslookup --image=busybox:1.28 --rm -it --restart=Never -- nslookup kubernetes.default.svc
```

## Sum memory usage of all nodes
```sh
# The 4 is memory column number
kubectl top nodes --no-headers | awk '{if(NR>0) gsub(/Mi/,""); print $4}' | paste -sd+ - | bc
```
