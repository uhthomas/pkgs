# pkgs

## Customisation

This is a fork of sidero/pkg which uses Linux mainline (6.3-rc4). This is mainly
to enable support for Intel Arc which is only available from Linux 6.2 onwards.

To publish the kernel:

```sh
❯ make kernel USERNAME=uhthomas PLATFORM=linux/amd64 PUSH=true
```

To publish the installer:

```sh
❯ INSTALLER_VERSION=v1.4.0-alpha.4
❯ IMAGE_NAME="ghcr.io/uhthomas/talos-installer:$INSTALLER_VERSION"
❯ DOCKER_BUILDKIT=0 docker build --build-arg RM="/lib/modules" -t "$IMAGE_NAME" . && docker push "$IMAGE_NAME"
```

To upgrade the node:

```sh
❯ talosctl upgrade --image ghcr.io/uhthomas/talos-installer:v1.4.0-alpha.4 --preserve=true
```

References:

- https://www.talos.dev/v1.4/advanced/customizing-the-kernel/
- https://www.talos.dev/v1.4/advanced/proprietary-kernel-modules/

---

![Dependency Diagram](/deps.png)

This repository produces a set of packages that can be used to build a rootfs suitable for creating custom Linux distributions.
The packages are published as a container image, and can be "installed" by simply copying the contents to your rootfs.
For example, using Docker, we can do the following:

```docker
FROM scratch
COPY --from=<registry>/<organization>/<pkg>:<tag> / /
```

## Resources

- https://gcc.gnu.org/onlinedocs/gccint/Configure-Terms.html
- https://wiki.osdev.org/Target_Triplet
