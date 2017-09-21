openssh-server:
  pkg:
    - installed

ssh:
  service.running:
    - name: ssh
    - enable: True

/etc/ssh/sshd_config:
 file.managed:
  - source: salt://ssh/sshd_config
  - mode: 644
  - user: root
  - group: root
  - template: jinja
  - watch_in:
      - service: ssh

/home/petr/.ssh/config:
 file.managed:
  - source: salt://ssh/config
  - mode: 600
  - user: petr
  - group: users

/home/petr/.ssh/rc:
 file.managed:
  - source: salt://ssh/rc
  - mode: 700
  - user: petr
  - group: users

/home/petr/.ssh/zabbixagent:
 file.managed:
  - source: salt://ssh/zabbixagent
  - mode: 700
  - user: petr
  - group: users
