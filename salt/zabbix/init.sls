zabbixrepo:
  pkgrepo.managed:
    - humanname: zabbix
    - name: deb http://repo.zabbix.com/zabbix/3.4/debian stretch contrib non-free main
    - file: /etc/apt/sources.list.d/zabbix.list
    - key_url: salt://zabbix/zabbix-official-repo.key

zabbix-server-mysql:
  pkg:
    - installed
  service:
    - running
    - name: zabbix-server
    - enable: True

zabbix-agent:
  pkg:
    - installed
  service:
    - running
    - name: zabbix-agent
    - enable: True

zabbix-get:
  pkg:
    - installed

/etc/zabbix/zabbix_server.conf:
 file.managed:
  - source: salt://zabbix/zabbix_server.conf
  - mode: 644
  - user: root
  - group: root
  - template: jinja
  - watch_in:
      - service: zabbix-server

/etc/zabbix/zabbix_agentd.conf:
 file.managed:
  - source: salt://zabbix/zabbix_agentd.conf
  - mode: 644
  - user: root
  - group: root
  - template: jinja
  - watch_in:
      - service: zabbix-agent

/usr/local/bin/nginx-stats.sh:
 file.managed:
  - source: salt://zabbix/nginx-stats.sh
  - mode: 700
  - user: zabbix
  - group: zabbix
