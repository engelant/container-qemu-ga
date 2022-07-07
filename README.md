podman build . -t qemu-ga --no-cache
podman run --privileged --rm -it --entrypoint=/bin/bash qemu-ga
