FROM scratch AS customization
COPY --from=ghcr.io/uhthomas/kernel:5626afc /lib/modules /lib/modules

FROM ghcr.io/siderolabs/installer:v1.4.0-alpha.4
COPY --from=ghcr.io/uhthomas/kernel:5626afc /boot/vmlinuz /usr/install/amd64/vmlinuz
