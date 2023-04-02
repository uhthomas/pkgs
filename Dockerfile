FROM scratch AS customization
COPY --from=ghcr.io/uhthomas/kernel:507d2dc@sha256:bee15d816b948160d397b8fe5a951a40a66ca667df594a150e38805d4e6dbf1c /lib/modules /lib/modules

FROM ghcr.io/siderolabs/installer:v1.4.0-alpha.4
COPY --from=ghcr.io/uhthomas/kernel:507d2dc@sha256:bee15d816b948160d397b8fe5a951a40a66ca667df594a150e38805d4e6dbf1c /boot/vmlinuz /usr/install/amd64/vmlinuz
