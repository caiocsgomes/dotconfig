## Get all pods names
```sh
kubectl get pods -o jsonpath='{.items[*].metadata.name}'
```

## Do something with each pod
```sh
for pod in $(k get pod -o jsonpath={'.items[*].metadata.name'}); do k get pod "$pod"; done
```
