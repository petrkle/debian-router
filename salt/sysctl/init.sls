/etc/sysctl.d/local.conf:
 file.managed:
  - source: salt://sysctl/local.conf
  - mode: 644
  - user: root
  - group: root

run-sysctl-p:
  cmd.wait:
    - name: /sbin/sysctl --system
    - cwd: /etc/
    - runas: root
    - watch:
      - file: /etc/sysctl.d/local.conf
