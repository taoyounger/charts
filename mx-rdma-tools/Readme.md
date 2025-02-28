# mx rdma tools

images including kinds of RDMA tools for debugging for mx

## image tag

the image tag is same with the chart version by default.

## chart tag and release chart

the version of chart is start from 0.0.1,

tag the code and the CI will automatically release a chart. the image tag will be **chart version** by default. example:

```shell
git tag mx-rdma-tools-v0.0.1
git push --tags
```

## deploy

```shell
helm repo add spiderchart https://spidernet-io.github.io/charts
helm repo update spiderchart
helm search repo mx-rdma-tools

# run daemonset on worker1 and worker2 
cat <<EOF > values.yaml
# for china user , it could add these to use a domestic registry
#image:
#  registry: ghcr.m.daocloud.io
 
# just run daemonset in nodes 'worker1' and 'worker2'
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
# extraAnnotations:
#   v1.multus-cni.io/default-network: spiderpool/calico
#   k8s.v1.cni.cncf.io/networks: |-
#       [{"name":"gpu1-sriov","namespace":"spiderpool"},
#        {"name":"gpu2-sriov","namespace":"spiderpool"}]

# sriov resource
# resources:
#   limits:
#     spidernet.io/gpu1sriov: 1
#     spidernet.io/gpu2sriov: 1
    # nvidia.com/gpu: 1

# using hostNetwork
hostnetwork: false

#securityContext:
#  # required by gdrcopy test
#  privileged: true
#  capabilities:
#    add: [ "IPC_LOCK" ]
EOF

# for China user, add `--set image.registry=ghcr.m.daocloud.io`
helm install rdma-tools spiderchart/mx-rdma-tools -f ./values.yaml
```

## tools in the image

os: ubuntu22.04

| tools         | version                                  | updated time |
|---------------|------------------------------------------|--------------|
| perftest      | 24.04.0-0.41                             | 2024.7.30    |
| Bandwidthtest | v12.5                                    | 2024.7.30    |
| tcpdump       | 4.99.5                                   | 2025.2.27    |
