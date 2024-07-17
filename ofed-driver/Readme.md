# ofed driver

refer to nvidia network operator [ofed-driver-ds.yaml](https://github.com/Mellanox/network-operator/blob/master/manifests/state-ofed-driver/0050_ofed-driver-ds.yaml)
and [values.yaml](https://github.com/Mellanox/network-operator/blob/master/deployment/network-operator/values.yaml#L196)

the image tag is with a format `{driverVersion}-${OSName}${OSVer}-${Arch}`

refer to [nvidia available image tag](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/mellanox/containers/doca-driver/tags)

for example:
- 24.04-0.6.6.0-0-ubuntu20.04-amd64
- 24.04-0.6.6.0-0-ubuntu22.04-amd64
- 24.04-0.6.6.0-0-ubuntu24.04-amd64

## deploy

```shell
helm repo add spiderchart https://spidernet-io.github.io/charts
helm repo update
helm search repo ofed-driver

helm install spiderchart/ofed-driver  ofed-driver -n kube-system \
    --set image.OSName="ubuntu" \
    --set image.OSVer="22.04" \
    --set image.Arch="amd64"
```

## release 

```shell
git tag ofe-driver-vXX.YY.ZZ 
git push --tags
```
