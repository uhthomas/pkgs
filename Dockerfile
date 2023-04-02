FROM scratch AS customization
COPY --from=ghcr.io/uhthomas/kernel:e0396a5@sha256:6bd711c58726fa89c46424edb6378f67a7ab5a69b9cbddf0453909d836f4fe9a /lib/modules /lib/modules

FROM ghcr.io/siderolabs/installer:v1.4.0-alpha.4
COPY --from=ghcr.io/uhthomas/kernel:e0396a5@sha256:6bd711c58726fa89c46424edb6378f67a7ab5a69b9cbddf0453909d836f4fe9a /boot/vmlinuz /usr/install/amd64/vmlinuz
