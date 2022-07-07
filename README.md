podman build . -t qemu-ga --no-cache

podman run --privileged --rm -it -v /dev:/dev -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket --entrypoint=/bin/sh qemu-ga
