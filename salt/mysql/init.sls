mysql-server:
  pkg:
    - installed
    - pkgs:
      - mariadb-server
      - python-mysqldb
  service:
    - running
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql-server
  mysql_user:
    - present
    - name: root
    - password: {{ pillar.mysql_root_password }}
    - require:
      - service: mysql

/etc/mysql/conf.d/file-per-table.cnf:
 file.managed:
  - source: salt://mysql/file-per-table.cnf
  - template: jinja
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: mysql

/root/.my.cnf:
 file.managed:
  - source: salt://mysql/my.cnf
  - template: jinja
  - mode: 600
  - user: root
  - group: root

zabbixdb:
  mysql_database.present:
    - name: zabbix
    - character_set: utf8
    - collate: utf8_czech_ci
  mysql_user.present:
    - name: zabbix
    - password: {{ pillar.zabbix.mysqlpasswd }}
  mysql_grants.present:
    - database: zabbix.*
    - grant: ALL PRIVILEGES
    - user: zabbix
  require:
    - service: mysql
