/etc/inittab:
  file.append:
    - text: 
      - "T0:23:respawn:/sbin/getty -L ttyS0 115200 linux"
