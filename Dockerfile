FROM docker.io/alpine AS build

COPY shutdown /out/sbin/shutdown
RUN chmod +x /out/sbin/shutdown
RUN mkdir -p /out/etc/apk && cp -r /etc/apk/* /out/etc/apk/
RUN mkdir -p /out/var/run
RUN apk add --no-cache --initdb -p /out \
    dbus \
    qemu-guest-agent

FROM scratch
WORKDIR /
COPY --from=build /out /

ENTRYPOINT ["/usr/bin/qemu-ga"]
