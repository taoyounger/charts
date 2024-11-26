# charts

[![Chart Rdma Tools](https://github.com/spidernet-io/charts/actions/workflows/ChartRdma.yaml/badge.svg)](https://github.com/spidernet-io/charts/actions/workflows/ChartRdma.yaml)
[![Chart OFED](https://github.com/spidernet-io/charts/actions/workflows/ChartOfed.yaml/badge.svg)](https://github.com/spidernet-io/charts/actions/workflows/ChartOfed.yaml)
[![Nightly E2E](https://github.com/spidernet-io/charts/actions/workflows/night-ci.yml/badge.svg)](https://github.com/spidernet-io/charts/actions/workflows/night-ci.yml)

## helm chart

```shell
helm repo add spiderchart https://spidernet-io.github.io/charts
helm repo update
```

## charts

### ofed-driver

chart for deploying OFED driver to install the driver of Mellanox network card

release chart and images:

1. build the image from CI action

2. update the image and chart version in Chart

3. push the tag

```shell
git tag ofe-driver-vXX.YY.ZZ 
git push --tags
```

refer to [document](./ofed-driver/Readme.md) for usage
 
### rdma-tools

images including kinds of RDMA tools for debugging

release chart and images:

1. build the image from CI action

2. update the image and chart version in Chart

3. push the tag

```shell
git tag rdma-tools-vXX.YY.ZZ 
git push --tags
```

refer to [document](./rdma-tools/Readme.md) for usage

