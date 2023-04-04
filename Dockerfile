FROM scratch AS customization
COPY --from=ghcr.io/uhthomas/kernel:6a83361@sha256:59543e068065f82d5522ce90ed07f50fc7b112183ce79ef041f235ebd39f81bf       /lib/modules /lib/modules

FROM ghcr.io/siderolabs/installer:v1.4.0-alpha.4
COPY --from=ghcr.io/uhthomas/kernel:6a83361@sha256:59543e068065f82d5522ce90ed07f50fc7b112183ce79ef041f235ebd39f81bf       /boot/vmlinuz /usr/install/amd64/vmlinuz
