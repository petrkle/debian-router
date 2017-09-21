logrotate:
  pkg.installed:
    - name: logrotate

/etc/logrotate.conf:
 file.managed:
  - source: salt://logrotate/logrotate.conf
  - mode: 644
  - user: root
  - group: root

/etc/logrotate.d/php-fpm:
 file.managed:
  - source: salt://logrotate/php-fpm
  - mode: 644
  - user: root
  - group: root

/etc/logrotate.d/nginx:
 file.managed:
  - source: salt://logrotate/nginx
  - mode: 644
  - user: root
  - group: root
