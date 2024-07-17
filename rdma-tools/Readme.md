# rdma tools

images including kinds of RDMA tools for debugging

## release chart and images

```shell
git tag rdma-tools-vXX.YY.ZZ 
git push --tags
```

```shell
helm repo add spiderchart https://spidernet-io.github.io/charts
helm repo update
helm search repo rdma-tools

# run daemonset on worker1 and worker2 
cat <<EOF > values.yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/hostname
            operator: In
            values:
              - worker1
              - worker2

# sriov interfaces
extraAnnotations:
  v1.multus-cni.io/default-network: spiderpool/calico
  k8s.v1.cni.cncf.io/networks: |
    '[{"name":"gpu1-sriov","namespace":"spiderpool"},
      {"name":"gpu2-sriov","namespace":"spiderpool"}]'

# sriov resource
resources:
  limits:
    spidernet.io/gpu1sriov: 1
    spidernet.io/gpu2sriov: 1

#securityContext:
#  capabilities:
#    add: [ "IPC_LOCK" ]
EOF

helm install spiderchart/rdma-tools  rdma-tools -f ./values.yaml

```
