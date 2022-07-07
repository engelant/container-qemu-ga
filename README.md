Intended to be rund on fedora coreos inside qemu.
Provides alpine quemu-guest-agent, with /sbin/shutdown for host power management (shutdown/reboot) trough DBUS.

```yaml
variant: fcos
version: 1.4.0
systemd:
  units:
    - name: qemu-guest-agent.service
      enabled: true
      contents: |
        [Unit]
        Description=QEMU Guest Agent
        ConditionPathExists=/dev/virtio-ports/org.qemu.guest_agent.0
        
        [Service]
        podman run --rm --name qemu-ga --privileged --net=host -v /dev:/dev -v /etc/os-release:/etc/os-release:ro -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket ghcr.io/engelant/container-qemu-ga
        
        [Install]
        WantedBy=multi-user.target
```