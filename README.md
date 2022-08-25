# debug-net

This image is pushed into the github registry(ghcr.io) in the following namespace: ghcr.io

Image name:
```shell
ghcr.io/ppc64le-cloud/debug-net:<TAG>
```

Valid tags are:
- `main`: always pointing to the latest code from the main branch
- `vx.x.x`: released image, e.g: `v0.0.1`
- `latest`: point to latest released version

This image is multi-arch manifest supporting the following architectures
- `linux/amd64`
- `linux/ppc64le`

## How to use this image

> Note: for all the references, `main` tag is being used in the following examples, feel free to change it to appropriate version if needed.

### Docker

```shell
docker run -ti ghcr.io/ppc64le-cloud/debug-net:main
```

### Podman

```shell
podman run -ti ghcr.io/ppc64le-cloud/debug-net:main
```

### Kubernetes

```shell
# Create an interactive debugging session on a node and immediately attach to it.
# The container will run in the host namespaces and the host's filesystem will be mounted at /host
kubectl debug node/<node_name> -it --image=ghcr.io/ppc64le-cloud/debug-net:main
```

### Openshift

```shell
# Debug a node as an administrator
# To use host binaries, run `chroot /host`
oc debug node/<node_name> --image=ghcr.io/ppc64le-cloud/debug-net:main
```