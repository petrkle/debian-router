/mnt/data:
 mount.mounted:
   - device: /dev/sdb1
   - fstype: ext4
   - mkmnt: True
   - opts:
      - defaults,noatime
   - hidden_opts:
      - defaults,noatime
