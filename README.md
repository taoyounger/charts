# charts

## helm chart

```shell
helm repo add spiderchart https://spidernet-io.github.io/charts
helm repo update
```

## charts

### ofed-driver

chart for deploying OFED driver to install the driver of Mellanox network card

release chart
```shell
git tag ofe-driver-vXX.YY.ZZ 
git push --tags
```

refer to [document](./ofed-driver/Readme.md) for usage
 
### rdma-tools

images including kinds of RDMA tools for debugging

release chart and images
```shell
git tag rdma-tools-vXX.YY.ZZ 
git push --tags
```

refer to [document](./rdma-tools/Readme.md) for usage

