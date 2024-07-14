## Fast reference for when I need to work again with Prometheus
### TODO: Add notes about range and instant vector, about timeseries, about labels, about metric data types, etc
### https://stackoverflow.com/questions/68223824/prometheus-instant-vector-vs-range-vector

## Adding a pod, service, etc to kube-prometheus-stack

After installing the kube-prometheus-stack, we need to add the pod or service monitor. 
Pay attention to the release label and also the monitor needs to be in the same namespace as the pod or service to be monitored.
TargetPort as a number instead of a name works better.
Good reads:
- https://docs.digitalocean.com/products/marketplace/catalog/kubernetes-monitoring-stack/#:~:text=The%20kube%2Dprometheus%2Dstack%20is,from%20the%20kubernetes%2Dmixin%20project.
- https://github.com/prometheus-operator/prometheus-operator/issues/3119
- https://github.com/prometheus-operator/prometheus-operator/tree/main/example/user-guides/getting-started
