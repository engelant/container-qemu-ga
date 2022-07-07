FROM docker.io/debian:11-slim

RUN apt update && apt install -y systemd-sysv qemu-guest-agent

ENTRYPOINT ["/usr/bin/qemu-ga"]
